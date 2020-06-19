<%@page import="java.security.PrivateKey"%>
<%@page import="kr.or.ddit.utils.CryptoGenerator"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="javax.print.URIException"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mem_id = request.getParameter("mem_id");
	String mem_pass = request.getParameter("mem_pass");
	
	mem_id = CryptoGenerator.decryptRSA(session, mem_id);
	mem_pass = CryptoGenerator.decryptRSA(session, mem_pass);
	
	Map<String, String> params = new HashMap<String, String>();
 	params.put("mem_id", mem_id);
 	params.put("mem_pass", mem_pass);
 	
	IMemberService service = IMemberServiceImpl.getInstance();
	MemberVO memberInfo = service.memberInfo(params);
	
	String message = URLEncoder.encode("로그인에 실패하였습니다.", "UTF-8");
	
	if(memberInfo == null) {
		response.sendRedirect(request.getContextPath() + "/13/main.jsp?message=" + message);
	} else {
		session.setAttribute("LOGIN_MEMBERINFO", memberInfo);
		response.sendRedirect(request.getContextPath() + "/13/main.jsp");
	}
%>