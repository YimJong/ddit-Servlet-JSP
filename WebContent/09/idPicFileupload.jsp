<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.global.GlobalConstant"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="kr.or.ddit.utils.FileUploadRequestWrapper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	FileUploadRequestWrapper wrapper = new FileUploadRequestWrapper(request);

	FileItem[] items = wrapper.getFileItemValues("idPic");
	
	// 증명사진의 정보를 데이터베이스 대상 저장 처리 생략...
	Map<String, String> jsonMap = new HashMap<String, String>();
 	for(FileItem item : items) {
		File saveFile = new File(GlobalConstant.FILE_PATH, item.getName());  // File(폳더명(경로), 파일 이름) = 0 size 짜리 껍떼기 파일
				
		jsonMap.put("fileName", item.getName());				
				
		item.write(saveFile); // 껍데기에 파일 쓰기
	}
 	
 	ObjectMapper mapper = new ObjectMapper();
 	String jsonData = mapper.writeValueAsString(jsonMap);
 	
 	out.println(jsonData);
%>