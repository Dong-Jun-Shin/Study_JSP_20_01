package com.mvc.common.controller;

import java.util.HashMap;
import java.util.Map;

import com.mvc.board.controller.DetailBoardController;
import com.mvc.board.controller.GetBoardExamListController;
import com.mvc.board.controller.InsertFormController;
import com.mvc.board.controller.InsertBoardController;

public class HandlerMapping {
	private Map<String, Controller> mappings;

	public HandlerMapping() {
		mappings = new HashMap<String, Controller>();
		/* 답변형 게시판 처리 */
		mappings.put("/board_exam/getBoardExamList.do", new GetBoardExamListController());
		mappings.put("/board_exam/insertForm.do", new InsertFormController());
		mappings.put("/board_exam/insertBoard.do", new InsertBoardController());
		mappings.put("/board_exam/detailBoard.do", new DetailBoardController());
	}
	
	public Controller getController(String path) {
		return mappings.get(path);
	}
	
}
