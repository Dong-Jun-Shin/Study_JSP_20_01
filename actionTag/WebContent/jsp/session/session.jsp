<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.exam.MemberVO"%>
<%@page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String driverName = "oracle.jdbc.driver.OracleDriver";
	String dbURL = "jdbc:oracle:thin:@localhost:1521:orcl";
	
	String user_id = request.getParameter("user_id");
	String user_password = request.getParameter("user_password");
	
	String dbId = null, dbName = null, dbEmail = null;
	
	try{
		Class.forName(driverName);
		con = DriverManager.getConnection(dbURL, "scott", "tiger");
		
		// statement
// 		String sql = "SELECT user_id, user_name FROM member WHERE user_id='" + user_id + "' AND user_password='" + user_password + "';";
		
		// prepareStatement
		String sql = "SELECT user_id, user_name, user_email FROM member WHERE user_id=? AND user_password=?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, user_id);
		pstmt.setString(2, user_password);
		
		//.execute boolean형
		//.executeQuery ResultSet형
		//.executeUpdate Int형
		rs = pstmt.executeQuery();
		if(rs.next()){
			dbId = rs.getString("user_id");
			dbName = rs.getString("user_name");
			dbEmail = rs.getString("user_email");
		}
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>환영합니다!</title>
		
		<!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9] IE9라면 실행>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		
		<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
		
		</script>
	</head>
	<body>
		<%
			if(dbId != null){
				// session은 페이지 로딩 시, 서블릿이 만들어지면서 이미 생성
				
				// session의 속성 설정을 이용해서 각각 저장
// 				session.setAttribute("id", dbId);
// 				session.setAttribute("name", dbName);
// 				session.setAttribute("email", dbEmail);

				// VO를 활용한 Session 저장
				MemberVO mvo = new MemberVO();
				mvo.setUser_id(dbId);
				mvo.setUser_name(dbName);
				mvo.setUser_email(dbEmail);
				session.setAttribute("member", mvo);
				
				response.sendRedirect("sessionForm.jsp");
			}else{
		%>
			<script type="text/javascript">
				alert("아이디나 비밀번호가 일치하지 않습니다.");
				history.back();
			</script>
		<%
			} 
		%>
	</body>
</html>
<%
	}catch(Exception e){
		out.println("로그인 문제");
		out.print(e.toString());
		e.printStackTrace();
	}finally{
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(con != null) con.close();
	}
%>
