<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStreamReader"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />      	

		<title>application 자원 가져오기</title>
		
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
		<p>자원의 실제 경로:</p>
		<%
			String path = application.getRealPath("/WebContent");
		%>
		<%= path %>
		<p>------------------------------------</p>
		/message/notice.txt의 내용
		<p>------------------------------------</p>
		<%
			String resourcePath = "/message/notice.txt";
			char[] buff = new char[128];
			
			//문자 길이만큼 한 글자씩 읽어서 출력
			int len = -1;
			
			URL url = application.getResource(resourcePath);
			try(InputStreamReader br = new InputStreamReader(url.openStream(), "UTF-8")){;
				while((len = br.read(buff)) != -1){
					out.print(new String(buff, 0, len).replaceAll("(\r\n|\r|\n|\n\r)", "<br />"));
				}
			}catch(IOException ex){
				out.println("예외 발생: " + ex.getMessage());
			}
			
			//한 줄씩 읽어서 출력
// 			String line = "";
			
// 			URL url = application.getResource(resourcePath);
// 			try(BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));){
// 				while((line = br.readLine()) != null){
// 					out.print(line);
// 					out.print("<br />");
// 				}
// 			}catch(IOException ex){
// 				out.println("예외 발생: " + ex.getMessage());
// 			}
		%>
	</body>
</html>
