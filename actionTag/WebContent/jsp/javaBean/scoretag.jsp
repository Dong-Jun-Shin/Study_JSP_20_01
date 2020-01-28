<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="score" class="com.javabean.ScoreBean" /> scope는 page가 기본이라 생략 가능--%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="score" class="com.javaBean.ScoreBean" scope="page" />
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>액션태그를 이용한 자바빈 생성</title>
		
		<!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
		<link rel="shortcut icon" href="../../image/icon.png" />
		<link rel="apple-touch-icon" href="../../image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9] IE9라면 실행>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		
		<script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
		
		</script>
	</head>
	<body>
		<%
			String name = request.getParameter("name");
			int point = Integer.parseInt(request.getParameter("point"));
		%>
		
		<h3>JavaBeans를 이용한 학생의 이름과 성적을 저장하고 조회하는 예제</h3>
		<hr />
		
		<h4>이름과 성적을 JavaBeans ScoreBean에 저장</h4>
		<p>
			이름 : <%=name %>, 성적 : <%=point %>
		</p>
		
		<%-- 파라미터를 직접 명시 --%>
<%-- 		<jsp:setProperty property="name" name="score" value="홍길동" /> --%>
<%-- 		<jsp:setProperty property="point" name="score" value="85" /> --%>

		<%-- "가 중복될 경우, 안쪽에 \를 명시 --%>
<%-- 		<jsp:setProperty property="name" name="score" value="<%=request.getParameter(\"name\") %>" /> --%>
<%-- 		<jsp:setProperty property="point" name="score" value="<%=Integer.parseInt(request.getParameter(\"point\")) %>" /> --%>
		
		<%-- param을 이용한 바로 자바빈에 set하기 --%>
<%-- 		<jsp:setProperty property="name" name="score" param="name" /> --%>
<%-- 		<jsp:setProperty property="point" name="score" param="point" /> --%>
		
		<%-- param 생략, 가져온 양식과 속성의 이름이 같기 때문에 자동 매핑 --%>
<%-- 		<jsp:setProperty property="name" name="score" /> --%>
<%-- 		<jsp:setProperty property="point" name="score" /> --%>
		
		<%-- 받아온 파라미터를 모두 set, 형변환 또한 자동으로 이루어짐. --%>

		<jsp:setProperty property="*" name="score" />
		
		<hr />
		<h4>JavaBeans ScoreBean에 저장된 정보를 조회 출력</h4>
		<p>
			이름 : <jsp:getProperty property="name" name="score"/><br />
			성적 : <jsp:getProperty property="point" name="score"/><br />
			학점 : <jsp:getProperty property="grade" name="score"/><br />
		</p>
	</body>
</html>
