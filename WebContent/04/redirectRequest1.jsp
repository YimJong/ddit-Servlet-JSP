<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Map<String, String> params = new HashMap<String, String>();
	params.put("mem_id", "a001");
	
	IMemberService service = IMemberServiceImpl.getInstance();
	MemberVO memberInfo = service.memberInfo(params);
	
	// 기본객체(9개) 중 저장영역(Scope)을 포함하는 기본객체(4개)
	// pageContext(pageScope), request(requestScope), session(sessionScope), application(applicationScope)
	// 저장영역 대상 데이터 저장, 수정, 삭제, 취득 시 공통 메서드
	// 저장 - 기본 객체명.setAttribute(키, 값) : 해당 값은 Object 타입으로 업캐스팅 처리.
	// 취득 - 기본 객체명.getAttribute(키) : 취득 한 값은 해당 타입으로 다운캐스팅 후 활용.
	// 수정 - 기본 객체명.setAttribute(기존 동일 키, 상이 값) : 해당 값은 Object 타입으로 업캐스팅 처리.
	// 삭제 - 기본 객체명.removeAttribute(키)
	pageContext.setAttribute("pageMemberInfo", memberInfo);
	request.setAttribute("reqMemberInfo", memberInfo);
	session.setAttribute("sesMemberInfo", memberInfo);
	application.setAttribute("appMemberInfo", memberInfo);
	// /ddit => /
	response.sendRedirect(request.getContextPath() + "/04/redirectRequest2.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>pageContext 영역 값 취득</h3>
	아이디 : <%=((MemberVO)pageContext.getAttribute("pageMemberInfo")).getMem_id()%> <br>
	패스워드 : <%=((MemberVO)pageContext.getAttribute("pageMemberInfo")).getMem_pass()%> <br>
	성명 : <%=((MemberVO)pageContext.getAttribute("pageMemberInfo")).getMem_name()%> <br>
	
	<h3>request 영역 값 취득</h3>
	아이디 : <%=((MemberVO)request.getAttribute("reqMemberInfo")).getMem_id()%> <br>
	패스워드 : <%=((MemberVO)request.getAttribute("reqMemberInfo")).getMem_pass()%> <br>
	성명 : <%=((MemberVO)request.getAttribute("reqMemberInfo")).getMem_name()%> <br>
	
	<h3>session 영역 값 취득</h3>
	아이디 : <%=((MemberVO)session.getAttribute("sesMemberInfo")).getMem_id()%> <br>
	패스워드 : <%=((MemberVO)session.getAttribute("sesMemberInfo")).getMem_pass()%> <br>
	성명 : <%=((MemberVO)session.getAttribute("sesMemberInfo")).getMem_name()%> <br>
	
	<h3>application 영역 값 취득</h3>
	아이디 : <%=((MemberVO)application.getAttribute("appMemberInfo")).getMem_id()%> <br>
	패스워드 : <%=((MemberVO)application.getAttribute("appMemberInfo")).getMem_pass()%> <br>
	성명 : <%=((MemberVO)application.getAttribute("appMemberInfo")).getMem_name()%> <br>
</body>
</html>