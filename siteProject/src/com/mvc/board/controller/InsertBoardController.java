package com.mvc.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.board.dao.BoardExamDAO;
import com.mvc.board.service.BoardExamService;
import com.mvc.board.vo.BoardExamVO;
import com.mvc.common.controller.Controller;

public class InsertBoardController implements Controller{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String path = null;
		
		BoardExamVO bvo = new BoardExamVO();
		bvo.setAuthor(request.getParameter("author"));
		bvo.setPasswd(request.getParameter("passwd"));
		bvo.setTitle(request.getParameter("title"));
		bvo.setContent(request.getParameter("content"));
		
		// Service 객체의 메서드 호출
		BoardExamService service = BoardExamService.getInstance();
		
		boolean result = service.insertBoardExam(bvo);
		if(result) {
			path = "/board_exam/getBoardExamList.do";
		}else {
			path = "/board_exam/insertForm.do";
			request.setAttribute("errorMsg", "등록완료에 문제가 있으니, 잠시 후 다시 입력하세요.");
		}
		
		
		// 3. 화면 네비게이션
		return path;
	}
}
