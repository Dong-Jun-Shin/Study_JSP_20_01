package com.mvc.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.board.service.BoardExamService;
import com.mvc.common.controller.Controller;

public class commentCntController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String num = request.getParameter("num");
		
		BoardExamService service = BoardExamService.getInstance();
		int count = service.getCommentCnt(num);
		
		request.setAttribute("resultData", count);
		
		return "/common/resultData";
	}

}
