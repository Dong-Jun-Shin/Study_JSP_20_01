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
 * Servlet implementation class CookieTest3Servlet
 */
@WebServlet("/cookie3")
public class CookieTest3Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cnt = 0;
		
		Cookie[] list = request.getCookies();
		for (int i = 0; list != null && i < list.length; i++) {
			if(list[i].getName().equals("count")) {
				cnt = Integer.parseInt(list[i].getValue());
			}
		}
		
		cnt++;
		
		Cookie c = new Cookie("count", String.valueOf(cnt));
		c.setMaxAge(60*60*24*10);
		response.addCookie(c);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println("<!DOCTYPE html><html><head><meta charset='UTF-8' />");
		out.println("<link rel='shortcut icon' href='/servletExam/image/icon.png' />");
		out.println("<link rel='apple-touch-icon' href='/servletExam/image/icon.png' />");
		out.println("<title>방문 횟수</title></head>");
		out.println("<body>");
		
		out.print("<h1>방문횟수 : " + cnt);
		
		out.println("</body></html>");
		out.close();
	}
}
