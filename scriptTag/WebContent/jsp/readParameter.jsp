<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>예외 처리</title>
		
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
		<%--
			<p>
				name 파라미터 값:
	 			<%= request.getParameter("name").toUpperCase() %> 
	 		</p>
		--%>
		<%--
			<p>배열의 원소 출력:
			<%
				String[] language = {"자바", "오라클", "프로트 엔드", "백 엔드"};
				out.print(language[5]);
			%>
		--%>
	
		<% try{ %>
			<p>
				name 파라미터 값:
				<%= request.getParameter("name").toUpperCase() %>
			</p>
		<% } catch(NullPointerException ne){ %>
			<p> 파라미터 값을 정상적으로 받지 못하였습니다.</p>
		<% } %>
		
		<% String name = request.getParameter("name"); %>
		<% if(name != null) { %>
			<p> name 파라미터 값: <%=name.toUpperCase() %></p>
		<% } else { %>
			<p> 파라미터 값을 정상적으로 받지 못하였습니다.</p>
		<% } %>
		
	</body>
</html>
