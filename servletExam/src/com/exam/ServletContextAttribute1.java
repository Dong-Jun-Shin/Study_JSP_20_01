package com.exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/contextAttr1")
public class ServletContextAttribute1 extends HttpServlet {
	private static final long serialVersionUID = -8914066691040013329L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		ServletContext application = this.getServletContext();
		
		ShareObject obj1 = (ShareObject)application.getAttribute("data1");
		ShareObject obj2 = (ShareObject)application.getAttribute("data2");
		
		out.println("<!DOCTYPE html><html><head><meta charset='UTF-8' />");
		out.println("<title>Attribute-from 객체</title></head><body>");
		
		out.print("ServletContext 객체의 데이터를 받아왔습니다.!<br />");
		out.print("obj1 count : " + obj1.getCount() + "<br />");
		out.print("obj1 data : " + obj1.getData() + "<br />");
		out.print("obj2 count : " + obj2.getCount() + "<br />");
		out.print("obj2 data : " + obj2.getData() + "<br />");
		
		out.println("</body></html>");
		out.close();
	}
}
