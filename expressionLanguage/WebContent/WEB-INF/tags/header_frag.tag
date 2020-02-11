<%@ tag language="java" pageEncoding="UTF-8" body-content="empty"%>
<%@ tag trimDirectiveWhitespaces="true"%>

<%@ attribute name="title" required="true" fragment="true"%>
<%@ attribute name="level" required="false" type="java.lang.Integer"%>

<%
	String headStartTag = null;
	String headEndTag = null;
	
	if(level == null){
		headStartTag = "<h1>";
		headEndTag = "</h1>";
	} else if(level == 1){
		headStartTag = "<h1>";
		headEndTag = "</h1>";
	} else if(level == 2){
		headStartTag = "<h2>";
		headEndTag = "</h2>";
	} else if(level == 3){
		headStartTag = "<h3>";
		headEndTag = "</h3>";
	}
%>

<%= headStartTag %>
<%-- 출력 스트림 객체 주소값 --%>
${title }<br/>
<%-- attribute 액션 태그의 몸통 부분 출력 --%>
<jsp:invoke fragment="title" />
<%= headEndTag %>