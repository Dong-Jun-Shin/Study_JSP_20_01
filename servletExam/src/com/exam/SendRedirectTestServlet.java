package com.exam;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Site
 */
@WebServlet("/portalSite")
public class SendRedirectTestServlet extends HttpServlet {
	private static final long serialVersionUID = -5675536233993751280L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String param = request.getParameter("site");
	    if(param.equals("naver")) {
	       response.sendRedirect("http://www.naver.com");
	    }else if(param.equals("daum")) {
	       response.sendRedirect("http://www.daum.net");
	    }else if(param.equals("w3schools")) {
	       response.sendRedirect("http://www.w3schools.com");
	    }else if(param.equals("google")) {
	       response.sendRedirect("http://www.google.com");
	    }
	 }
}
