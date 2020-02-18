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
		<script type="text/javascript" src="/siteProject/include/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="/siteProject/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			// 새로운 글을 화면에 추가하기 위한 함수
	        var num = 0;
	        var btnChk = 0;
			
			$(function(){
				// 기본 댓글 목록 불러오기
				var num = ${detail.num};
				listAll(num);
				
				$("#comment_form").submit(function(){
					var writer = $("#bc_name").val() + "님";
					var datetime = new Date();
					var content = $("#bc_content").val();
					
					if(writer.replace(/\s/g, "")==""){
						alert("작성자를 입력해주세요.");
						$("#bc_name").focus();
						
						return false;
					}
		
					if(content.replace(/\s/g, "")==""){
						alert("내용을 입력해주세요.");
						$("#bc_content").val("");
						$("#bc_content").focus();
						
						return false;
					}
				});
				
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
					$(this).parents("ul").find("div").remove();
					pwdForm($(this));
					
					btnChk = 1;
				});
				
				$(document).on("click", ".delete_btn", function(){
					$(this).parents("ul").find("div").remove();
					pwdForm($(this));

					btnChk = 2;
				});
				
				// 비밀번호 누르고 확인 후 체크
				$(document).on("click", ".pwd_btn", function(){
					var bc_pwd = $(this).prev();
					if(checkExp(bc_pwd, "비밀번호")) return;

					var bc_num = $(this).parents("li").attr("data-bc_num");
					commentPwdConfirm(bc_pwd.val(), bc_num);
					
					$("#processForm > input").val(bc_num)
					$(this).parent("div").remove();
				});
			});
			
			// 업데이트 폼 생성
	     	function updateForm(elem, content){
				//업데이트 폼 해당 댓글만 변하도록 하기
				
			   var name_span = $("#comment_list").find("li").children("p").children("span").prev(); 
			   var content = $("#comment_list").find("li").children("p").next().html();
			   
	           var name_p = $("<p>");
	           name_p.addClass("writer");
	           name_p.append(name_span);
	           
	           var content_area = $("<textarea rows='6' cols='45' name='bc_content'>");
	           content_area.html(content);
	           
			   var update_input = $("<input>");
	           update_input.attr({"type" : "button", "value" : "수정하기", "style" : "float: right;"});
	           update_input.addClass("update_proc").addClass("btn").addClass("btn-info");
	           
	           $("#comment_list").find("li").children("p").remove();
	           $("#comment_list").find("li").append(name_p).append(content_area);
	           $("#comment_list").find("li").append(update_input);
	     	}
			
	        // 아래 함수 addNewItem(글번호, 작성자 이름, 댓글 내용, 작성일시)
	        function addNewItem(bc_num, bc_name, bc_content, bc_date){
	           var new_li = $("<li>");
	           new_li.attr("data-bc_num", bc_num);
	           new_li.addClass("comment_item");
	           
	           var writer_p = $("<p>");
	           writer_p.addClass("writer");
	           
	           var name_span = $("<span>");
	           name_span.addClass("name");
	           name_span.html(bc_name + "님");
	           
	           var date_span = $("<span>");
	           date_span.html(" / " + bc_date + " ");
	           
	           var update_input = $("<input>");
	           update_input.attr({"type" : "button", "value" : "수정하기", "style" : "margin: 5px;"});
	           update_input.addClass("update_btn").addClass("btn").addClass("btn-info");
	           
	           var del_input = $("<input>");
	           del_input.attr({"type" : "button", "value" : "삭제하기", "style" : "margin: 5px;"});
	           del_input.addClass("delete_btn").addClass("btn").addClass("btn-info");
	           
	           var content_p = $("<p>");
	           content_p.html(bc_content);
	           
	           writer_p.append(name_span).append(date_span).append(update_input).append(del_input);
	           new_li.append(writer_p).append(content_p);
	           $("#comment_list").append(new_li).append($("<hr />"));
	        }
			
	        // DB 데이터를 JSON으로 가공한 후, 페이지에 출력
	        function listAll(num){
	        	// 기존 가지고 있는 목록 비우기
	        	$("#comment_list").html("");
	        	
	        	// ajax를 이용해서 JSON을 결과로 받아오기
	        	var url = "/siteProject/board_comment/getCommentList.do?num=" + num;
				$.getJSON(url, function(data){
					//console.log("list count: " + data.length); - 댓글 수
					replyCnt = data.length;
					
					// JSON 배열 수 만큼 목록을 구성
					$(data).each(function(){
						var bc_num = this.bc_num;
						var bc_name = this.bc_name;
						var bc_content = this.bc_content;
						var bc_date = this.bc_date;
						// 줄바꿈 문자를 태그로 변환
						bc_content = bc_content.replace(/(\r\n|\r|\n)/g, "<br />");
						
						addNewItem(bc_num, bc_name, bc_content, bc_date);
					});
				}).fail(function(){
					alert("댓글 목록을 불러오는데 실패했습니다. 잠시후에 다시 시도해 주세요.");
				});
	        }
	        
	        function dataReset(){
	        	$("#bc_name").val("").focus();
				$("#bc_pwd").val("").focus();
				$("#bc_content").val("").focus();
	        }
	        
	        function pwdForm(elem){
	        	var pwd_div = $("<div>");
				pwd_div.addClass("form-inline");
				
				var pwd_input = $("<input type='password' name='bc_pwd'>");
				
				var pwd_btn = $("<button type='button' style='margin: 0px 5px;'>");
				pwd_btn.addClass("pwd_btn");
				pwd_btn.html("확인");
				
				pwd_div.append(pwd_input).append(pwd_btn);
				elem.parent("p").parent("li").append(pwd_div);
	        }
	        
	     	// 비밀번호 확인 클릭 시, 실질적으로 처리하는 함수
			function commentPwdConfirm(_bc_pwd, _bc_num){
				$.ajax({
					url : "/siteProject/board_comment/passwdCheck.do",
					type : "post",
					data : "bc_num=" + _bc_num + "&bc_pwd=" + _bc_pwd, // 폼 전체 데이터 전송
					dataType : "text",
					
					success : function(resultData){
						var goUrl=""; // 이동할 경로를 저장할 변수
						
						if(resultData == 0){ // 불일치하는 경우
							alert("비밀번호가 일치하지 않습니다.");
						}else if(resultData == 1){ // 일치하는 경우
							// 비밀번호 검증 후, 버튼 구분 및 처리 (1=수정, 2=삭제)
							if(btnChk == 1){
								// 업데이트 폼 생성 함수 사용
								updateForm($(this));
							}
							
							if(btnChk == 2){
 								goUrl = "/siteProject/board_comment/deleteComment.do";	
 								$("#processForm").attr("action", goUrl);
 	 							$("#processForm").submit();
 	 							alert("댓글이 삭제되었습니다.");
							}
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
					<input type="hidden" name="bc_num" />
					<ul id="comment_list"></ul>
				</form>
			</div>
		</div>
	</body>
</html>