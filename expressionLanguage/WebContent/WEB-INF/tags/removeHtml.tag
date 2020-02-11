<%@ tag language="java" pageEncoding="UTF-8" body-content="scriptless"
description="HTML 제거하기"%>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ attribute name="trim" %>
<%@ attribute name="length" type="java.lang.Integer"%>
<%@ attribute name="trail" %>

<jsp:doBody var="htmlTag"/>

<%
	JspContext jc = this.getJspContext();
	String content = (String)jc.getAttribute("htmlTag");

	if(trim != null){
		content = content.trim();
	}
	
	content = content.replaceAll("<[^<>]*>", "");
	
	if(length != null && length.intValue() > 0 && content.length() > length.intValue()){
		content = content.substring(0, length.intValue());
	}
	
	if(trail != null){
		content = content + trail;
	}
	
	jc.setAttribute("bodyData", content);
%>

<h2>HTML 태그 삭제 전</h2>
	${htmlTag }
<hr />

<h2>HTML 태그 삭제 후</h2>
	<%-- removeHtml 처리 후 반환된 속성을 사용 --%>
	${bodyData }
<hr />
