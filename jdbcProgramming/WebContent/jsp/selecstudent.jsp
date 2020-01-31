<%@page import="com.student.StudentVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.student.StudentDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%
	StudentDAO sdao = StudentDAO.getInstance();
	ArrayList<StudentVO> list = sdao.getStudentList();
	int counter = list.size();
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
			$(function(){
				$("#studentSignUp").click({
					location.href = "studentForm.jsp";
				})
			})
		</script>
	</head>
	<body>
		<h3>자바 빈즈 StudentDAO를 통해 테이블 student 조회 프로그램</h3>
		<hr />
		<div><input type="button" value="학생 정보 등록" name="studentSignUp" id="studentSignUp"> </div>
		<table border="1">
			<thead style="background: skyblue;">
				<tr>
					<th>학번</th>
					<th>이름</th>
					<th>아이디</th>
					<th>학과명</th>
					<th>생일</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>이메일</th>
					<th>등록일자</th>
				</tr>
			</thead>
			<tbody>
				<% if(counter > 0) {
					for(StudentVO svo : list){
				/* 
					for(int i = 0; i < counter; i++){
					StudentVO svo = list.get(i); 
				*/
				%>
					<tr>
						<td><%= svo.getSd_num() %></td>	
						<td><%= svo.getSd_name() %></td>	
						<td><%= svo.getSd_id() %></td>	
						<td><%= svo.getS_num() %></td>	
						<td><%= svo.getSd_birth() %></td>	
						<td><%= svo.getSd_phone() %></td>	
						<td><%= svo.getSd_address() %></td>	
						<td><%= svo.getSd_email() %></td>	
						<td><%= svo.getSd_date() %></td>	
					</tr>
				<% 
					}
				  }else{
				%>
					<tr>
						<td colspan="9"> 조회된 학생 정보가 존재하지 않습니다.</td>
					</tr>
				<%
				  }
				%>
			</tbody>
		</table>
	</body>
</html>

