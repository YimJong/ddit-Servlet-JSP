<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	session.invalidate();
%>
<c:redirect url="/13/main.jsp">
	<c:param name="message" value="로그아웃 되었습니다."></c:param>
</c:redirect>