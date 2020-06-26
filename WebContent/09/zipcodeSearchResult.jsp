<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="kr.or.ddit.vo.ZipcodeVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.zipcode.service.IZipcodeServiceImpl"%>
<%@page import="kr.or.ddit.zipcode.service.IZipcodeService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// request.setCharacterEncoding("UTF-8");
	String dong = request.getParameter("dong");
	
	Map<String, String> params = new HashMap<String, String>();
	params.put("dong", dong);
	
	// 웹 애플리케이션 : 테이블 1개당  service, dao, vo가 하나씩 맵핑.
	IZipcodeService service = IZipcodeServiceImpl.getInstance();
	List<ZipcodeVO> zipcodeList = service.zipcodeList(params);
	
	ObjectMapper jsonDataConvertor = new ObjectMapper();
	String jsonData = jsonDataConvertor.writeValueAsString(zipcodeList);
	
	out.println(jsonData);
%>
   