package com.mvc.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.common.controller.Controller;

public class InsertFormController implements Controller{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 추후 기능을 추가할 일이 있다면 이 곳에서 구현
		return "/board_exam/insertForm";
	}
}
