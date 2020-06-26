<%@page import="java.net.URLEncoder"%>
<%@page import="kr.or.ddit.prod.service.IProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.service.IProdService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// request.setCharacterEncoding("UTF-8");

	String prod_id = request.getParameter("prod_id");
	String prod_name = request.getParameter("prod_name");
	
	IProdService service = IProdServiceImpl.getInstance();
	
	int chk = 0;
	chk = service.deleteProd(prod_id);
	
	String message = URLEncoder.encode("성공", "UTF-8");
	
	if(chk > 0) {
		response.sendRedirect(request.getContextPath() + "/10/main.jsp?contextPage=/10/prodList.jsp&message=" + message);
	} else {
		response.sendRedirect(request.getContextPath() + 
				"/10/main.jsp?contextPage=/10/prodView.jsp&message=" + message + "&prod_name=" + prod_name);
	}
%>