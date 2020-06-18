<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Map<String, String> params = new HashMap<String, String>();
	params.put("mem_id", "a001");
	
	IMemberService service = IMemberServiceImpl.getInstance();
	MemberVO memberInfo = service.memberInfo(params);
	
	// 저장영역(Scope)을 포함하는 기본객체 : request, pageContext, session, application
	//						값 저장 : setAttribute(키, 값); 값은 Object 타입으로 업캐스팅
	// 						값 취득 : getAttribute(키); 값은 특정 타입으로 다운캐스팅 후 활용
	//					        값 삭제 : removeAttribute(키);
	//						값 갱신 : setAttribute(기존의 동일키, 상이 값);
	
	pageContext.setAttribute("memberInfo", memberInfo);
	request.setAttribute("memberInfo", memberInfo);
	session.setAttribute("memberInfo", memberInfo);
	application.setAttribute("memberInfo", memberInfo);
	
	String[] hets = {"10대 - 철이 없다.", "20대 - 답이 없다.", "30대 - 집이 없다.", "40대 - 돈이 없다.", "50대 - 일이 없다.", "60대 - 낙이 없다.",
			"70대 - 이가 없다.", "80대 - 아직 숨위고 있는거야라는 소리를 듣는다.", "90대 - 다 필요없다. 하루만 더 살게 해주세요."};
	request.setAttribute("hets", hets);

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>사칙연산</h3>
<table>
	<tr>
		<td>표현언어</td>
		<td>결과값</td>
	</tr>
	<tr>
		<td><%=3 + 2%></td>
		<td>${ 3 + 2 }</td>
	</tr>
	<tr>
		<td>\${ 3 - 2 }</td>
		<td>${ 3 - 2 }</td>
	</tr>
	<tr>
		<td>\${ 3 * 2 }</td>
		<td>${ 3 * 2 }</td>
	</tr>
	<tr>
		<td>\${ 3 / 2 }</td>
		<td>${ 3 / 2 }</td>
	</tr>
	<tr>
		<td>\${ 3 div 2 }</td>
		<td>${ 3 div 2 }</td>
	</tr>
	<tr>
		<td>\${ 3 % 2 }</td>
		<td>${ 3 % 2 }</td>
	</tr>
	<tr>
		<td>\${ 3 mod 2 }</td>
		<td>${ 3 mod 2 }</td>
	</tr>
	<tr>
		<td>\${ 3 > 2 }</td>
		<td>${ 3 > 2 }</td>
	</tr>
	<tr>
		<td>\${ 3 gt 2 }</td>
		<td>${ 3 gt 2 }</td>
	</tr>
	<tr>
		<td>\${ 3 < 2 }</td>
		<td>${ 3 < 2 }</td>
	</tr>
	<tr>
		<td>\${ 3 lt 2 }</td>
		<td>${ 3 lt 2 }</td>
	</tr>
	<tr>
		<td>\${ 3 >= 2 }</td>
		<td>${ 3 >= 2 }</td>
	</tr>
	<tr>
		<td>\${ 3 ge 2 }</td>
		<td>${ 3 ge 2 }</td>
	</tr>
	<tr>
		<td>\${ 3 <= 2 }</td>
		<td>${ 3 <= 2 }</td>
	</tr>
	<tr>
		<td>\${ 3 le 2 }</td>
		<td>${ 3 le 2 }</td>
	</tr>
	<tr>
		<td>\${ 3 == 2 }</td>
		<td>${ 3 == 2 }</td>
	</tr>
	<tr>
		<td>\${ 3 != 2 }</td>
		<td>${ 3 != 2 }</td>
	</tr>
</table>



<h3>요청 헤더 정보 취득</h3>
<table>
	<tr>
		<td>표현언어</td>
		<td>결과값</td>
	</tr>
	<tr>
		<td><%=request.getHeader("Accept-Language")%></td>
		<td>${header['Accept-Language']}</td>
	</tr>
	<tr>
		<td>\${header.host}</td>
		<td>${header.host}</td>
	</tr>
	<tr>
		<td>\${header['host']}</td>
		<td>${header['host']}</td>
	</tr>
</table>


<h3>기본객체(9개) : EL 표기법 내에서 pageContext로부터 접근</h3>
<!-- 
	EL 내 메서드 선언 규칙 
	  * EL 내 접근 가능한 메서드
	   1. get 키워드 삭제 + 선두어 소문자로 변경 + 파렌스 삭제 
		   	request.getContextPath() : Argument 없음
		    request.getRemoteAddr() : Argument 없음
	   2. 메서드 원형 그대로 선언  
	      application.getRealPath("") : Argument 있음
 -->
<table>
	<tr>
		<td>표기법</td>
		<td>결과값</td>
	</tr>
	<tr>
		<td><%=request.getContextPath()%></td>
		<td>${pageContext.request.contextPath}</td>
	</tr>
	<tr>
		<td><%=request.getRemoteAddr()%></td>
		<td>${pageContext.request.remoteAddr}</td>
	</tr>
	<tr>
		<td><%=application.getRealPath("")%></td>
		<td>${pageContext.servletContext.getRealPath("")}</td>
	</tr>

</table>

<h3>web.xml 내 선언된 상수 접근</h3>
<table>
	<tr>
		<td>표기법</td>
		<td>결과값</td>
	</tr>
	<tr>
		<td><%=application.getInitParameter("oracleDriver")%></td>
		<td>${initParam.oracleDriver}</td>
	</tr>
	<tr>
		<td>\${initParam.oracleURL }</td>
		<td>${initParam.oracleURL}</td>
	</tr>
</table>	
<h3>저장 영역(Scope) 값 취득</h3>
<!-- 
	Expression과 EL(Expression Language)의 차이
		- Expression NullPointException 외 기타 Exception 유발.
		- EL은 Exception이 유발되지 않음.
		  Exception => ''
 -->
 pageContext<br>
 아이디 : <%=((MemberVO)pageContext.getAttribute("memberInfo")).getMem_id()%><br> 
 패스워드 : ${pageScope.memberInfo.mem_pass} <br>
 성명 : ${pageScope.memberInfo.mem_name} <br>
 request<br>
 아이디 : ${requestScope.memberInfo.mem_id}<br>
 주민등록번호 1: ${requestScope.memberInfo.mem_regno1} <br>
 주민등록번호 2: ${requestScope.memberInfo.mem_regno2} <br>
 생년월일 : ${requestScope.memberInfo.mem_bir}<br>
 session<br>
 집전화번호 : ${sessionScope.memberInfo.mem_hometel} <br>
 회사전화번호 : ${sessionScope.memberInfo.mem_comtel} <br>
 휴대폰번호 : ${sessionScope.memberInfo.mem_hp} <br>
 application<br>
 메일주소 : ${applicationScope.memberInfo.mem_mail}<br>
 직업 : ${applicationScope.memberInfo.mem_job}<br>
 취미 : ${applicationScope.memberInfo.mem_like}<br>
 scope 생략 <br>
 <!-- 
 	Scope 생략 접근 우선순위 : pageScope -> request -> session -> application
  -->
 주소1 : ${memberInfo.mem_add1} <br>
 주소2 : ${memberInfo.mem_add2}
 
 <h3>쿼리스트링 취득</h3>
 <!-- 
 	* 디클러레이션 또는 스크립트릿 내에서 EL 선언은 불가능.
 	* 자바스크립트 또는 HTML 내에서 활용.
 	http://localhost/ddit/11/expressionLanguage.jsp?mem_id=a001&mem_pass=asdfasdf
  -->
  <table>
  	<tr>
  		<td>표기법</td>
  		<td>결과값</td>
  	</tr>
  	<tr>
  		<td><%=request.getParameter("mem_id") %></td>
  		<td>${param.mem_id}</td>
  	</tr>
  	<tr>
  		<td>\${param.mem_pass}</td>
  		<td>${param.mem_pass}</td>
  	</tr>
  </table>
  
  <h3>쿠키값 취득</h3>
  <table>
  	<tr>
  		<td>표기법</td>
  		<td>결과값</td>
  	</tr>
  	<tr>
  		<td><%=request.getCookies()%></td>
  		<td>${cookie.JSESSIONID.value}</td>
  	</tr>
  </table>
  
  <h3>배열 인덱스 접근</h3>
  ${requestScope.hets[0]} <br>
  ${hets[1]} <br>
  <h3>삼항 연산자</h3>
  Expression : <%=(pageContext.getAttribute("memberInfo")) != null ? "널이 아님" : "널 임" %> <br>
  EL : ${ memberInfo != null ? '널 아님' : '널' } <br>
  <table>
  	<tr>
  		<td>\${memberInfo != null}</td>
  		<td>${!empty memberInfo}</td>
  	</tr>
  	<tr>
  		<td>\${memberInfo != null}</td>
  		<td>${not empty memberInfo}</td>
  	</tr>
  	<tr>
  		<td>\${memberInfo == null}</td>
  		<td>${empty memberInfo}</td>
  	</tr>
  	<tr>
  		<td>\${memberInfo == null ? '널' : '널 아님'}</td>
  		<td>${empty memberInfo ? '널' : '널 아님'}</td>
  	</tr>
  </table>
  
  
  </body>
</html>