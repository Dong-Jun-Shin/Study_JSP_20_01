<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>Insert title here</title>
		
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
		<h2>JSP 표현언어(Expression Language) 내장객체</h2>
		<%
			request.setAttribute("edu", "미래능력개발교육원");
			application.setAttribute("name", "홍길동");
			session.setAttribute("id", "javauser");
		%>
		<hr><hr>
		<table border="1">
			<tr>
				<th>EL Implicit Object</th>
				<th>Result</th>
			</tr>
			<tr>
				<td>\${pageContext.request.contextPath} Context root값</td>
				<td>${pageContext.request.contextPath}
				<%-- <%=((HttpServletRequest)pageContext.getRequest()).getContextPath() --%>
			</tr>
			<tr>
				<td>\${requestScope.edu} 속성값</td>
				<td>${edu}</td>
			</tr>
			<tr>
				<td>\${requestScope['edu']} 속성값</td>
				<td>${requestScope['edu']}</td>
			</tr>
			<tr>
				<td>\${sessionScope.id} 속성값</td>
				<td>${id}</td>
			</tr>
			<tr>
				<td>\${sessionScope['id']} 속성값</td>
				<td>${sessionScope['id']}</td>
			</tr>
			<tr>
				<td>\${applicationScope.name} 속성값</td>
				<td>${applicationScope.name}</td>
				<td>${name}</td> <!-- 파라미터 생략 가능, 하지만 스코프를 다 찾아본다. -->
				<%-- <%=application.getAttribute("name") --%>
			</tr>
			<tr>
				<td>\${applicationScope['name']} 속성값</td>
				<td>${applicationScope['name']}</td>
			</tr>
		</table>
	</body>
</html>
