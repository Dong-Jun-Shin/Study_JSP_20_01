<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<link rel="stylesheet" type="text/css" href="/siteProject/include/css/common.css" />
		<link rel="stylesheet" type="text/css" href="/siteProject/include/css/comment.css" />
		<link rel="stylesheet" type="text/css"
		href="/siteProject/include/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css"
		href="/siteProject/include/dist/css/bootstrap-theme.css" />
		
		
		<script type="text/javascript" src="/siteProject/include/js/common.js"></script>
		<script type="text/javascript" src="/siteProject/include/js/commentRUD.js"></script>
		<script type="text/javascript" src="/siteProject/include/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="/siteProject/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			// 새로운 글을 화면에 추가하기 위한 함수
	        var num = 0;
	        var btnChk = 0;
			var message = "작성 시 입력한 비밀번호를 입력해 주세요."
	        
			$(function(){
				// 기본 댓글 목록 불러오기
				var num = ${detail.num};
				listAll(num);
								
				// 댓글 등록을 위한 Post 방식의 Ajax 연동 처리
				$("#insertComment").click(function(){
					if(checkExp("#bc_name", "아이디")) return;
					if(checkExp("#bc_pwd", "비밀번호")) return;
					if(checkExp("#bc_content", "내용")) return;
					
					var insertUrl = "/siteProject/board_comment/insertComment.do";
					$.ajax({
						url : insertUrl,
						type : "post",
						
						//JSON으로 전달
						headers : {
							"Content-Type" : "application/json"
						},
						data : JSON.stringify({
							num : num,
							bc_name : $("#bc_name").val(),
							bc_pwd : $("#bc_pwd").val(),
							bc_content : $("#bc_content").val()
						}),  
						
						dataType : "text", //성공, 실패 여부를 반환
						
						success : function(resultData){
							if(resultData == "SUCCESS"){
								alert("댓글 등록이 완료되었습니다.");
								dataReset();
								listAll(num);
							}
						},
						
						error : function(data){
							alert("시스템 오류입니다. 관리자에게 문의하세요.");
						}
					});
				});
				
				// 문서의 부여한 이벤트가 선택한 클래스에서 해당할 때 실행 (이벤트, 클래스, 함수)
				// 수정하기 클릭 시, 비밀번호를 입력받는 폼 생성
				$(document).on("click", ".update_btn", function(){
					$(".cancel_proc").click();
					$(this).parents("ul").find("div").remove();
					pwdForm($(this));
					
					btnChk = 1;
				});
				
				$(document).on("click", ".delete_btn", function(){
					$(".cancel_proc").click();
					$(this).parents("ul").find("div").remove();
					pwdForm($(this));

					btnChk = 2;
				});
				
				// 비밀번호 입력 폼에 커서가 주어졌을 경우 처리 이벤트
				$(document).on("focus", ".passwd", function(){
					// css 요소 적용, 삭제
					var span = $(this).parent("div").find("span");
					span.removeClass("msg_error");
					span.addClass("msg_default");
					span.html(message);
				});
				
				// 비밀번호 입력 폼에서 확인 클릭 이벤트 처리
				$(document).on("click", ".pwd_btn", function(){
					var bc_pwd = $(this).prev();
					var bc_num = $(this).parents("li").attr("data-bc_num");
					var msg = $(this).parent().children("span");
						
					// detailBoard.jsp의 num 가져오기 = 가능
					$("#processForm > input[name='num']").val(${detail.num });
					$("#processForm > input[name='bc_num']").val(bc_num);

					// 비밀번호 체크 (알림창 출력)
// 					if(checkExp(bc_pwd, "비밀번호")) return;
					// 비밀번호 체크 (영역 출력)
					if(formCheck(bc_pwd, msg, "비밀번호를")) return;
					
					// 비밀번호 체크 처리 함수 (비밀번호, 댓글 번호, 오류 메시지)
					commentPwdConfirm(bc_pwd.val(), bc_num, msg);
				});
				
				// 비밀번호 입력 폼에서 취소 클릭 이벤트 처리
				$(document).on("click", ".cancel_btn", function(){
					//$(this).parent("div").remove();
					//$(this).parents("li").find(".form-inline").html("");
					$("li .form-inline").not(this).html("");
				});
				
				// 수정 폼에서 '수정하기' 클릭 이벤트 처리
				$(document).on("click", ".update_proc", function(){
					var goUrl = "/siteProject/board_comment/updateComment.do";
					var bc_num = $(this).parents("li").attr("data-bc_num");
					var bc_content = $("textarea[name=bc_content]").eq(1); 
					
					if(checkExp(bc_content, "내용")) return;
					
					$.ajax({
						url: goUrl,
						type: "post",
						headers: {
							"Content-Type" : "application/json"
						},
						data: JSON.stringify({
							bc_num: bc_num,
							bc_content: bc_content.val()
						}),
						dataType: "text",
						
						error: function(){
							alert("시스템 오류입니다. 관리자에게 문의하세요.");
						},
						
						success: function(result){
							if(result == "SUCCESS"){
								alert("수정이 완료되었습니다.");
								listAll(num);
							}
						}
						
					})
					
// 					// form으로 전송하는 방법
// 					$("#processForm").attr({
// 						"action" : goUrl,
// 						"method" : "post"
// 					});
// 					$("#processForm").submit();
				});				
				
				// 수정 폼에서 '취소하기' 클릭 이벤트 처리
				$(document).on("click", ".cancel_proc", function(){
				    var li = $(this).parents("li");
				    
					var content = $(this).parents("li").find("textarea").html();
					content = content.replace(/(\r\n|\r|\n)/g, "<br />");
					
					var content_p = $("<p>");
					content_p.html(content);
					
					
					var name_p = li.children().eq(0); 
					li.children().remove();
					
					li.append(name_p).append(content_p);
					li.children("p").children("input").show();
				});
			});
		</script>
	</head>
	<body>
		<div id="container">
			<h1 class="title">Insert Comment</h1>
			<div class="console" id="comment_write">
				<form action="" method="get" id="comment_form" name="comment_form">
					<div>
						<label for="bc_name">작성자</label>
						<input type="text" id="bc_name" name="bc_name">
						<label for="bc_pwd">비밀번호</label>
						<input type="password" id="bc_pwd" name="bc_pwd">
						<button type="button" class="btn btn-warning" id="insertComment">저장하기</button>
					</div>
					<div>
						<label>댓글 내용</label>
						<textarea rows="6" cols="56" id="bc_content" name="bc_content"></textarea>
					</div>
				</form>
			</div>
			<div class="console">
				<form id="processForm">
					<input type="hidden" name="num" />
					<input type="hidden" name="bc_num" />
					<ul id="comment_list"></ul>
				</form>
			</div>
		</div>
	</body>
</html>