<%@page import="com.student.StudentVO"%>
<%@page import="com.student.StudentDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true" %>
<%
	StudentDAO sdao = StudentDAO.getInstance();

	/* 액션 태그를 사용하지 않았을 경우 
	StudentVO svo = new StudentVO();
	svo.setSd_num(request.getParameter("sd_num"));
	svo.setS_num(request.getParameter("s_num"));
	svo.setSd_id(request.getParameter("sd_id"));
	svo.setSd_name(request.getParameter("sd_name"));
	svo.setSd_birth(request.getParameter("sd_birth"));
	svo.setSd_passwd(request.getParameter("sd_passwd"));
	svo.setSd_phone(request.getParameter("sd_phone"));
	svo.setSd_email(request.getParameter("sd_email"));
	svo.setSd_address(request.getParameter("sd_address"));
	*/
%>

<!-- 액션 태그를 사용한 경우 -->
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="svo" class="com.student.StudentVO" scope="page" />
<jsp:setProperty name="svo" property="*" />
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>등록 처리 결과 페이지</title>
		
		<!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<style type="text/css">
			table {
				width: 450px;
				text-align: center;
			}
			
			table, tr {
				border: 1px solid black;
				border-collapse: collapse;
			}
			
			td{
				padding: 10px 0px;
			}
			
			tr > td:nth-child(1){
				font-weight: bold;
			}
			
			input, select {
				width: 60%;
				height: 25px;
			}
		</style>
		
		<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
			
		</script>
	</head>
	<body>
		<%
			int rowCount = sdao.studentInsert(svo);
			if(rowCount==1){ 
		%>
			<script type="text/javascript">
				alert("등록에 성공했습니다.");
				location.href="selectstudent.jsp";
			</script>
		<%}else{%>
			<script type="text/javascript">
				alert("등록에 실패했습니다.");
				history.go(-1);
			</script>
		<%}; %>
	</body>
</html>
