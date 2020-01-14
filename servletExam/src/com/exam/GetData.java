package com.exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetData
 */
@WebServlet("/getData")
public class GetData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String add = request.getParameter("address");
		
		response.setContentType("text/html; charset=UTF-8"); 
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
		out.println("<h1 style='text-align:center'>POST방식으로 받아온 데이터</h1>");
		if(!(name.equals("") && add.equals(""))) {
			out.println("<p>전송된 이름 : " + name);
			out.println("전송된 주소 : " + add+"</p>");
		}
//		out.println("<button id='btn'>뒤로가기</button>");
//		out.println("<a href='#' id='btn' onclick='history.back()'>뒤로가기</button>");
		out.println("<a href='#' id='btn'>뒤로가기</button>");
		out.println("</body>");
		out.println("</html>");
		
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
