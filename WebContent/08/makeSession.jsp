<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//    세션의 생성과 활용
	//        1. 클라이언트(브라우저)의 서버 대상 최초 요청 시 쿠키 베이스의 
	//           세션 제너레이트 키(서버에 세션을 신규 생성해달라는 시그널)를 서버로 전송.
	//        2. 서버에 전송 된 세션 세션 제너레이트 키를 활용해서 서버 내 신규 신규 세션이 생성되고,
	//           새로 생성된 세션에는 세션ID(랜덤하지만 유니크한 값)가 할당.
	//        3. 신규 생성된 세션에 할당된 세션ID는 해당 최초 요청의 최초 클라이언트 대상
	//           최초 응답 전송 시 응답 패킷의 응답헤더에 포함되어 전송.
	//        4. 클라이언트가 취득한 서버단에 존재하는 세션의 세션ID는 해당 클라이언트 값
	//           서버 대상 기타 요청시마다 쿠키 베이스로 서버대상 전송.
	//        5. 서버는 클라이언트로부터 전송되는 기타 요청 정보에 포함된 세션ID를 활용하여
	//           해당 클라이언트에 할당된 세션을 특정 및 활용
	//        6. 활용 용도 : 상이한 요청과 응답 사이클 간의 데이터 공유
	//    프로그래밍 언어(서버 사이드 스크립트 언어)별 쿠키베이스로 전송되는 세션ID 키가 상이.
	//        JSP : JSESSIONID=값
	//        ASP : ASPSESSIONID=값
	//        PHP : PHPSESSIONID=값
	//      세션 취득 : request.getSession(); 오버로딩 되어져있음 
	// 				request.getSession(true | false);
	//                      true - 기존 생성된 세션이 존재하면 해당 세션을 반환.
	//                           - 기존 생성된 세션이 존재하지 않으면 에러없이 신규 세션을 생성하고 반환.
	//                     false - 기존 생성된 세션이 존재하면 해당 세션을 반환.
	//                           - 기존 생성된 세션이 존재하지 않으면 에러 발생.
	//   세션 유효시간(만료시간): Tomcat(웹 애플리케이션 서버, WAS, 웹 컨테이너, 서블릿 컨테이너) default 30분.
	//                    * default 세션 유효시간은 WAS별 상이.
	//          * 국지적 세션 유효시간 설정 - 특정 클라이언트에 할당된 서버 내 특정 세션을 대상으로 하는 만료시간 설정.
	//                               session.setMaxInActiveInterval(초단위 설정);
	//          * 전역적 세션 유효시간 설정 - 해당 웹 애플리케이션 활용 전체 클라이언트에 할당된 전체 세션 대상의 만료시간 설정.
	//                              web.xml 내 <session-timeout>분단위 세션 만료시간 설정<session-timeout>.
	//   세션 삭제 : 클라이언트의 최종 서버대상 요청 이후 세션 만료시간 경과 시.
	//           session.invalidate()
	session.setMaxInactiveInterval(60 * 30 * 10);
	SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY/MM/DD hh24:mm:ss");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
세션 아이디 : <%=session.getId() %><br>
세션 최초 생성 일시 : <%=dateFormat.format(new Date(session.getCreationTime())) %> <br>
클라이언트의 최종 요청 일시 : <%=dateFormat.format(new Date(session.getLastAccessedTime())) %> 
</body>
</html>