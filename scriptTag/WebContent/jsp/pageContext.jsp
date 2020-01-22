<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>Include, forward</title>
		
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
		<%!
			public void work(String param, PageContext page){
				try{
					JspWriter out = page.getOut();
					
					if(param==null){
						out.print("다음과 같은 형식으로 URL을 요청해야 정상 처리 됩니다. <br />");
						out.print("http://localhost:8080/scriptTag/jsp/pageContext.jsp?param=include or forward");
						return;
					}
					
					if(param.equals("include")){
						out.print("-- include 전 -- <br /><hr />");
						page.include("page.jsp");
						out.print("<br /><hr />-- include 후 -- <br /><hr />");
					}else if(param.equals("forward")){
						page.forward("page.jsp");
					}
				}catch(Exception e){
					System.out.println("오류 발생!!");
				}
			}
		%>
		<%
			String param = request.getParameter("param");
			this.work(param, pageContext);
		%>
	</body>
</html>

