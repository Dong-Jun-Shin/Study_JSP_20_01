package com.exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletContextTestServlet
 */
@WebServlet("/context")
public class ServletContextTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// application 기본 객체
	ServletContext sc;
	
	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		sc = config.getServletContext();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println("<!DOCTYPE html><html><head><meta charset='UTF-8' />");
		out.println("<title>ServletContext 객체</title></head><body>");
		out.print("서블릿 버젼 : " + sc.getMajorVersion() + "." + sc.getMinorVersion());
		out.print("<br />서버 정보 : " + sc.getServerInfo());
		out.print("<br />웹어플리케이션 경로 : " + sc.getContextPath());
		out.print("<br />웹어플리케이션 이름 : " + sc.getServletContextName());
		out.print("<br />파일 실제 경로 : " + sc.getRealPath("/site.html"));
		out.println("<br />로그 기록 영역----------------------");
		//콘솔 창에 출력
		sc.log("로그 기록!!");
		out.println("<br />--------------------------------");
		out.println("</body></html>");
		out.close();
	}

}
