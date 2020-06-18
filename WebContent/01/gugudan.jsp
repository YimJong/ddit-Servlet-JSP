<!-- 
	디렉티브 :해당  JSP(Java Server Page)파일의 설정 영역
	* contentType="text/html; charset=UTF-8"
	  response.setContextType="text/html; charset=UTF-8"
	* pageEncoding="UTF-8"
	  response.setCharacterEncoding("UTF-8");	
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	// 디클러레이션 : JSP 내 자바코드를 프로그래밍 하는 영역
	// 			   자바의 메서드 선언 영역
	private int multiple(int i, int j) {
		return i * j;
	}
%>
<!-- html, jquery, javascript, style code, css -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 스크립트릿 : 해당 JSP파일 내 비지니스 로직을 구성하는 영역
	//          자바 코드 프로그래밍 영역
	for(int i = 2; i < 10; i++) {
%>
		<!-- 익스프레션 : 스크립트릿 또는 디클러레이션 내 메서드의 변수, 메서드의 반환값을 활용해 동적인 응답 컨텐츠를 작성하기 위해 선언된 영역 -->
		<%= i %>단 입니다.<br/>	
<%
		for(int j = 1; j < 10; j++) {
%>
		<%= i %> * <%= j %> = <%= multiple(i, j) %><br/>
<%			
		}
	}
%>
</body>
</html>