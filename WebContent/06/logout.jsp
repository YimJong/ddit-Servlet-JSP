<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();

	String message = URLEncoder.encode("로그아웃 되었습니다.", "UTF-8");
	response.sendRedirect(request.getContextPath() + "/06/loginForm.jsp?message=" + message);
%>
