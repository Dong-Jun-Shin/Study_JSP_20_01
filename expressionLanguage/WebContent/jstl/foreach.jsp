<%@page import="member.User"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<h2>JSTL Core Tag: forEach</h2>
		<h3>배열 처리</h3>
		<c:set var="score" value="<%= new int[] {95, 88, 77, 45, 99} %>" />
		
		<c:set var="sum" value="0" />
		<c:forEach var="point" items="${score }" >
			\${point } = ${point } <br />
			<c:set var="sum" value="${sum + point }" />
		</c:forEach>
		합 = ${sum } <br />
		
		<h3>1부터 100까지 합</h3>
		<c:set var="sum" value="0" />
		<c:forEach var="i" begin="1" end="100" >
			<c:set var="sum" value="${sum + i }" />
		</c:forEach>
		결과 = ${sum } <br />
		
		<h3>1부터 100까지 3의 배수 합</h3>
		<c:set var="sum" value="0" />
		<c:forEach var="i" begin="0" end="100" step="3" >
			<c:set var="sum" value="${sum + i }" />
		</c:forEach>
		결과 = ${sum } <br />
		
		<h3>Map인 sessionSccope 처리</h3>
		<c:set target="${sessionScope }" property="name" value="홍길동" />
		<c:set target="${sessionScope }" property="id" value="dong" />
		<c:set target="${sessionScope }" property="passwd" value="1234" />
		
		<c:forEach var="i" items="${sessionScope }" >
			${i.key } = ${i.value } <br />
		</c:forEach> <br />
		
		<h3>ArrayList 원소 반복</h3>
		<%
			ArrayList<User> userList = new ArrayList<User>();
			userList.add(new User("홍길동", "javajsp", 180701));
			userList.add(new User("김희진", "jspuser", 180702));
			userList.add(new User("이철수", "dbadmin", 180703));
		%>
		<c:set var="list" value="<%=userList %>" />
		<c:forEach var="member" items="${list }" varStatus="status">
			${status.count}. ${member.uname} / ${member.uid } / ${member.unum }
		</c:forEach>
		
		<h3>2단부터 9단까지 출력</h3>
		
		<table border="1">
		<c:forEach var="j" begin="1" end="9">
			<tr>
			<c:forEach var="i" begin="2" end="9">
				<td style="padding: 5px">${i} * ${j} = ${i * j }</td>
			</c:forEach>
			</tr>
		</c:forEach>
		</table>
		
	</body>
</html>
