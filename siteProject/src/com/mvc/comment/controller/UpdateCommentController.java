package com.mvc.comment.controller;

import java.io.BufferedReader;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mvc.comment.service.CommentService;
import com.mvc.comment.vo.CommentVO;
import com.mvc.common.controller.Controller;

public class UpdateCommentController implements Controller {
	//form으로 전송 받을 때 사용하는 execute()
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String resultData = "";
		StringBuffer sb = new StringBuffer();
		
		ObjectMapper om = new ObjectMapper();
		try {
			BufferedReader br = request.getReader();
			if(br != null) sb.append(br.readLine());
			
			CommentVO cvo = om.readValue(sb.toString(), CommentVO.class);

			CommentService service = CommentService.getInstance();
			int result = service.updateComment(cvo);
			
			if(result == 1) {
				resultData = "SUCCESS";
			}
		}catch (JsonProcessingException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("resultData", resultData);
		
		return "/common/resultData";
	}
	
	//form으로 전송 받을 때 사용하는 execute()
//	@Override
//	public String execute(HttpServletRequest request, HttpServletResponse response) {
//		String bc_num = request.getParameter("bc_num");
//		
//		CommentVO cvo = new CommentVO();
//		cvo.setBc_num(Integer.parseInt(bc_num));
//		cvo.setBc_content(request.getParameter("bc_content"));
//		
//		CommentService service = CommentService.getInstance();
//		service.updateComment(cvo);
//		
//		return "/board_exam/detailBoard.do?num="+ request.getParameter("num");
//	}

}
