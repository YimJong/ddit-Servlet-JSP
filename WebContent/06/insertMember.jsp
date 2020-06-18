<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	IMemberService service = IMemberServiceImpl.getInstance();
	MemberVO memberInfo = new MemberVO();
		
	
	BeanUtils.populate(memberInfo, request.getParameterMap());
	
	service.insertMember(memberInfo);
	
	
	response.sendRedirect("/ddit/06/loginForm.jsp");
	
%>

</body>
</html>