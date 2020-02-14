package com.mvc.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.board.service.BoardExamService;
import com.mvc.common.controller.Controller;

public class DeleteBoardController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String num = request.getParameter("num");
		
		BoardExamService service = BoardExamService.getInstance();
		service.deleteBoardExam(num);
		
		return "/board_exam/getBoardExamList.do";
	}

}
