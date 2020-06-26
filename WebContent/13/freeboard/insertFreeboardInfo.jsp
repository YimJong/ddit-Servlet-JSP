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
	// 클라이언트의 form 태그 submit시 쿼리스트링 전송방식 POST일 때 한글 처리
	// request.setCharacterEncoding("UTF-8"); 
	FileUploadRequestWrapper wrapper = (FileUploadRequestWrapper) request; // 한글처리 다 끝내서 저장하므로 utf-8 셋 캐릭터 필요 없음
																		   // new를 filter에서 함.
	
	FreeBoardVO freeboardInfo = new FreeBoardVO();
	
	try {
		BeanUtils.populate(freeboardInfo, wrapper.getParameterMap());
	} catch (IllegalAccessException e){
		e.printStackTrace();
	} catch (InvocationTargetException e){
		e.printStackTrace();
	}
	
	IFreeBoardService service = IFreeBoardServiceImpl.getInstance();
	service.insertFreeboard(freeboardInfo, wrapper.getFileItemValues("files")); // wrapper.getFileItemValues("files") : 파일아이템 배열로 반환
%>
<c:redirect url="/13/main.jsp"></c:redirect>