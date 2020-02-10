<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag language="java" pageEncoding="UTF-8" body-content="scriptless" description="간단한 문자열 출력"%>
<%@ attribute name="value" required="true" rtexprvalue="true" %>
<%@ attribute name="color" required="false" rtexprvalue="true" %>

<span style="color: ${color}">
		${value }
</span>
