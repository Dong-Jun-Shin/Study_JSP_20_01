package com.exam;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FirstSevlet
 */
//첫번째 매핑 방법
//web.xml에 servlet, servlet-mapping 태그를 명시
//두번째 매핑 방법
//@WebServlet("/FirstServlet")
public class FirstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see Servlet#init(ServletConfig)
	 * 
	 * init() 메서드는 서블릿이 최초로 호출되었을 때 서블릿 컨테이너가 자동 실행. 서블릿 객체 생성 후 단 한번만 실행. 
	 */
	public void init(ServletConfig config) throws ServletException {
		//super.init(config);

		System.out.println("init() 메서드 호출");
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 * 
	 * service() 메서드는 클라이언트의 요청이 있을 때마다 매번 서블릿 컨테이너가 자동 실행
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// super.service(arg0, arg1);

		System.out.println("sevice() 메서드 호출");
	}

}
