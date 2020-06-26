<%@page import="java.net.URLEncoder"%>
<%@page import="kr.or.ddit.prod.service.IProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.service.IProdService"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// request.setCharacterEncoding("UTF-8");
	
	ProdVO prodInfo = new ProdVO();
	
	BeanUtils.populate(prodInfo, request.getParameterMap());
	
	IProdService service = IProdServiceImpl.getInstance();
	
	service.updateProd(prodInfo);
	String message = URLEncoder.encode("성공적으로 수정하였습니다.", "UTF-8");
	
	response.sendRedirect(request.getContextPath() + "/10/main.jsp?contextPage=/10/prodList.jsp&message=" + message);
	
%>