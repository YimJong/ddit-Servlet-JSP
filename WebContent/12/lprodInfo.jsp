<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="kr.or.ddit.vo.LprodVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.prod.service.IProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.dao.IProdDaoImpl"%>
<%@page import="kr.or.ddit.prod.service.IProdService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	IProdService service = IProdServiceImpl.getInstance();
	List<LprodVO> lprodList = service.selectAllLprod();
	
	ObjectMapper dataConvertor = new ObjectMapper();
	String jsonData = dataConvertor.writeValueAsString(lprodList);
	
	out.println(jsonData);
%>