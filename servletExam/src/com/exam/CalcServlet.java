package com.exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CalcServlet
 */
@WebServlet("/calcServlet")
public class CalcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		double num1 = Double.parseDouble(request.getParameter("num1"));
		double num2 = Double.parseDouble(request.getParameter("num2"));
		String operator = request.getParameter("operator");
		
		String head = "<h1>계산결과</h1><hr>";
		String body = num1 + " " + operator + " " + num2 + " = ";
		
		body += calc(num1, num2, operator) + " ";
		body = body.replaceAll(".0 ", " ");

		PrintWriter out = response.getWriter();
		out.println(head);
		out.println(body);
		out.close();
	}
	
	private double calc(double num1, double num2, String operator) {
		if(operator.equals("+")) {
			return num1 + num2;
		}else if(operator.equals("-")) {
			return num1 - num2;
		}else if(operator.equals("*")) {
			return num1 * num2;
		}else if(operator.equals("/")) {
			return num1 / num2;
		}else if(operator.equals("^")) {
			double multiple = num1;
			for (int i = 1; i < num2; i++) {
				multiple = multiple * num1;
			}
			return multiple;
		}
		
		return 0;
	}
}
