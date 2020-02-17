package com.mvc.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.board.service.BoardExamService;
import com.mvc.board.vo.BoardExamVO;
import com.mvc.common.controller.Controller;

public class ReplyFormController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String num = request.getParameter("num");
		String code = request.getParameter("code");
		
		BoardExamService service = BoardExamService.getInstance();
		BoardExamVO bvo = service.replyForm(num);
		
		request.setAttribute("reply", bvo);
		
		if(code != null && code.contentEquals("1")) {
			request.setAttribute("errorMsg", "답변 처리에 문제가 있어, 잠시 후 다시 입력해 주세요.");
		}
		
		return "/board_exam/replyForm";
	}

}
