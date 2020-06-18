<%@page import="java.net.URLEncoder"%>
<%@page import="kr.or.ddit.prod.service.IProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.service.IProdService"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	IProdService service = IProdServiceImpl.getInstance();
	ProdVO prodInfo = new ProdVO();
	
	BeanUtils.populate(prodInfo, request.getParameterMap());
	
	service.insertProd(prodInfo);
	String message1 = URLEncoder.encode("등록에 성공하였습니다.", "UTF-8");
	
	response.sendRedirect(request.getContextPath() + "/10/main.jsp?message1=" + message1);
	
%>