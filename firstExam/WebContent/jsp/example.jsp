<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>3가지 예제</title>
		
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
		<%
			// 문제 1-----------------------------------------------------
			int num1 = 7;
			int num2 = 5;
			int num3 = 9;
			int maxNum = Math.max(num1, num2);
			
			if(maxNum < num3) maxNum = num3;
			
			// 문제 2-----------------------------------------------------
			String str = "\"동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세\"";
			String result1 = str + "=> " + (str.length()-1) + "자이며, '닳'은 " + str.indexOf("닳") + "번째 있다. <br />";
			String result2 = str + "의 15번째 문자는 " + str.charAt(14) + "'닳'이다. <br /><br />";
			
			// 문제 3-----------------------------------------------------
			int[] arrNum = {12, 26, 68, 98, 76, 54, 8, 6, 4};
			int max = arrNum[0];
			int min = arrNum[0];
			
			for(int i = 1; i < arrNum.length; i++){
				if(max < arrNum[i])	max = arrNum[i];
				if(min > arrNum[i])	min = arrNum[i];
			}
		%>
		<h1>숫자를 저장한 변수 3개(7, 5, 9)를 정의하고 최대값 구하기</h1>
		<p>최대값은: <%=maxNum%><br /><br /></p>
		
		<h1>문자열 추출하기</h1>
		<p><%=result1+result2 %>
		
		<h1>배열의 값이(12, 26, 68, 98, 76, 54, 8, 6, 4) 중 최대값과 최소값 구하기</h1>
		<p>최대값: <%=max %>, 최소값: <%=min %></p>
	</body>
</html>
