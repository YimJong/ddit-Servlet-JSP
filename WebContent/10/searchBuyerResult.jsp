<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerServiceImpl"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// request.setCharacterEncoding("UTF-8");
	String buyer_name = request.getParameter("buyer_name");
	
	Map<String, String> params = new HashMap<String, String>();
	params.put("buyer_name", buyer_name);
	
	IBuyerService service = IBuyerServiceImpl.getInstance();
	List<BuyerVO> buyerList = service.searchBuyer(params);
	
	ObjectMapper jsonDataConvertor = new ObjectMapper();
	String jsonData = jsonDataConvertor.writeValueAsString(buyerList);
	
	out.println(jsonData);
%>
