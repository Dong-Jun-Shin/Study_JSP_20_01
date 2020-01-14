package com.exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TodayMenu
 */
@WebServlet("/todayMenu")
public class TodayMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String[] str = request.getParameterValues("list");
		
		//Arrays.toString(values);
		String lunch = "오늘 점심은 ";
		for (int i = 0; i < str.length; i++) {
			lunch += str[i];
			if(!(i == str.length-1)) {
				lunch += ", ";
			}
		}
		lunch += " 이나 먹어야겠다.";
		
		PrintWriter out = response.getWriter();
		
		out.println("<!DOCTYPE html><html>");
		out.println("<head><meta charset='UTF-8' /><title>POST DATA</title>");
		out.println("<script type='text/javascript'>");
		out.println("window.onload=function(){");
		out.println("var backPage = document.getElementById('btn')");
		out.println("backPage.onclick=function(){");
		out.println("history.back()};");
		out.println("};");
		out.println("</script></head>");
		out.println("<body>");
		out.println("<h1>" + lunch + "</h1>");
		out.println("<a href='#' id='btn'>뒤로가기</button>");
		out.println("</body>");
		out.println("</html>");
		
		out.close();
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
