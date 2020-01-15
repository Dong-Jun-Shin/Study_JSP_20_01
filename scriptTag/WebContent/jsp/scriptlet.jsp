<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>스크립트릿을 이용한 구구단 예시 출력</title>
		
		<!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9] IE9라면 실행>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		<style type="text/css">
			table, td{
				border: 1px solid black;
			}
		</style>
	</head>
	<body>
		<h1>스크립트릿을 이용한 구구단 - 1 (JSP로 모두 표현)</h1>
		<!-- 선언문 -->
		<%! String table = "<table border='1'>"; String td=""; %>
		<!-- 표현식 -->
		<%
			for(int i = 1; i < 10; i++){
				table += "<tr>";
				for(int j = 2; j < 10; j++){
					td = "<td>";
					td += j + " * " + i + " = " + (j*i) ;
					td += "</td>";
					
					table += td;
				}
				table += "</tr>";
			}
			table += "</table>";
			
			out.println(table);
		%>
		
		<h1>스크립트릿을 이용한 구구단 - 2 (JSP로 필요 부분만 사용해서 표현)</h1>
		<table border='1'>
			<%! int i, j, k = 0; %>
			<% for(i=1; i<10; i++) { %>
			<tr>
				<% for(j=2; j<10; j++) { 
					k=i*j;
				%>
					<td>
						<!-- 선언문 <\%= a %> : out.print("a"); -->
						<%= j %> * <%= i %> = <%= k %>
					</td>
				<% } %>
			</tr>
			<% } %>
		</table>
	</body>
</html>
