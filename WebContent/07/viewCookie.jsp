<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 클라이언트(브라우저)의 쿠키 저장소에 저장된 쿠키는 쿠키 생성 시
	// 패스, 도메인 속성을 기초로 해당 클라이언트의 서버 대상 요청 시
	// 동반 전송(요청 패킷의 요청 헤더)
	Cookie[] cookies = request.getCookies();
	for(Cookie cookie : cookies) {
		out.println("key : " + cookie.getName() +
					" | value : " + URLDecoder.decode(cookie.getValue(), "UTF-8") + "<br>");
	}
	
%>
