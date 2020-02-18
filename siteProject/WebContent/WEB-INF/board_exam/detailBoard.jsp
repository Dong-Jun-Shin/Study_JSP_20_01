<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			var btnChk = 0; // 수정 버튼과 삭제 버튼을 구별하기 위한 변수
			$(function(){
				$("#pwdChk").hide();
				
				// 수정 버튼 클릭 시 처리 이벤트 (1번)
				$("#boardUpdateBtn").click(function(){
					$("#pwdChk").show();
					$("#msg").text("작성시 입력한 비밀번호를 입력해 주세요.").css("color", "#8888FF");
					btnChk = 1;
				});
				
				// 삭제 버튼 클릭 시 처리 이벤트 (2번)
				$("#boardDeleteBtn").click(function(){
					$("#pwdChk").show();
					$("#msg").text("작성시 입력한 비밀번호를 입력해 주세요.").css("color","#33EE33");
					btnChk = 2;
				});
				
				// 비밀번호 확인 버튼 클릭 시 처리 이벤트
				$("#pwdBtn").click(function(event){
					boardPwdConfirm();
				})
				
				// 답변 버튼 클릭 시 처리 이벤트
				$("#boardReplyBtn").click(function(){
					$("#f_data").attr({
						"method" : "post",
						"action" : "/siteProject/board_exam/replyForm.do"
					});
					$("#f_data").submit();
				});
				
				// 목록 버튼 클릭 시 처리 이벤트
				$("#boardListBtn").click(function(){
					location.href = "/siteProject/board_exam/getBoardExamList.do";
				});
			})
			
			// 비밀번호 확인 클릭 시, 실질적으로 처리하는 함수
			function boardPwdConfirm(){
				if(checkExp("#passwd", "비밀번호를")) return;
				
				$.ajax({
					url : "/siteProject/board_exam/passwdCheck.do",
					type : "post",
					data : $("#f_pwd").serialize(), // 폼 전체 데이터 전송
					dataType : "text",
					
					success : function(resultData){
						
						var goUrl=""; // 이동할 경로를 저장할 변수
						if(resultData == 0){ // 불일치하는 경우
							$("#msg").text("작성 시 입력한 비밀번호가 일치하지 않습니다.").css("color", "red");
							$("#passwd").select();
						}else if(resultData == 1){ // 일치하는 경우
							$("#msg").text("비밀번호가 일치합니다.").css("color", "skyblue");
								
							// 비밀번호 검증 후, 버튼 구분 및 처리
							if(btnChk == 1){
								goUrl = "/siteProject/board_exam/updateForm.do";
							}
							
							if(btnChk == 2){
								goUrl = "/siteProject/board_exam/deleteBoard.do";	
							}
							
							$("#f_data").attr("action", goUrl);
							$("#f_data").submit();
						}
					},
					
					error : function(){
						alert("시스템 오류입니다. 관리자에게 문의하세요");
					}
					
				});
			}
		</script>
	</head>
	<body>
<%-- 		${requestScope.detail.content} --%>
		<h3 style="text-align: center;">글상세</h3>
		<div style="width: 90%; margin: 0px auto;">
			<form name="f_data" id="f_data" method="post">
				<%-- 값 전달을 위해 담을 input 생성 (보일 필요 없으니, hidden) --%>
				<input type="hidden" name="num" value="${detail.num }">
			</form>
				
			<%-- 비밀번호 확인 버튼 및 버튼 추가 시작 --%>
			<form class="form-inline" name="f_pwd" id="f_pwd">
				<div id="pwdChk" class="authArea form-group pull-left">
						<input type="hidden" name="num" id="num" value="${detail.num }" />
						<label for="b_pwd" id="l_pwd">비밀번호 : </label>
						<input type="password" name="passwd" id="passwd" />
						
						<button type="button" id="pwdBtn" class="btn-danger">확인</button>				
						<span id="msg"></span>
				</div>
			 	<div class="contentBtn form-group pull-right">
			  	  	<button type="button" class="btn btn-primary" id="boardUpdateBtn">수정</button>
				  	<button type="button" class="btn btn-success" id="boardDeleteBtn">삭제</button>
				  	<button type="button" class="btn btn-info" id="boardReplyBtn">답변</button>
				  	<button type="button" class="btn btn-warning" id="boardListBtn">목록</button>
			  	</div>
			</form>
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
						<td class="success text-center">작성자</td>
						<td colspan="3">${detail.author }</td>
					</tr>
					<tr>
						<td class="success text-center">글제목</td>
						<td colspan="3">${detail.title }</td>
					</tr>
					<tr>
						<td class="success text-center" style="line-height: 200px">글내용</td>
						<td colspan="3">${detail.content }</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div style="width: 90%; margin: 0px auto;">
			<c:import url="/WEB-INF/board_comment/getCommentList.jsp" />
		</div>
	</body>
</html>
