<%@page import="kr.or.ddit.listener.SessionManager"%>
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
	
	SessionManager.getInstance().loginDuplicationCheck(session.getId(), mem_id);
	
	Map<String, String> params = new HashMap<String, String>();
 	params.put("mem_id", mem_id);
 	params.put("mem_pass", mem_pass);
 	
	IMemberService service = IMemberServiceImpl.getInstance();
	MemberVO memberInfo = service.memberInfo(params);
	
	String message = URLEncoder.encode("로그인에 실패하였습니다.", "UTF-8");
	
	if(memberInfo == null) {
		response.sendRedirect(request.getContextPath() + "/12/loginForm.jsp?message=" + message);
	} else {
		String mem_name = memberInfo.getMem_name();
		session.setAttribute("mem_name", mem_name);
		response.sendRedirect(request.getContextPath() + "/12/main.jsp");
	}
%>