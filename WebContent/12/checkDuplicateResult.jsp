<%@page import="java.util.List"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.prod.service.IProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.service.IProdService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String lprod_nm = request.getParameter("lprod_nm");
	IProdService service = IProdServiceImpl.getInstance();
	
	String buyer_id= service.getLatestBuyerId(lprod_nm);
	if(buyer_id.equals("P")) {
		String temp = service.getBuyerIdInit(lprod_nm);
		buyer_id = buyer_id + temp + "01";
	}
	Map<String, String> data = new HashMap<String, String>();
	data.put("buyer_id", buyer_id);
	data.put("lprod_nm", lprod_nm);
	
	ObjectMapper dataConvertor = new ObjectMapper();
	String jsonData = dataConvertor.writeValueAsString(data);
	
	out.println(jsonData);
%>