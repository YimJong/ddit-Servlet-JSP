<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	MemberVO memberVO = new MemberVO();
	
	BeanUtils.populate(memberVO, request.getParameterMap());
	
	IMemberService service = IMemberServiceImpl.getInstance();
	service.updateMemberInfo(memberVO);
	
	response.sendRedirect(request.getContextPath() + "/06/memberList.jsp");

%>

