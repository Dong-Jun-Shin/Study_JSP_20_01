package com.exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.print.attribute.standard.Severity;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServlet
 */
//@WebServlet("/hello")
//@WebServlet(name = "helloServlet", urlPatterns = {"/hello", "/servlet"})
@WebServlet(name = "helloServlet", value = {"/hello", "/servlet"})
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HelloServlet() {
		System.out.println("=====> helloservlet 객체 생성");
	}

	@Override
	public void init(ServletConfig config) throws ServletException{
		System.out.println("=====> init() 메서드 호출");
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("=====> doGet() 메서드 생성");
		
		response.setContentType("text/html; charset=UTF-8");
//		System.out.println("서블릿 테스트");
		
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html><html>");
		out.println("<head><meta charset='UTF-8' /><title>JSP예제</title></head>");
		out.println("<body><h1>Hello Servlet ~~!ㅁㄴㅇ</h1></body>");
		out.println("</html>");
		
		out.close();

//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}
