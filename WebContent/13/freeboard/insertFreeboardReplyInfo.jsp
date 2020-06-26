<%@page import="kr.or.ddit.utils.FileUploadRequestWrapper"%>
<%@page import="kr.or.ddit.freeboard.service.IFreeBoardServiceImpl"%>
<%@page import="kr.or.ddit.freeboard.service.IFreeBoardService"%>
<%@page import="java.lang.reflect.InvocationTargetException"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="kr.or.ddit.vo.FreeBoardVO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// request.setCharacterEncoding("UTF-8");	

	FreeBoardVO freeboardInfo = new FreeBoardVO();
	
	BeanUtils.populate(freeboardInfo, request.getParameterMap());
	
	
	IFreeBoardService service = IFreeBoardServiceImpl.getInstance();
	service.insertFreeboardReply(freeboardInfo); // wrapper.getFileItemValues("files") : 파일아이템 배열로 반환;
%>
<c:redirect url="/13/main.jsp"></c:redirect>