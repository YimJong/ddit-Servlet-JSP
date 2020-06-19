<%@page import="kr.or.ddit.freeboard.service.IFreeBoardServiceImpl"%>
<%@page import="kr.or.ddit.freeboard.service.IFreeBoardService"%>
<%@page import="java.lang.reflect.InvocationTargetException"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="kr.or.ddit.vo.FreeBoardVO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 클라이언트의 form 태그 submit시 쿼리스트링 전송방식 POST일 때 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	FreeBoardVO freeboardInfo = new FreeBoardVO();
	
	try {
		BeanUtils.populate(freeboardInfo, request.getParameterMap());
	} catch (IllegalAccessException e){
		e.printStackTrace();
	} catch (InvocationTargetException e){
		e.printStackTrace();
	}
	
	IFreeBoardService service = IFreeBoardServiceImpl.getInstance();
	service.insertFreeboard(freeboardInfo);
%>
<c:redirect url="/13/main.jsp"></c:redirect>