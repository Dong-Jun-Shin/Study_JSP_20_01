package com.mvc.board.service;

import java.util.ArrayList;

import com.mvc.board.dao.BoardExamDAO;
import com.mvc.board.vo.BoardExamVO;

public class BoardExamService {
	private static BoardExamService service = new BoardExamService();
	private BoardExamDAO bdao = BoardExamDAO.getInstance();

	private BoardExamService() {
	}

	public static BoardExamService getInstance() {
		return service;
	}
	
	public ArrayList<BoardExamVO> getboardExamList(){
		ArrayList<BoardExamVO> list = bdao.getBoardExamList();
		
		return list;
	}
}
