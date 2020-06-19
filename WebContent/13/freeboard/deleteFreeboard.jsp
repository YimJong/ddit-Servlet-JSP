<%@page import="kr.or.ddit.freeboard.service.IFreeBoardServiceImpl"%>
<%@page import="kr.or.ddit.freeboard.service.IFreeBoardService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String bo_no = request.getParameter("bo_no");

	Map<String, String> params = new HashMap<String, String>();
	params.put("bo_no", bo_no);
	
	IFreeBoardService service = IFreeBoardServiceImpl.getInstance();
	service.deleteFreeboard(params);
%>
<c:redirect url="/13/main.jsp"></c:redirect>