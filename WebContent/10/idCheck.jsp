<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@page import="kr.or.ddit.prod.service.IProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.service.IProdService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String prod_id = request.getParameter("prod_id");
	
	ProdVO prodVO = new ProdVO();
	IProdService service = IProdServiceImpl.getInstance();
	prodVO = service.checkProdId(prod_id);
	
	if (prodVO != null) {
%>
		{
			"sw" : "사용 불가능한 상품코드"
		}
<%
	} else {
%>
		{
			"sw" : "사용 가능한 상품코드"
		}
<%
	}
%>