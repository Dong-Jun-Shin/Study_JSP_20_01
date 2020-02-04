<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>Jakarta DBCP</title>
		
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
		<h3>Jakarta DBCP를 이용한 DB 연결 점검 프로그램 </h3>
		<%
			try{
				// 1. JDNI 서버 (서버에서 관리하고 있는 리소스에 대한 정보를 알고 있는 특정 리소스를 찾아서 사용)
				Context ctx = new InitialContext();
				
				// 2. lookup() 메서드는 리소스를 찾은 후 리소스를 사용할 수 있도록 객체를 반환해 주는 메서드
				// 톰캣에서는 리소스를 관리하는 가상의 디렉토리가 있는데 경로가 java:comp/env/이다.
				// 그래서 톰캣을 사용할 때는 리소스 앞에 java:comp/env/의 경로를 지정해 주어야 한다.
				DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
				// 3. getConnection()
				Connection con = ds.getConnection();
				
				out.println("ORACLE 서버에 성공적으로 접속했습니다.");
				con.close();
			} catch (Exception e){
				out.println("ORACLE 서버에 접속하는데 문제가 있습니다. <hr />");
				out.println(e.getMessage());
				e.printStackTrace();
			}
		%>
	</body>
</html>
