package com.exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InitParamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	String adminId, adminPwd;

	@Override
	public void init(ServletConfig config) throws ServletException {
		adminId = config.getInitParameter("adminId");
		adminPwd = config.getInitParameter("adminPwd");
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html><html>");
		out.println("<head><meta charset='UTF-8' /><title>JSP예제</title></head>");
		out.println("<body><h2>서블릿 초기 추출 변수 </h2>");

		out.println("<h3>ADMIN ID : " + adminId + "</h3>");
		out.println("<h3>ADMIN PASSWORD : " + adminPwd + "</h3>");
		
		out.println("</body></html>");
	}

}
