<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import = "java.util.Calendar, java.util.Date, java.text.SimpleDateFormat" %>
<%-- <%@page import="java.text.SimpleDateFormat"%> --%>
<%-- <%@page import="java.util.Date"%> --%>
<%-- <%@page import="java.util.Calendar"%> --%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>import 예제</title>
		
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
		<h2> page 지시자의 import 속성</h2>
		<%
			Calendar now = Calendar.getInstance();
			StringBuffer sb = new StringBuffer("현재 날짜 : ");
			
			sb.append(now.get(Calendar.YEAR));
			sb.append("년 ");
			sb.append(now.get(Calendar.MONTH)+1);
			sb.append("월 ");
			sb.append(now.get(Calendar.DAY_OF_MONTH));
			sb.append("일");
			
			out.println(sb);
			
			Date nowDate = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
			String formatTime = dateFormat.format(nowDate);
		%>
		<p>현재 시간: <%= formatTime %></p>
	</body>
</html>
