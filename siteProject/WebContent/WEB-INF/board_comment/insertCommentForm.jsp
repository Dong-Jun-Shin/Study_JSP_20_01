<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/siteProject/include/css/common.css" />
<link rel="stylesheet" type="text/css" href="/siteProject/include/css/comment.css" />

<script type="text/javascript" src="/siteProject/include/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$.ajax({
			url: "../ajax/comment/comment_list.json",
			type: "get",
			dataType: "json",
			timeout: 30000,
			cache: false,
			
			success: function(json){
				var item = json.comment.item;
				
				$(item).each(function(){
					var num = this.num;
					var writer = this.writer + "님";
					var content = this.content;
					var datetime = this.datetime;
					
					var li = $("<li style='border-bottom: 1px solid lightgray'>");

					var p1 = $("<p>");
					var span = $("<span>");
					var name = $("<strong>");
					name.html(writer);
					
					var remove = $("<input type='button' class='remove' name='remove' value='삭제하기'>"); 
					
					span.append(name).append(" / ").append(datetime).append(remove);
					p1.append(span);
					
					var p2 = $("<p>");
					p2.html(content);
					
					li.append(p1).append(p2);
					$("#comment_list").append(li);
				});
			},
			
			error: function(xhr, textStatus, errorThrown){
				//alert("오류가 발생했습니다. <br />" + "오류 상태: " + errorThrown + "<br />오류: " + textStatus);
			}
		});
		
		// 문서의 부여한 이벤트가 선택한 클래스에서 해당할 때 실행 (이벤트, 클래스, 함수)
		$(document).on("click", ".remove", function(){
			if(confirm("댓글을 지우시겠습니까?")){
				$(this).parents("li").remove();
			};
		});
		
		$("#comment_form").submit(function(){
			var writer = $("#user_name").val() + "님";
			var datetime = new Date();
			var content = $("#comment").val();
			
			if(writer.replace(/\s/g, "")==""){
				alert("작성자를 입력해주세요.");
				$("#user_name").focus();
				
				return false;
			}

			if(content.replace(/\s/g, "")==""){
				alert("내용을 입력해주세요.");
				$("#comment").val("");
				$("#comment").focus();
				
				return false;
			}
			
			var li = $("<li style='border-bottom: 1px solid lightgray'>");

			var p1 = $("<p>");
			var span = $("<span>");
			var name = $("<strong>");
			name.html(writer);
			
			var remove = $("<input type='button' class='remove' name='remove' value='삭제하기'>");
			
			span.append(name).append(" / ").append(datetime.toJSON()).append(remove);
			p1.append(span);
			
			var p2 = $("<p>");
			p2.html(content);
			
			li.append(p1).append(p2);
			$("#comment_list").prepend(li);
			
			$("#user_name").val("");
			$("#comment").val("");
			
			return false;
		});
	});
</script>
<div id="container">
	<h1 class="title">Insert Comment</h1>
	<div class="console" id="comment_write">
		<form action="" method="get" id="comment_form" name="comment_form">
			<div>
				<label>작성자</label>
				<input type="text" id="user_name" name="user_name">
				<button type="submit">저장하기</button>
			</div>
			<div>
				<label>댓글 내용</label>
				<textarea rows="6" cols="60" id="comment" name="comment"></textarea>
			</div>
		</form>
	</div>
	<div class="console">
		<ul id="comment_list"></ul>
	</div>
</div>
