<%@page import="java.net.URLEncoder"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	IMemberService service = IMemberServiceImpl.getInstance();
	
	String mem_id = request.getParameter("mem_id");
	
	String mem_pass = request.getParameter("mem_pass");
	
	out.println("확인 : " + mem_id + " : " + mem_pass);
	
	Map<String, String> params = new HashMap<String, String>();
	params.put("mem_id", mem_id);
	params.put("mem_pass", mem_pass);
	
	MemberVO memberInfo = new MemberVO();
	memberInfo = service.memberInfo(params);
	
	if(memberInfo != null) {
		// 인증된 회원
		session.setAttribute("LOGINMEMBERINFO", memberInfo);
		response.sendRedirect(request.getContextPath() + "/06/memberList.jsp");
	} else {
		String message = URLEncoder.encode("회원이 아닙니다.", "UTF-8"); // 인코딩 후 저장.
		response.sendRedirect(request.getContextPath() + "/06/loginForm.jsp?=message" + message);
	}
%>
