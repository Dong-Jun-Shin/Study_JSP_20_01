package com.exam;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CookieTest2Servlet
 */
@WebServlet("/cookie2")
public class CookieTest2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println("<!DOCTYPE html><html><head><meta charset='UTF-8' />");
		out.println("<link rel='shortcut icon' href='/servletExam/image/icon.png' />");
		out.println("<link rel='apple-touch-icon' href='/servletExam/image/icon.png' />");
		out.println("<title>쿠키 읽기</title></head>");
		out.println("<body>");
		
		Cookie[] list = request.getCookies();
		
		// 쿠키 추가 예제
		for (int i = 0; list!=null && i < list.length; i++) {
			out.println(list[i].getName() + " : " + list[i].getValue() + "<br />");
		}
		
		out.println("<hr />");
		
		// 쿠키 추가 시, 저장된 한글을 디코더로 해석 후 출력하기
		if(list != null) {
			for (Cookie cook : list) {
				out.println(cook.getName() + " : ");
				out.println(URLDecoder.decode(cook.getValue(),"UTF-8"));
				out.println("<br />");
			}
		}
		
		
		out.println("</body>");
		out.println("</html>");
		out.close();
	}
}
