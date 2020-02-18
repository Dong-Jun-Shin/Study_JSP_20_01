package com.mvc.comment.controller;

import java.io.BufferedReader;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mvc.comment.service.CommentService;
import com.mvc.comment.vo.CommentVO;
import com.mvc.common.controller.Controller;

public class InsertCommentController implements Controller {

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
			int result = service.insertComment(cvo);
			
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

}
