package com.mvc.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.common.controller.Controller;
import com.mvc.member.service.MemberService;

public class MemberIdCheckController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String sort = "id";
		String val = request.getParameter("m_id");
		
		MemberService service = MemberService.getInstance();
		int result = service.memberCheck(sort, val);
		
		request.setAttribute("resultData", result);
		
		return "/common/resultData";
	}

}
