package com.mvc.common.controller;

import java.util.HashMap;
import java.util.Map;

import com.mvc.board.controller.GetBoardExamListController;

public class HandlerMapping {
	private Map<String, Controller> mappings;

	public HandlerMapping() {
		mappings = new HashMap<String, Controller>();
		/* 답변형 게시판 처리 */
		mappings.put("/board_exam/getBoardExamList.do", new GetBoardExamListController());
	}
	
	public Controller getController(String path) {
		return mappings.get(path);
	}
	
}
