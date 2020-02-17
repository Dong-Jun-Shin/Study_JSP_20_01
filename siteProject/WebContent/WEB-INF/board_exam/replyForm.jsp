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
				var conText = $("#content").val();
				$("#content").val("\n\n>>>>>>>>> 기존 글 내용 >>>>>>>>>\n\n" + conText);
				
				// 답변 저장 버튼 클릭 시 처리 이벤트
				$("#boardInsertBtn").click(function(){
					if(checkExp("#author", "작성자")) return;
					if(checkExp("#passwd", "비밀번호")) return;
					if(checkExp("#title", "제목")) return;
					if(checkExp("#content", "내용")) return;
	
					$("#f_replyForm").attr({
						"method" : "post",
						"action" : "/siteProject/board_exam/insertReply.do"
					});
					
					$("#f_replyForm").submit();
				});
				
				$("#boardCancle").click(function(){
					$("#f_replyForm").attr({
						"method" : "post",
						"action" : "/siteProject/board_exam/detailBoard.do"
					});
					
					$("#f_replyForm").submit();
				});
			});
			
			// 에러메시지가 있을 시 출력 (EL 활용)
			var msg = "${errorMsg}";
			if(msg != ""){
				alert(msg);
			}
		</script>
	</head>
	<body>
		<h3 style="text-align: center;">답변 글 작성</h3>
		<div style="width: 90%; margin: 0px auto;">
			<form id="f_replyForm" name="f_replyForm">
			  <input type="hidden" name="num" value="${reply.num }">
			  <input type="hidden" name="repRoot" value="${reply.reproot }">
			  <input type="hidden" name="repIndent" value="${reply.repindent }">
			  <input type="hidden" name="repStep" value="${reply.repstep }">
			  <div class="form-group">
			    <label>답변을 작성할 게시글 번호 : </label>
			    <label>${reply.num } </label>
			    <label>(조회수 : </label>
			    <label>${reply.readcnt })</label>
			  </div>
			  <div class="form-group">
			    <label for="author">작성자</label>
			    <input type="text" class="form-control" name="author" id="author" placeholder="작성자를 입력하세요">
			  </div>
			  <div class="form-group">
			    <label for="passwd">비밀번호</label>
			    <input type="password" class="form-control" name="passwd" id="passwd" placeholder="암호">
			  </div>
			  <div class="form-group">
			    <label for="title">제목</label>
			    <input type="text" class="form-control" name="title" id="title" value="[답변] ${reply.title }">
			  </div>
			  <div class="form-group">
			    <label for="content">내용</label>
			    <textarea class="form-control" name="content" id="content" rows="5">${reply.content }</textarea>
			  </div>
			  
			  <div class="contentBtn text-right">
				  <button type="button" class="btn btn-default" id="boardInsertBtn">제출</button>
				  <button type="reset" class="btn btn-default" id="boardCancle">취소</button>
			  </div>
			</form>
		</div>
	</body>
</html>
