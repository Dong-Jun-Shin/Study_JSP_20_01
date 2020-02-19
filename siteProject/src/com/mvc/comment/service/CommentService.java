package com.mvc.comment.service;

import java.util.ArrayList;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mvc.comment.dao.CommentDAO;
import com.mvc.comment.vo.CommentVO;

public class CommentService {
	private CommentDAO cdao = CommentDAO.getInstance();
	private static CommentService service = new CommentService();

	public static CommentService getInstance() {
		return service;
	}
	
	private CommentService() {
	}
	
	public String getCommentList(String num){
		String listData = "";
		ArrayList<CommentVO> list = cdao.getCommentList(num);
		ObjectMapper om = new ObjectMapper();
		try {
			// 객체를 Json형태의 String으로 변환하는 메서드
			listData = om.writeValueAsString(list);
//			System.out.println(listData);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return listData;
	}
	
	public int insertComment(CommentVO cvo) {
		int result = cdao.insertComment(cvo);
		
		return result;
	}
	
	public int updateComment(CommentVO cvo) {
		int result = cdao.updateComment(cvo);
		
		return result;
	}
	
	public int deleteComment(String bc_num) {
		int result = cdao.deleteComment(bc_num);
		
		return result;
	}
	
	public int commentPasswdChk(String bc_num, String bc_passwd) {
		int result = cdao.commentPasswdChk(bc_num, bc_passwd);
		
		return result;
	}
}
