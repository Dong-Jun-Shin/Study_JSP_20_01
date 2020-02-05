<%@page import="member.User"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>표현언어에서 액션태그 이용</title>
		
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
		<h3>접근자로 데이터 출력(표현식 이용)</h3>
		<%
			User member = new User();
		 	member.setUname("홍길동");
		 	member.setUid("goodday");
		 	member.setUnum(19010001);
		%>
		<label>uname :</label><%=member.getUname() %><br />
		<label>uid :</label><%=member.getUid() %><br />
		<label>unum :</label><%=member.getUnum() %><br />
		<hr />
		
		
		
		<h3>접근자로 데이터 출력(액션태그 이용)</h3>
		<jsp:useBean id="member1" class="member.User"></jsp:useBean>

		<!-- 받아오는 파라미터가 있는 경우 사용 가능 -->
		<%-- <jsp:setProperty property="*" name="member"/>  --%>
		<jsp:setProperty name="member1" property="uname" value="김늘봄"/>
		<jsp:setProperty name="member1" property="uid" value="javauser"/>
		<jsp:setProperty name="member1" property="unum" value="19050001"/>
		 
		<h4>액션태그에서 자바빈즈 getter 호출</h4>
		<label>uname :</label><jsp:getProperty name="member1" property="uname" /><br />
		<label>uid :</label><jsp:getProperty name="member1" property="uid" /><br />
		<label>unum :</label><jsp:getProperty name="member1" property="unum" /><br />
		<hr />

		<h4>표현언어(EL)에서 자바빈즈 getter 호출</h4>
		<label>uname :</label>${member1.uname}<br />
		<label>uid :</label>${member1['uid']}<br />
		<label>unum :</label>${member1['unum']}<br />
	</body>
</html>
