<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
	</head>
	<body>
		<h3>표현식 예제 - 배열원소 출력</h3>
		<%String[] str = {"JSP", "JAVA", "SPRING", "HTML5"}; %>
		<table>
			<tr>
				<th>배열의 첨자번호</th>
				<th>배열 요소의 값</th>
			</tr>
			<%for(int i = 0; i < str.length; i++){ %>
				<tr>
					<td><%=i %></td>
					<td><%=str[i] %></td>
				</tr>
			<%} %>
		</table>
		
		<h3>표햔식 예제 - 기본데이터 타입 및 레퍼런스 타입 출력</h3>
		<%
			//기본데이터 타입의 출력
			int x = 10;
			int y = (x > 10)? 20 : x;
			//out.println("y변수의 내용: "+y+"<br/>");
		%>
		<%="y변수의 내용: " + y + "<br/>"%>
		<div><label>y변수의 내용: </label><%=y %></div>
		<%
			//레퍼런스타입의 출력
			StringBuffer sf = new StringBuffer("Unicron");
			sf.reverse();
			out.println("객체의 내용: " + sf.toString());
		%>
	</body>
</html>