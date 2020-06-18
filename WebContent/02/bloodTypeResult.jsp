<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String bloodType = request.getParameter("bloodType");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String servletPath = "";
	if(bloodType.equals("a")) {
		servletPath = "a.jsp";
	} else if(bloodType.equals("b")) {
		servletPath = "a.jsp";
		//response.sendRedirect("/ddit/02/type/b.jsp");
	} else if(bloodType.equals("o")) {
		servletPath = "a.jsp";
		//response.sendRedirect("/ddit/02/type/o.jsp");
	} else if(bloodType.equals("ab")) {
		servletPath = "a.jsp";
		//response.sendRedirect("/ddit/02/type/ab.jsp");
	} 
	
	
	// 리다이렉트 응답 제어 처리
	// response.sendRedirect("/ddit/02/type/" + servletPath);
	// *컨텍스트 루트|패스가 배제된 서블릿 패스로 작성되어야 함.
	RequestDispatcher dispatcher = request.getRequestDispatcher("/02/type/" + servletPath);
	// forward(HttpServletRequest bloodTypeResult.jsp 리다이렉트 요청 시 생성
	//		   HttpServletResponse : bloodTypeResult.jsp 리다이렉트 요청 시 생성)
	dispatcher.forward(request, response);	
%>
	
</body>
</html>