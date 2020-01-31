<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String driverName = "oracle.jdbc.driver.OracleDriver";
	String dbURL = "jdbc:oracle:thin:@localhost:1521:orcl";
	
	try{
		Class.forName(driverName);
		con = DriverManager.getConnection(dbURL, "javauser", "java1234");
		
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT sd_num, sd_name, sd_id, s_num, sd_birth, ");
		sb.append("sd_phone, sd_address, sd_email, sd_date FROM student");
		
		pstmt = con.prepareStatement(sb.toString());
		rs = pstmt.executeQuery();
%>
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
		<h3>테이블 student 조회 프로그램</h3>
		<hr />
		<table border="1">
			<thead style="background: skyblue;">
				<tr>
					<th>학번</th>
					<th>이름</th>
					<th>아이디</th>
					<th>학과번호</th>
					<th>생일</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>이메일</th>
					<th>등록일자</th>
				</tr>
			</thead>
			<tbody>
				<% while(rs.next()){ %>
					<tr>
						<td><%= rs.getString("sd_num") %></td>	<%-- 태그 사이에 출력 액션태그를 사용하면 3줄의 out.write에 걸쳐서 표현된다. --%>
						<td><%= rs.getString("sd_name") %></td>
						<td><%= rs.getString("sd_id") %></td>
						<td><%= rs.getString("s_num") %></td>
						<td><%= rs.getDate("sd_birth").toString() %></td>
						<td><%= rs.getString("sd_phone") %></td>
						<td><%= rs.getString("sd_address") %></td>
						<td><%= rs.getString("sd_email") %></td>
						<td><%= rs.getDate("sd_date").toString() %></td>
					</tr>
				<% } %>
			</tbody>
		</table>
	</body>
</html>
<%
	}catch(Exception e){
		out.println("student 테이블을 조회하는데 문제가 있습니다. <hr />");
		out.println(e.toString());
		e.printStackTrace();
	}finally{
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(con != null) con.close();
	}
%>

