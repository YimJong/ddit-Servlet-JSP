<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션 삭제
	session.invalidate();
	// 또는
	// session.setMaxInactiveInterval(-1);
%>
