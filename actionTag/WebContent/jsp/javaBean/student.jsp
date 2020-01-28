<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="stdInfo" class="com.javaBean.StudentBean" scope="page"/>

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
		
		<!--[if lt IE 9] IE9라면 실행>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		<style type="text/css">
			table{
				text-align: center;
				width: 390px;
				height: 400px;
			}
			
			input{
				width: 150px;
			}
			
			table, tr{
				border: 2px solid black;
				border-collapse: collapse;
			}
		</style>
		
		<script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
		
		</script>
	</head>
	<body>
		<%request.setCharacterEncoding("UTF-8"); %>
		<jsp:setProperty property="*" name="stdInfo"/>
		<table>
			<tr>
				<th colspan="2">학생 정보</th>
			</tr>
			<tr>
				<th>학생 아이디</th>
				<td><jsp:getProperty property="id" name="stdInfo"/></td>
			</tr>
			<tr>
				<th>학생 이름</th>
				<td><jsp:getProperty property="name" name="stdInfo"/></td>
			</tr>
			<tr>
				<th>학생 번호</th>
				<td><jsp:getProperty property="snum" name="stdInfo" /></td>
			</tr>
			<tr>
				<th>생년 월일</th>
<%-- 				<td><jsp:getProperty property="birth" name="stdInfo"/></td> --%>
				<td><jsp:getProperty property="age" name="stdInfo"/>
				(<jsp:getProperty property="birth" name="stdInfo"/>년생)</td>
			</tr>
			<tr>
				<th>비밀 번호 </th>
				<td><jsp:getProperty property="pass" name="stdInfo"/></td>
			</tr>
			<tr>
				<th>이  메  일</th>
				<td><jsp:getProperty property="email" name="stdInfo"/></td>
			</tr>
		</table>
	</body>
</html>
