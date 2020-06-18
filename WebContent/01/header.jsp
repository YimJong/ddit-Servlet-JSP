<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	클라이언트(브라우저)의 서버 대상 요청 시 전송 정보(패킷)
	요청 라인 : 쿼리스트링의 전송방식(POST|GET), URL, 프로토콜 정보 
	요청 헤더 : 서버로부터 취득하고자 하는 응답 컨텐츠의 마임타입, 클라이언트(브라우저)의 요청 후 상태,
	                클라이언트(브라우저)의 정보(IE, Chrome, .... 구분 정보),
	                서버 접근 국가 - 언어코드, 쿠키와 세션 정보
	요청 본문 : 서버 대상 쿼리스트링 전송방식 POST시의 쿼리스트링 정보
	
	자버의 클라이언트 대상 응답 전송 정보(패킷)
	응답 라인 : 프로토콜 정보, 해당 요청의 서버 내 처리시의 상태 값과 상태 코드 정보
	응답 헤더 : 해당 요청을 처리한 서버 정보, 응답 처리 일시, 응답 컨텐츠의 전체 사이즈,
	                리다이렉트 컨텐츠(response.sendRedirect(URI))
	응답 본문 : 클라이언트 대상 전송되는 응답 컨텐츠의 내용
 -->
 클라이언트 IP Addr. : <%=request.getRemoteAddr() %><br/>
 클라이언트의 쿼리스트링 전송 시 쿼리스트링 사이즈 : <%=request.getContentLength() %><br/>
 클라이언트의 서버 요청 시 프로토콜 : <%=request.getProtocol() %><br/>
 요청시 URL : <%=request.getRequestURL() %><br/>
 요청시 URI : <%=request.getRequestURI() %><br/>
 컨텍스트 루브|패스 : <%=request.getContextPath() %><br/>
 서블릿 패스 : <%=request.getServletPath() %><br/>
 쿼리스트링 전송방식 : <%=request.getMethod() %><br/>
 요청 헤더 : <%=request.getHeader("Accept-Language") %><br/>
 요청 헤더 : <%=request.getHeader("User-Agent") %><br/>
 
</body>
</html>
