<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");

	IMemberService service = IMemberServiceImpl.getInstance();
	String mem_id = request.getParameter("mem_id");
	Map<String, String> params = new HashMap<String, String>();
	params.put("mem_id", mem_id);
	
	service.deleteMemberInfo(params);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("/06/memberList.jsp");
	dispatcher.forward(request, response);
%>
