<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>등록 결과 출력</title>
		
		<!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
	</head>
	<body>
		<h2>책이 등록된다 '!'</h2>
		
		<!-- 스크립트 릿을 이용해서 클래스를 생성했을 때, 표현언어를 이용한 접근법
		<label>책제목 : </label>${requestScope.title}<br />
		<label>책저자 : </label>${requestScope['author']}<br />
		<label>출판사 : </label>${requestScope["publisher"]}<br />
		 -->
		
		<!-- 자바빈을 이용해서 클래스를 생성했을 때, 표현언어를 이용한 접근법 -->
		<label>책제목 : </label>${requestScope.book.title}<br />
		<label>책저자 : </label>${requestScope.book['author']}<br />
		<label>출판사 : </label>${requestScope.book["publisher"]}<br />
		
		<hr>
		
		<h2>책이 등록되었다.</h2>
	</body>
</html>