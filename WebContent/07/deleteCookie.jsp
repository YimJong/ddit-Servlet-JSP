<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	for(Cookie currentCookie : cookies) {
		if("mem_id".intern() == currentCookie.getName().intern()) {
			Cookie memidCookie = new Cookie("mem_id", "a001");
			memidCookie.setPath("/");
			memidCookie.setMaxAge(0);
			// 해당 쿠키의 유효시간(만료시간)을 0으로 설정 후
			// 응답객체의 응답헤더에 저장 및 클라이언트의 쿠키 저장소에
			// 저장처리로 해당 쿠키를 즉시 삭제.
			response.addCookie(memidCookie);
		}
		// makeCookie.jsp => viewCookie.jsp => deleteCookie.jsp
		// viewCookie.jsp
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
쿠키가 잘 삭제되었습니다.
</body>
</html>