<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String mem_id = request.getParameter("mem_id");
	
	Map<String, String> params = new HashMap<String, String>();
	params.put("mem_id", mem_id);
	
	IMemberService service = IMemberServiceImpl.getInstance();
	MemberVO memberInfo = service.memberInfo(params);
	// Map, List, Set, VO => json 형식의 문자열로 전이
	// http://search.maven.org
	// jackson-core-asl-1.9.13.jar
	// jackson-mapper-asl-1.9.13.jar
	// WEB-INF / lib import
	
	Map<String, String> jsonMap = new HashMap<String, String>();
	if(memberInfo == null) {
		// { "flag" : "true" }
		jsonMap.put("flag", "true");
	} else {
		// { "flag" : "false" }
		jsonMap.put("flag", "false");
	}
	
	ObjectMapper jsonDataConvertor = new ObjectMapper();
	String jsonData = jsonDataConvertor.writeValueAsString(jsonMap); 
		
	out.println(jsonData);
%>






