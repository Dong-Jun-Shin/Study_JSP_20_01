package com.mvc.comment.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.comment.service.CommentService;
import com.mvc.comment.vo.CommentVO;
import com.mvc.common.controller.Controller;

public class DeleteCommentController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String bc_num = request.getParameter("bc_num");
		
		CommentService service = CommentService.getInstance();
		service.deleteComment(bc_num);
		
		CommentVO cvo = service.getComment(bc_num);
		
		return "/board_exam/detailBoard.do?num="+ cvo.getNum();
	}

}
