package com.exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SessionTestServlet
 */
@WebServlet("/sessionTest")
public class SessionTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html; charset=UTF-8");
    	PrintWriter out = response.getWriter();
    	
    	String param = request.getParameter("param");
    	String msg = null;
    	HttpSession session = null;
    	
    	if(param==null) {
    		out.print("값은 create, delete, add, get, remove, replace 중 하나를 선택해 주세요.<br />");
    		out.print("요청 URL은 http://localhost:8080/servletExam/sessionTest?param=\"값\"을 명시해 주세요.");
    		return;
    	}
    	
    	if(param.equals("create")) {
    		session = request.getSession();
    		if(session.isNew()) {
    			msg = "새로운 세션 객체가 생성됨";
    		}else {
    			msg = "기존의 세션 객체가 리턴됨";
    		}
    	}else if(param.equals("delete")) {
    		session = request.getSession(false);
    		if(session != null) {
    			session.invalidate();
    			msg = "세션 객체 삭제 작업 완료";
    		}else {
    			msg = "삭제할 세션 존재하지 않음";
    		}
    	}else if (param.equals("add")){
    		session = request.getSession(true);
    		session.setAttribute("msg", "메시지입니다");
    		msg = "세션 객체에 데이터(속성) 등록 완료";
    	}else if (param.equals("get")) {
    		session = request.getSession(false);
    		if(session != null) {
    			String str = (String) session.getAttribute("msg");
    			msg = str;
    		}else {
    			msg = "데이터(속성)을 추출할 세션 객체 존재하지 않음";
    		}
    	}else if(param.equals("remove")) {
    		session = request.getSession();
			if(session != null) {
				session.removeAttribute("msg");
				msg = "세션 객체의 데이터(속성) 삭제 완료";
			}else {
				msg = "데이터(속성)을 삭제할 세션 객체가 존재하지 않음";
			}
		}else if(param.equals("replace")) {
			session = request.getSession();
			session.setAttribute("msg", "새로운 메시지입니다.");
			msg = "세션 객체에 데이터(속성) 등록 완료";
		}
		
		out.println("<!DOCTYPE html><html><head><meta charset='UTF-8' />");
		out.println("<link rel='shortcut icon' href='/servletExam/image/icon.png' />");
		out.println("<link rel='apple-touch-icon' href='/servletExam/image/icon.png' />");
		out.println("<title>세션 객체</title></head>");
		out.println("<body>");
		
		out.print("처리 결과: " + msg);
		
		out.println("</body></html>");
		out.close();
    	
    }


}
