<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	// JSTP(Java Standard Tag Library)
	//   웹 애플리케이션의 핵심 공용 기능을 단순한 태그로 캡슐화한 웹 애플리케이션 프로그래밍 개발환경
	//   1. http://search.maven.org
	//      jstl-1.2.jar
	//      jstl-api-1.2.2.jar
	//   2. WEB-INF/lib import
	//   3. jsp 파일 내 태그 라이브러리 디텍티브 선언(jsp 파일 개별선언)
	
	IMemberService service = IMemberServiceImpl.getInstance();
	Map<String, String> param = new HashMap<String, String>();
	List<MemberVO> memberList = service.memberList(param);
	
	pageContext.setAttribute("memberList", memberList);
	
	String het = "업무 진입과 숙련과정 : 1. 자신의 업무를 파악 및 업무 준비, 2. 업무 숙련도 향상, 3. 자신의 업무와 연계된 동료들의 업무 파악, 4. 비효율적인 업무 환경을 효율화하는데 기여";
	
	String[] hosils = {
			"201호", "202호", "203호", "204호"  
	};
	request.setAttribute("hosils", hosils);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>forEach</h3>
<!-- 
	for(int i = 0; i <= 10; i++) { }
	
	forEach : begin - 반복문의 초기값
			  end   - 반복문의 최종값
			  var   - pageContext.setAttribute("i", 증가값);
			  		  ${i}
			  varStatus - 반복문의 상태정보
			  		      pageContext.setAttribute("stat", 상태정보)
			  		      ${stat.first} = 최초 반복문 실행 시 true 반환
			  		      ${stat.last} = 최종 반복문 실행 시 true 반환
			  		      ${stat.count} = 반복횟수
			  step - 증가치		      
 -->		  
	<c:forEach begin="0" end="10" var="i" varStatus="stat" step="3">
		<c:if test="${stat.first }">
			최초반복<br>
		</c:if>
		${i} : ${stat.count} <br>
		<c:if test="${stat.last }">
			최종반복<br>
		</c:if>
	</c:forEach>
	<table>
		<c:forEach items="${memberList}" var="memberInfo">
		<tr>
			<td>${memberInfo.mem_id }</td>
			<td>${memberInfo.mem_name }</td>
			<td>${memberInfo.mem_regno1 }</td>
			<td>${memberInfo.mem_regno2 }</td>
			<td>${memberInfo.mem_add1 }</td>
		</tr>
		</c:forEach>
	</table>
	<c:forEach items="${cookie}" var="currentCookie">
		${currentCookie.key} : ${currentCookie.value.value} <br>
	</c:forEach>
	
<h3>저장영역(Scope) 값 저장 : pageContext, request, session, application</h3>

<!-- 
	pageContext.setAttribute("jumsu", "83");
	
	scope : page(default) 생략 시 dafault pageScope.
		    request
		    session
		    application
 -->
<c:set var="jumsu" value="83" scope="request"> </c:set>
${jumsu } <br>
<c:out value="${jumsu }" default="value 속성값이 zero lang, String 또는 null일때 대체 출력 값"></c:out>
<c:if test="${jumsu >= 90 }">수 <br></c:if>
<c:if test="${jumsu < 90 && jumsu >= 80}">우<br></c:if>
<c:if test="${jumsu < 80 and jumsu >= 70}">미<br></c:if>
<c:if test="${jumsu < 70}">분발합시다.</c:if>
<c:if test="${not empty jumsu}" var="result" scope="page">
	if문의 결과값
</c:if>
<c:if test="${!empty jumsu}">
	if문의 결과값2
</c:if>
<c:if test="${empty jumsu}">
	if문의 결과값3
</c:if>

if문의 조건식 값 : ${result}<br>

<h3>switch ~ case문</h3>
<c:choose>
	<c:when test="${jumsu >= 90}">수</c:when>
	<c:when test="${jumsu < 90 and jumsu >= 80}">우</c:when>
	<c:when test="${jumsu < 80 and jumsu >= 70}">미</c:when>
	<c:otherwise>
		분발합시다.
	</c:otherwise>
</c:choose>

 <h3>특정 저장영역(Scope) 값 삭제</h3>
<!-- 
	request.removeAttribute("jumsu");
 -->
 <c:remove var="jumsu" scope="request"/>
 <h3>jsp:include 액션 태그 대체. 컨텍스트 루트|패스 생략한 서블릿 패스를 설정</h3>
 <c:import url="/01/gugudanResult.jsp" var="gugudanResult">
 	<c:param name="dan" value="5"></c:param>
 </c:import>
 
 ${gugudanResult} <br>
 <h3>URL 표현</h3>
 <!-- 
 	컨텍스트 루트|패스 배제된 서블릿 패스만 설정
  -->
 <c:url var="gugudanURI" value="/01/gugudanResult.jsp">
 	<c:param name="dan" value="9"></c:param>
 </c:url>
 <a href="${gugudanURI}">클릭하면 넘어가요!</a>
 
 <h3>Exception 처리</h3>
 <c:catch var="exceptionMSG">
 <%
 	int i = 1 / 0;
 %>
 </c:catch>
 ${exceptionMSG}<br>
 <h3>반복문과 split 병행</h3>
 <c:set var="het" value="<%=het%>"></c:set>
 <c:forTokens items="${het }" delims=", " var="val">
 	${val }<br>
 </c:forTokens>
 <%
 	Map<String, String> params = new HashMap<String, String>();
 	params.put("mem_id", "a001");
 	params.put("mem_pass", "asdfasdf");
 %>
 
 <c:set var="params" value="<%=params %>"></c:set>
 아이디 : ${params['mem_id'] } <br>
 패스워드: ${params['mem_pass'] } <br>
 
 <h3>리다이렉트</h3>
 <!-- 
 	response.sendRedirect("/ddit/01/gugudan.jsp");
 
 	컨텍스트 루트|패스를 배제한 서블릿 패스만 선언	
  -->
  <c:redirect url="/01/gugudan.jsp"></c:redirect>
  
</body>
</html>