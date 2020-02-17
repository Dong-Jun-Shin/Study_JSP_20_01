package com.mvc.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.board.service.BoardExamService;
import com.mvc.board.vo.BoardExamVO;
import com.mvc.common.controller.Controller;

public class InsertReplyController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String path = "";
		
		BoardExamVO bvo = new BoardExamVO();
		bvo.setNum(Integer.parseInt(request.getParameter("num")));
		bvo.setAuthor(request.getParameter("author"));
		bvo.setPasswd(request.getParameter("passwd"));
		bvo.setTitle(request.getParameter("title"));
		bvo.setContent(request.getParameter("content"));
		bvo.setReproot(Integer.parseInt(request.getParameter("repRoot")));
		bvo.setRepindent(Integer.parseInt(request.getParameter("repIndent")));
		bvo.setRepstep(Integer.parseInt(request.getParameter("repStep")));
		
		BoardExamService service = BoardExamService.getInstance();
		boolean result = service.insertReply(bvo);
		
		if(result) {
			path = "/board_exam/getBoardExamList.do";
		}else {
			path = "/board_exam/replyForm.do?num=" + bvo.getNum() + "&code=1";
		}
		
		return path;
	}
	
}
