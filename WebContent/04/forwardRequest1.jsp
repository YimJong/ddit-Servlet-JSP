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
	// pageContext, request, session, application
	// 저장영역 대상 데이터 저장, 수정, 삭제, 취득 시 공통 메서드
	// 저장 - 기본 객체명.setAttribute(키, 값) : 해당 값은 Object 타입으로 업캐스팅 처리.
	// 취득 - 기본 객체명.getAttribute(키) : 취득 한 값은 해당 타입으로 다운캐스팅 후 활용.
	// 수정 - 기본 객체명.setAttribute(기존 동일 키, 상이 값) : 해당 값은 Object 타입으로 업캐스팅 처리.
	// 삭제 - 기본 객체명.removeAttribute(키)
	pageContext.setAttribute("pageMemberInfo", memberInfo);
	request.setAttribute("reqMemberInfo", memberInfo);
	session.setAttribute("sesMemberInfo", memberInfo);
	application.setAttribute("appMemberInfo", memberInfo);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("/04/forwardRequest2.jsp");
	dispatcher.forward(request, response);
%>
