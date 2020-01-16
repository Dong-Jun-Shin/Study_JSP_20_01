<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
	// 합을 구하는 메서드
	public int sum(int num1, int num2){
		int result = 0;
		for(int i = num1; i <= num2; i++){
			result += i;
		}
		
		return result;
	}
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>원의 면적 구하는 예제</title>
		
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
		<%!	double radius = 4.8; %>
		<%! 
			// 원의 면적을 구하는 메서드
			public double getArea(double r){
				return r * r * 3.14;
			}
		%>
		<%-- 위의 태그는 선언문으로 메서드의 선언이나 멤버변수를 정의하고자 할 때 사용. --%>
		반지름이 <%= radius %>인
		원의 면적은 <%= getArea(radius) %>이다.
		
		<p>
			<% int i = 0; %>
			<label>[지역변수] i = <%= ++i %></label>
		</p>
		<p>
			<%-- 전역변수로써 먼저 선언되기 때문에 태그 뒤에 주어도 문제는 없다. --%>
			<label>[전역변수/필드] memi = <%= ++memi %></label>
 			<%! int memi = 0; %> 
		</p>
		<p>
			<%= "1부터 10까지 합은 " + sum(1, 10) + " 입니다" %>
		</p>
	</body>
</html>
