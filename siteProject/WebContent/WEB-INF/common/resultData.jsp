<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%-- ajax에서 파싱하기 위해 출력하는 JSP페이지 --%>
<%-- request 안에 있는 속성을 getAttribute한다. --%>
<%-- ${resultData } <!-- requestScope 생략 --> --%>
${requestScope.resultData }
