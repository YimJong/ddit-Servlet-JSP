<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="/error/errorCTRL.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	Java Exception : 애플리케이션 개발 및 실행 중 발생 또는 발생의 여지가 존재하며, 발생 시 정상적인 
	                                  코드의 실행 또는 정상적인 애플리케이션의 종류를 보장할 수 없으므로 반드시 대응되어야 하며,
	                                  개발자(논리적 사고의 모순), 유저(신박한 유저의 서비스 이용방법), 물리적인 리소스에 발생되는 보든 에러.
	                 1. 에러 카테고리
	                 	1.1 컴파일 에러(Compile-time Errors) : 개발 간 또는 빌드 시 컴파일러에 의해 파악되며, 발생됨
	                 	1.2 런타임 에러(Runtime Errors) : 애플리케이션 실행 간 발생되며, 애플리케이션의 비정상적인 종료
	                 	       또는 내부 리소스간의 충돌, 하드웨어 셧-다운 등을 유발.
	                 	1.3 로직 에러(Logic Errors) : 애플리케이션 실행 간 개발자의 논리적인 모순(무논리의 알고리즘)에 의해
	                 	      발생되는 에러로써 무한루프, 실행되어야하는 코드가 미실행, 예상할 수 없는 결과의 유발.
	                 2. 예외(Exception) 카테고리
	                 	2.1 Checked Exception : 컴파일 예외
	                 	2.2 UnChecked Exception : 런타임 예외
	                 	2.3 Fatal : 물리적인 리소스의 한계 또는 개발자가 예상하지 못한 유저의 서비스 이용간의 신박한 조작 등의 개발자가 
	                 	                        대응 해야 할 범주를 벗어난 예외   
					 3. 예외 처리 규칙
					 	3.1 작은범위, 구체적인 예외 선언.
					 	3.2 예외 발생 여지가 존재하는 코드에는 반드시 예외 처리.
					 	3.3 예외 발생시의 Catch는 발생 또는 발생 될 여지가 존재하는 해당 코드의 호출처에서 처리.
					 	3.4 예외 발생 시 활용되어지는 모든 리소스는 반납 처리.
					 	3.5 예외 발생 정보는 반드시 로그기록 파일단위로 저장되어 활용.
					 	3.6 예외 발생 시 유저, 해당 애플리케이션 운영단 대상으로 적절한 메세지가 제공.
					 	3.7 예외는 사용자 정의 예외를 작성해서 대응.
					 	3.8 예외도 Java Doc API화 
	
	JSP 내 익셉션 처리
		isErrorPage : default false(해당 jsp 파일 내에서 발생된 익셉션을 직접 처리 하지 않음.)
				      exception 기본객체 접근 권한 없음.
				      exception 기본객체 접근 및 기타 jsp 파일에서 발생된 에러 대응을 위해 true 선언.
		errorPage : 해당 jsp 내에서 발생된 익셉션을 처리하는 특정 jsp 파일 경로(포워드 처리)
				      
 -->
 
 <%
 	int i = 1 / 0;
 %>
</body>
</html>