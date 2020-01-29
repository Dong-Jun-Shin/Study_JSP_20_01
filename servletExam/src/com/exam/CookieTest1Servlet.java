package com.exam;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CookieTest1Servlet
 */
@WebServlet("/cookie1")
public class CookieTest1Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// 쿠키 추가 예제
//		Cookie c1 = new Cookie("id", "javauser");
//		c1.setMaxAge(60 * 3);
//		c1.setPath("/");		// 쿠키의 유효한 디렉토리를 "/"로 설정
//		response.addCookie(c1);
//		
//		Cookie c2 = new Cookie("code", "0001");
//		c2.setMaxAge(60 * 60 * 3);
//		c2.setPath("/");
//		response.addCookie(c2);
//		
//		Cookie c3 = new Cookie("subject", "java");
//		c3.setMaxAge(60 * 60 * 24);
//		c3.setPath("/");
//		response.addCookie(c3);
		
		// 쿠키 추가 시, 인코딩을 활용한 한글 저장
		Cookie userId = new Cookie("userId", URLEncoder.encode("@java#1234", "UTF-8"));
		Cookie userName = new Cookie("userName", URLEncoder.encode("홍길동", "UTF-8"));
		userId.setMaxAge(-1); //바로 삭제
		
		response.addCookie(userId);
		response.addCookie(userName);
		
		out.println("<!DOCTYPE html><html><head><meta charset='UTF-8' />");
		out.println("<link rel='shortcut icon' href='/servletExam/image/icon.png' />");
		out.println("<link rel='apple-touch-icon' href='/servletExam/image/icon.png' />");
		out.println("<title>쿠키 전송</title></head>");
		out.println("<body>");
		out.println("<h3>쿠키 전송 완료</h3>");
		out.println("</body>");
		out.println("</html>");
		out.close();
	}

}
