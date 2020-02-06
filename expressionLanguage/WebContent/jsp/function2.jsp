<%@page import="java.util.Date"%>
<%@page import="form.ELDateFormat"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>EL 3.0 함수</title>
		
		<!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->

		<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
		
		</script>
	</head>
	<body>
		<%-- 
		<%
			Date today = new Date();
			pageContext.setAttribute("now", today);
			if(session.isNew()) session.setAttribute("now", today);
 		%>
 		--%>
		<jsp:useBean id="today" class="java.util.Date"/>
		
		<h3>EL 함수 예제2(정적 메서드 확인)</h3>
		${now = today; ''}
		<p>[Refresh]한 현재 시간 : ${ELDateFormat.toFormat(now)}</p>
		${var1 = 10; ''}
		<p>${var1}</p>
		
		<%-- 표현언어 배열 할당 --%>
		<jsp:useBean id="test" class="java.lang.String" />
		
		${test=['A', 'B', 'C']; ''}
		${test}<br />
		${test[0]}<br />
		${test[1]}<br />
		${test[2]}<br />

		${test1=[10, 20, 30]; ''}
		${test1}<br />
		${test1[0]}<br />
		${test1[1]}<br />
		${test1[2]}<br />
	</body>
</html>
