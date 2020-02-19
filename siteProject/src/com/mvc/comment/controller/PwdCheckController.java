package com.mvc.comment.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.board.service.BoardExamService;
import com.mvc.comment.service.CommentService;
import com.mvc.comment.vo.CommentVO;
import com.mvc.common.controller.Controller;

public class PwdCheckController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String bc_num = request.getParameter("bc_num");
		String bc_passwd = request.getParameter("bc_pwd");
		
		CommentService service = CommentService.getInstance();
		int result = service.commentPasswdChk(bc_num, bc_passwd);
		
		request.setAttribute("resultData", result);
		
		return "/common/resultData";
	}

}
