package com.mvc.comment.service;

import java.util.ArrayList;

import com.mvc.comment.dao.CommentDAO;
import com.mvc.comment.vo.CommentVO;

public class CommentService {
	private CommentDAO cdao = CommentDAO.getInstance();
	private static CommentService service = new CommentService();

	public CommentService getInstance() {
		return service;
	}
	
	private CommentService() {
	}
	
	public ArrayList<CommentVO> getCommentList(String num){
		ArrayList<CommentVO> list = cdao.getCommentList(num);
		
		return list;
	}
	
	public int insertComment(CommentVO cvo) {
		int result = cdao.insertComment(cvo);
		
		return result;
	}
	
	
	
}
