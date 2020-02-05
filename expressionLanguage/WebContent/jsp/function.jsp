<%@page import="book.Book"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@taglib prefix="date" uri="/WEB-INF/tld/ELfunction.tld" %> --%>
<%@taglib prefix="date" uri="/ELfunctions" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>EL 함수</title>
		
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
		<h3>EL 함수 예제(메서드 확인)</h3>
		<%
			Book book = new Book();
			pageContext.setAttribute("b", book);
		%>
		<p>평균 2.0 제목 자바</p>
		<!-- 설정 -->
		${pageScope.b.setTitle("난 책")}
		<!-- 접근 시, 연산 -->
		${pageScope.b.getTitle() += " 이시다."}<br />
		<!-- 설정 (기본값인 pageScope 생략)-->
		${b.setAuthor("난 저자")}
		<!-- 접근 시, 속성 명시로 접근 -->
		${b.author} 이시다.


		<h3>EL 함수 예제(정적 메서드 확인)</h3>
		<%
			java.util.Date today = new java.util.Date();
			pageContext.setAttribute("now", today);
			if(session.isNew()) session.setAttribute("now", today);
		%>
		<p>[Refresh]한 시간 : ${date:format(now)}</p>
		<p>처음 접속한 시간 : ${date:format(sessionScope.now)}</p>
		<p>나이(${param.year} 년) : ${"만 " += date:getAge(param.birth) += "세"}</p>
	</body>
</html>
