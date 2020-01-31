<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar" %>
<%
	Calendar day = Calendar.getInstance();

	StringBuffer now = new StringBuffer();
	now.append(day.get(Calendar.YEAR) + "-"); //공백을 주려면 인코딩을 해야 한다.
	now.append(day.get(Calendar.MONTH) + 1);
	now.append("-" + day.get(Calendar.DAY_OF_MONTH));
	
	Cookie cookie = new Cookie("lastconnect", now.toString());
	cookie.setMaxAge(10);	// 초 단위 : 10초
	response.addCookie(cookie);
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>Insert title here</title>
		
		<!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
		<link rel="shortcut icon" href="../../image/icon.png" />
		<link rel="apple-touch-icon" href="../../image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
		
		</script>
	</head>
	<body>
		<h3>현재 시각을 쿠키로 저장</h3>
		<hr />
			현재의 시각 정보를 쿠키 이름 "lastconnect"로 저장하는 코드이다.
		<hr />
		<a href="getcookies.jsp">쿠키 조회</a>
	</body>
</html>
