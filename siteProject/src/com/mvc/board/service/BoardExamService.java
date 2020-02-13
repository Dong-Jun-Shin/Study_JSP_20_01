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
	
	public boolean insertBoardExam(BoardExamVO bvo){
		boolean result = bdao.insertBoardExam(bvo);
		
		return result;
	}
	
	public void getReadCount(String num) {
		bdao.getReadCount(num);
	}
	
	public BoardExamVO boardDetail(String num) {
		BoardExamVO bvo = bdao.boardDetail(num);
		
		// 입력받은 줄바꿈은 '\n'이기 때문에, 적용 가능한 '<br>'로 변경한다.
		bvo.setContent(bvo.getContent().toString().replace("\n", "<br />"));
		
		return bvo;
	}
}
