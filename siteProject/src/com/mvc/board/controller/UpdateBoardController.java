package com.mvc.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.board.service.BoardExamService;
import com.mvc.board.vo.BoardExamVO;
import com.mvc.common.controller.Controller;

public class UpdateBoardController implements Controller{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String path = "";
		String passwd = request.getParameter("passwd");
		if(passwd.isEmpty())
			passwd = "";
		
		BoardExamVO bvo = new BoardExamVO();
		bvo.setNum(Integer.parseInt(request.getParameter("num")));
		bvo.setTitle(request.getParameter("title"));
		bvo.setContent(request.getParameter("content"));
		bvo.setPasswd(passwd);
		
		BoardExamService service = BoardExamService.getInstance();
		boolean result = service.updateBoardExam(bvo);
		
		if(result) {
//			path = "/board_exam/getBoardExamList.do"; //목록으로
			path = "/board_exam/detailBoard.do?num=" + bvo.getNum(); //수정한 게시글로
		}else {
			path = "/board_exam/updateForm.do?num=" + bvo.getNum() + "&code=1"; //에러 전달을 위한 code
		}
		
		return path;
	}
}
