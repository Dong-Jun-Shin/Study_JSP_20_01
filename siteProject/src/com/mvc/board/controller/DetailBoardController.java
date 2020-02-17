package com.mvc.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.board.service.BoardExamService;
import com.mvc.board.vo.BoardExamVO;
import com.mvc.common.controller.Controller;

public class DetailBoardController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String num = request.getParameter("num");
		
		BoardExamService service = BoardExamService.getInstance();
		service.getReadCount(num); //조회수 증가
		
		BoardExamVO bvo = service.boardDetail(num);
		request.setAttribute("detail", bvo);
		
		return "/board_exam/detailBoard";
	}
}
