<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="org.apache.coyote.http11.filters.BufferedInputFilter"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="kr.or.ddit.global.GlobalConstant"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String fileName = request.getParameter("fileName");
 
	File downloadFile = new File(GlobalConstant.FILE_PATH, fileName);
	
	if(downloadFile.exists()) {  // 다운로드 파일이 존재 할 때만
		fileName = URLEncoder.encode(fileName, "UTF-8"); // 파일명이 한글일 수 있으므로 인코딩
		
		response.setHeader("Content-Disposition", "attachment;fileName=" + fileName);
		response.setContentType("application/octet-stream"); // 다른이름으로 저장.
		response.setContentLength((int)downloadFile.length());
		
		// jsp 요청 시 해당 jsp는 servlet 클래스로 천이(자스퍼 엔진).
		// jsp는 out이 존재하고, servlet 클래스 내 printWriter 상속받은 JspWriter가 존재하며,
		// 응답 버퍼에 다른것이 저장되어 있을 수 있음.
		// out 기본객체의 outputStream 초기화 필요.(JSP 파일 내 다운로드 처리시만 선언)
		out.clear(); // 응답객체의 출력버퍼를 flush 시킬 수 있음.
		out = pageContext.pushBody(); // outputStream 초기화
		
		byte[] buffer = new byte[(int)downloadFile.length()];
		
		BufferedInputStream inputStream = new BufferedInputStream(new FileInputStream(downloadFile));
		
		BufferedOutputStream outputStream = new BufferedOutputStream(response.getOutputStream());
		
		int readCnt = 0;
		while((readCnt = inputStream.read(buffer)) != -1) {
			outputStream.write(buffer);
		}
		inputStream.close();
		outputStream.close();
	}
%>
