package com.exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/contextAttr")
public class ServletContextAttribute extends HttpServlet {
	private static final long serialVersionUID = -2483278208745234296L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		ServletContext application = this.getServletContext();
		
		ShareObject obj1 = new ShareObject();
		obj1.setCount(100);
		obj1.setData("객체 공유 테스트 - 1");
		application.setAttribute("data1", obj1);
	
		ShareObject obj2 = new ShareObject();
		obj2.setCount(200);
		obj2.setData("객체 공유 테스트 - 2");
		application.setAttribute("data2", obj2);
		
		out.println("<!DOCTYPE html><html><head><meta charset='UTF-8' />");
		out.println("<title>Attribute-to 객체</title>");
		out.println("<style>a{text-decoration:none;}</style></head><body>");
		out.print("ServletContext 객체에 데이터 등록을 하였습니다.!<br />");
		out.print("<a href='/servletExam/contextAttr1'>데이터 확인</a>");
		out.println("</body></html>");
		out.close();
	}
}
