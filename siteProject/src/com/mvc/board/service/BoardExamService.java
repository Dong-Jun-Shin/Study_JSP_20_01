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
	
	public ArrayList<BoardExamVO> getboardExamList(BoardExamVO bvo){
		ArrayList<BoardExamVO> list = bdao.getBoardExamList(bvo);
		
		return list;
	}
	
	public boolean insertBoardExam(BoardExamVO bvo){
		boolean result = bdao.insertBoardExam(bvo);
		
		return result;
	}
	
	public boolean updateBoardExam(BoardExamVO bvo) {
		boolean result = bdao.updateBoardExam(bvo);
		return result;
	}
	
	public void deleteBoardExam(String num) {
		bdao.deleteBoardExam(num);
	}
	
	public int boardPasswdChk(String num, String passwd) {
		int result = bdao.boardPasswdChk(num, passwd);
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
	
	
	public BoardExamVO updateBoardForm(String num) {
		BoardExamVO bvo = bdao.boardDetail(num);
		
		return bvo;
	}
	
	public BoardExamVO replyForm(String num) {
		BoardExamVO bvo = bdao.boardDetail(num);
		
		return bvo;
	}
	
	public boolean insertReply(BoardExamVO bvo) {
		boolean result = bdao.insertReply(bvo);
		
		return result;
	}
	
	public int getCommentCnt(String num) {
		int commentCnt = bdao.getCommentCnt(num);
		
		return commentCnt;
	}
}
