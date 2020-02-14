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
		BoardExamVO bvo = new BoardExamVO();
		bvo.setSearch(request.getParameter("search"));
		bvo.setKeyword(request.getParameter("keyword"));
		bvo.setSearch("all");
		
		BoardExamService service = BoardExamService.getInstance();
		ArrayList<BoardExamVO> list = service.getboardExamList(bvo);
		
		request.setAttribute("list", list);
		
		return "/board_exam/getBoardExamList";
	}
}
