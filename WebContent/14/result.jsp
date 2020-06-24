<%@page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 클라이언트(브라우저) 보안정책(Security Policy) :
	// 	        브라우저는 해당 하드웨어 시스템 내 파일 또는 디렉토리에 접근은 가능하지만,
	// 		신규 파일 또는 디렉토리의 생성, 파일 및 디렉토리 수정과 삭제는 불가.
	//      * IE ActiveX를 활용해서 파일 생성, 수정, 삭제가 가능.
	// 서버의 파일 업로드 처리 개발 환경
	//     1. 라이브러리
	//        http://commons.apache.org
	//		  	commons-fileuplode-1.2.2.jar
	//			commons-io-2.3.jar
	//		  WEB-INF/lib import
	
	// 서버 대상 업로드된 파일의 저장 처리 : 서버 내 특정 파일 시스템 활용
	//							파일 정보들은 DB 대상 저장
	
	String fileSavePath = application.getRealPath("/upload");
	
	int fileSizeMax = 1024 * 1024 * 100; // 100MB
	
	// 클라이언트(브라우저) 서버 대상 요청
	// 	   일반 요청
	//		직접 브라우저의 주소창에 URL 입력.
	//		location.href = '주소'
	// 		location.replace('주소')
	//      <a href='주소'>클릭</a>
	//      form 태그(enctype=application/x-www-form-urlencoded)
	//      ajax
	//   스트리밍 요청(파일)
	//      form 태그(method=post, enctype=multipart/form-data)
	//      ajax(method=post, enctype=multipart/form-data)
	boolean multipartFlag = ServletFileUpload.isMultipartContent(request); // 스트리밍 요청인지 일반 요청인지 반환해줌.
	if(multipartFlag) {
		// 서버의 업로드 된 파일 저장 처리
		//     1. 업로드된 파일의 임시 저장소 저장(서버 내 서버가 관리하는 파일 시스템, 서버의 메모리)
		//        * 임시저장소에 저장되는 파일의 확장자 : *.tmp
		//        * 임시저장소 저장 대상 파일의 사이즈 제한
		//        * 임시저장소로 활용되는 서버 내 특정 파일 패스를 지정 (tomcat이 알아서 함.)
		//     2. 업로드된 파일의 실제 저장소 저장
		//        * 실제 저장소 저장 대상 파일의 사이즈 제한
		//        * 실제 저장소로 활용 될 서버 내 특정 파일 패스 지정 가능
		//     3. 임시저장소에 저장 된 파일의 실제 저장소 저장 시 임시저장소에 저장 되었던 임시 파일 자동 삭제
		DiskFileItemFactory factory = new DiskFileItemFactory();  // 임시 저장소 설정을 할 수 있는 자원
		factory.setSizeThreshold(fileSizeMax);  // 파일 사이즈 제한
	//	factory.setRepository(new File("임시저장소로 활용 될 서버 내 파일 패스 지정"));
		
		ServletFileUpload servletFileUpload = new ServletFileUpload(factory); // 임시 저장 파일 자동 삭제를 위해 의존 연결
		// 서버 대상 업로드 된 파일 단위의 파일 사이즈 제한.
	//	servletFileUpload.setFileSizeMax(fileSizeMax);
		// 서버 대상 업로드 된 전체 파일 대상의 사이즈 제한.
		servletFileUpload.setSizeMax(fileSizeMax);
		
		// fileUploadForm.jsp(form태그 method=post, enctype=multipart/form-data)
		//	FileItem(서버 내 스트리밍을 통해 취득한 자원)
		//    폼 필드
		//          input[type=text name=mem_id]
		// 			input[type=text name=mem_pass]
		// 			input[type=text name=mem_name]
		//    파일
		//          input[type=file name=files] * 2
		List<FileItem> items = servletFileUpload.parseRequest(request);
		
		for(FileItem item : items) {
			if(item.isFormField()) {
				// 폼필드
				// input[type=text name=mem_id]
				// input[type=text name=mem_pass]
				// input[type=text name=mem_name]
				out.println("폼필드<br/>");
				out.println("폼필드 키 : " + item.getFieldName() + " | 값 : " + item.getString("UTF-8") + "<br/>");
			} else {
				out.println("파일<br/>");
				out.println("파일 키 : " + item.getFieldName() + "<br/>");
				out.println("파일 이름 : " + item.getName() + "<br/>");
				out.println("파일 컨텐츠타입: " + item.getContentType() + "<br/>");
				out.println("파일 사이즈: " + item.getSize() + "<br/>");
				
				// 브라우저별 파일명 전송 처리
				// d:\temp\a.png or a.png
				String fileName = FilenameUtils.getName(item.getName()); // 진짜 파일의 이름만 리턴
				
				// 저장 처리
				File saveFile = new File(fileSavePath, fileName);  // File(폳더명(경로), 파일 이름) = 0 size 짜리 껍떼기 파일 
				item.write(saveFile); // 껍데기에 파일 쓰기
			}
		}
	}
%>


