<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// request.setCharacterEncoding("UTF-8");
	String buyer_id = request.getParameter("buyer_id");
	
	IBuyerService service = IBuyerServiceImpl.getInstance();
	BuyerVO buyerInfo = service.buyerIdCheck(buyer_id);
	
	Map<String, String> resultMap = new HashMap<String, String>();
	
	if(buyerInfo != null) {
		resultMap.put("res", "1");
	} else {
		resultMap.put("res", "2");
	}
	
	ObjectMapper dataConvertor = new ObjectMapper();
	String jsonData = dataConvertor.writeValueAsString(resultMap);
	
	out.println(jsonData);
%>
