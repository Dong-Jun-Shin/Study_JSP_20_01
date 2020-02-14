package com.mvc.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.board.service.BoardExamService;
import com.mvc.common.controller.Controller;

public class PasswdCheckController implements Controller{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String num = request.getParameter("num");
		String passwd = request.getParameter("passwd");
		
		BoardExamService service = BoardExamService.getInstance();
		int result = service.boardPasswdChk(num, passwd);

		// 파싱할 JSP페이지에서 불러오기 위해 request의 속성으로 값 설정
		request.setAttribute("resultData", result);
		
		// 파싱할 JSP로 이동을 위해 viewName에 설정
		return "/common/resultData";
	}
}
