package com.mvc.common.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 페이지의 인코딩을 받아와서 담을 변수
	private String charset;
	// 
	private HandlerMapping handlerMapping;
	// 결과 출력을 위해 절대 경로로 잡아줄 변수
	private ViewResolver viewResolver;
	
	@Override
	public void init() throws ServletException {
		charset = this.getInitParameter("charset");
		
		handlerMapping = new HandlerMapping();
		viewResolver = new ViewResolver();
		viewResolver.setPrefix("/WEB-INF");
		viewResolver.setSuffix(".jsp");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get방식은 web.xml로 서버에서 인코딩 설정이 가능하다.
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// web.xml로 처리 안되는 인코딩을 미리 받아둔 charset 변수로 설정한다.
		request.setCharacterEncoding(charset);
		process(request, response);
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) {
		// 1. 클라이언트의 요청 path 정보를 추출한다.
		// 요청 URL에서 http://localhost:8080/siteProject/board_exam/getBoardExamList.do
		String uri = request.getRequestURI();
		// URI인 /siteProject/board_exam/getBoardList.do를 얻는다.
//		System.out.println("요청 URI : " + uri);
		
		// String path = uri.substring(uri.lastIndexOf("/"));
		// URI에서 마지막 /를 찾아 /getBoardExamList.do를 얻는다.
		
		String path = uri.substring(request.getContextPath().length());
		// URI에서 /siteProject를 찾아 나머지 /board_exam/getBoardExamList.do를 얻는다.
//		System.out.println("contextPath : " + request.getContextPath());
//		System.out.println("path : " + path);
		
		// 2. HandlerMapping을 통해 path에 해당하는 Controller를 검색한다.
		Controller ctrl = handlerMapping.getController(path);
		
		// 3. 검색된 Controller를 실행한다.
		String viewName = ctrl.execute(request, response);
		
		// 4. ViewResolver를 통해 viewName에 해당하는 화면을 검색한다.
		String view = null;
		if(!viewName.contains(".do")) {
			// 해당 파일명이 존재할 절대 경로를 만들어서 반환
			view = viewResolver.getView(viewName);
			
			// 5. 검색된 화면으로 이동한다.
			try {
				RequestDispatcher dispatcher = request.getRequestDispatcher(view);
				dispatcher.forward(request, response);
			}catch (Exception ex) {
				System.out.println("forward 오류 : " + ex);
			}
		}else {
			// WEB-INF를 경로 중에 사용하지 않는다.
			view = "/siteProject" + viewName;
			try {
				response.sendRedirect(view);
			} catch (IOException ioe) {
				System.out.println("sendRedirect 오류 : " + ioe);
			}
		}
	}
}
