<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>Insert title here</title>
		
		<!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
		<link rel="shortcut icon" href="/siteProject/image/icon.png" />
		<link rel="apple-touch-icon" href="/siteProject/image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		<link rel="stylesheet" type="text/css"
		href="/siteProject/include/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css"
		href="/siteProject/include/dist/css/bootstrap-theme.css" />
		
		<!--[if lt IE 9] IE9라면 실행>
		<script src="/siteProject/include/js/html5shiv.js"></script>
		<![endif]-->
		
		<script type="text/javascript" src="/siteProject/include/js/common.js"></script>
		<script type="text/javascript" src="/siteProject/include/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="/siteProject/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#boardListBtn").click(function(){
					location.href = "/siteProject/board_exam/getBoardExamList.do";
				});
			})
		</script>
	</head>
	<body>
<%-- 		${requestScope.detail.content} --%>
		<h3 style="text-align: center;">글작성</h3>
		<div style="width: 90%; margin: 0px auto;">
		 	<div class="contentBtn text-right">
		  	  	<button type="button" class="btn btn-default" id="boardUpdateBtn">수정</button>
			  	<button type="button" class="btn btn-default" id="boardDeleteBtn">삭제</button>
			  	<button type="button" class="btn btn-default" id="boardReplyBtn">답변</button>
			  	<button type="button" class="btn btn-default" id="boardListBtn">목록</button>
		  	</div>
			<table class="table table-bordered">
				<colgroup>
					<col width="25%" />
					<col width="25%" />
					<col width="25%" />
					<col width="25%" />
				</colgroup>
				<tbody>
					<tr>
						<td class="success text-center">글번호</td>
						<td>${detail.num }  <span>(조회수 : ${detail.readcnt })</span></td>
						<td class="success text-center">작성일</td>
						<td>${detail.writeday }</td>
					</tr>
					<tr>
						<td class="success text-center">글제목</td>
						<td colspan="3">${detail.title }</td>
					</tr>
					<tr>
						<td class="success text-center">작성자</td>
						<td colspan="3">${detail.author }</td>
					</tr>
					<tr>
						<td class="success text-center" style="line-height: 200px">글내용</td>
						<td colspan="3">${detail.content }</td>
					</tr>
				</tbody>
			</table>
		</div>
	</body>
</html>
