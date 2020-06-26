<%@page import="kr.or.ddit.utils.FileDownloadView"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.vo.FileItemVO"%>
<%@page import="kr.or.ddit.fileitem.service.IFileItemServiceImpl"%>
<%@page import="kr.or.ddit.fileitem.service.IFileItemService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String file_seq = request.getParameter("file_seq");
	
	Map<String, String> params = new HashMap<String, String>();
	params.put("file_seq", file_seq);

	IFileItemService service = IFileItemServiceImpl.getInstance();
	FileItemVO fileitemInfo = service.fileitemInfo(params);
	
	out.clear();
	out = pageContext.pushBody();
	
	FileDownloadView.fileDownload(pageContext, 
								  fileitemInfo.getFile_name(), 
								  fileitemInfo.getFile_save_name());
	
	
		
%>