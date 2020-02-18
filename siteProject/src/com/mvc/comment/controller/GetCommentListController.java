package com.mvc.comment.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.comment.service.CommentService;
import com.mvc.common.controller.Controller;
import com.sun.istack.internal.logging.Logger;

public class GetCommentListController implements Controller {
	private Logger logger = Logger.getLogger(GetCommentListController.class);
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 댓글 컨트롤러 호출 확인
		logger.info("GetCommentListController 호출 실행 확인");
		String num = request.getParameter("num");
		
		CommentService service = CommentService.getInstance();
		String listData = service.getCommentList(num);
		
		// ajax 처리한 결과를 받기 위한 공통 속성
		request.setAttribute("resultData", listData);
		
		return "/common/resultData";
	}

}
