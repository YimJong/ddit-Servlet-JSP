<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	클라이언트는 서버로부터 발생된 에러 정보를 취득(상태 코드 : 500 시리즈, 상태값)
	513바이트 미만의 에러 정보가 클라이언트에 전송되면 에러 컨텐츠를 랜더링 하지 않음.
 -->
익셉션 클래스 : <%=exception.getClass().getName() %> <br>
익셉션 메세지 : <%=exception.getMessage() %>
</body>
</html>