package com.mvc.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.board.service.BoardExamService;
import com.mvc.board.vo.BoardExamVO;
import com.mvc.common.controller.Controller;

public class UpdateFormController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String code = null; 
		code = request.getParameter("code");
		String num = request.getParameter("num");
		
		BoardExamService service = BoardExamService.getInstance();
		BoardExamVO bvo = service.updateBoardForm(num);
		
		request.setAttribute("updateData", bvo);
		
		if(code != null && code.equals("1")) {
			request.setAttribute("errorMsg", "수정 완료에 문제가 있어 잠시 후 다시 입력해주세요.");
		}
		return "/board_exam/updateForm";
	}

}
