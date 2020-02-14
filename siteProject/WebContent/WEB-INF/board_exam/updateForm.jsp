<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>글 수정</title>
		
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
				$("#boardUpdateBtn").click(function(){
					if(checkExp("#title", "제목")) return;
					if(checkExp("#content", "내용")) return;
					
					$("#f_updateForm").attr({
						"method" : "post",
						"action" : "/siteProject/board_exam/updateBoard.do"
					});
					
					$("#f_updateForm").submit();
				});
				
				// 목록 버튼 클릭 시 처리 이벤트
				$("#boardListBtn").click(function(){
					location.href = "/siteProject/board_exam/getBoardExamList.do";
				});
				
				// 에러메시지가 있을 시 출력 (EL 활용)
				var msg = "${errorMsg}";
				if(msg != ""){
					alert(msg);
				}
			})
		</script>
	</head>
	<body>
		<h3 style="text-align: center;">글수정</h3>
		<div style="width: 90%; margin: 0px auto;">
			<form class="form-inline" name="f_updateForm" id="f_updateForm">
				<input type="hidden" name="num" id="num" value="${updateData.num }" />
			 	<div class="contentBtn form-group pull-right">
			  	  	<button type="button" class="btn btn-primary" id="boardUpdateBtn">수정</button>
				  	<button type="button" class="btn btn-warning" id="boardListBtn">취소</button>
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
							<td>${updateData.num }  <span>(조회수 : ${updateData.readcnt })</span></td>
							<td class="success text-center">작성일</td>
							<td>${updateData.writeday }</td>
						</tr>
						<tr>
							<td class="success text-center">작성자</td>
							<td colspan="3">${updateData.author}</td>
						</tr>
						<tr>
							<td class="success text-center">글제목</td>
							<td colspan="3"><input type="text" name="title" id="title" value="${updateData.title }"></td>
						</tr>
						<tr>
							<td class="success text-center" style="line-height: 200px">글내용</td>
							<td colspan="3"><textarea class="form-control" rows="9" cols="100"  name="content" id="content">${updateData.content }</textarea></td>
						</tr>
						<tr>
							<td class="success text-center" >비밀번호</td>
							<td colspan="3"><input type="text" name="passwd" id="passwd"> (수정할 비밀번호를 입력해주세요.)</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</body>
</html>
