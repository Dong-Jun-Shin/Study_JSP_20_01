package com.exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CalcServlet2
 */
// URL맵핑 첫번째 방법으로 정의
public class CalcServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 변수선언
		double num1, num2;
		double result;
		String op;
		
		response.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		num1 = Double.parseDouble(request.getParameter("num1"));
		num2 = Double.parseDouble(request.getParameter("num2"));
		op = request.getParameter("operator");
		
		result = calc(num1, num2, op);
		
		
		out.print((result+" ").replaceAll(".0 ", " "));
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
