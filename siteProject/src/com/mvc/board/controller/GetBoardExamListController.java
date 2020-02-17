package com.mvc.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.board.service.BoardExamService;
import com.mvc.board.vo.BoardExamVO;
import com.mvc.common.controller.Controller;

// Controller인터페이스를 구현해 만든 Sub컨트롤러
public class GetBoardExamListController implements Controller{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String search = request.getParameter("search");
		// 최초 요청 시 null 값 처리
		if(search==null) {
			search="all";
		}
		
		
		BoardExamVO bvo = new BoardExamVO();
		bvo.setSearch(search);
		bvo.setKeyword(request.getParameter("keyword"));
		
		BoardExamService service = BoardExamService.getInstance();
		ArrayList<BoardExamVO> list = service.getboardExamList(bvo);
		
		// 값을 유지하기 위한 구문
		request.setAttribute("list", list);
		request.setAttribute("data", bvo);
		
		return "/board_exam/getBoardExamList";
	}
}
