package com.exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletConfigTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// web.xml의 초기화 변수 사용
		String charset = this.getInitParameter("charset");
		
		request.setCharacterEncoding(charset);
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		out.println("<!DOCTYPE html><html>");
		out.println("<head><meta charset='UTF-8' /><title>JSP예제</title></head>");
		out.println("<body>");

		out.println("<h2>서블릿 초기값으로 인코딩 설정한 후 결과 출력</h2>");
		out.println("<h3>안녕! 나는 " + request.getParameter("korName") + "야</h3>");
		
		out.println("</body></html>");
	}
}
