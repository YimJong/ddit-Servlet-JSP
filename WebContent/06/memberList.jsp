<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	IMemberService service = IMemberServiceImpl.getInstance();
	Map<String, String> params = new HashMap<String, String>();
	List<MemberVO> memberList = service.memberList(params);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'> </script>
<script>
	
	$(function() {
		$('table tr:gt(0)').on('click', function() {
			const mem_id = $(this).find('td:eq(0)').text();
			location.href = '${pageContext.request.contextPath}/06/memberView.jsp?mem_id=' + mem_id;
		});
	});

</script>
</head>
<body>
<table>                                                         
	<thead>                                                         
		<tr>                                                         
			<th>아이디</th>                                                         
			<th>성명</th>                                                         
			<th>주민등록번호1</th>                                                         
			<th>직업</th>                                                        
			<th>취미</th>                                                         
		</tr>                                                         
	</thead>                                                         
	<tbody>      
	<c:set var="memberList" value="<%=memberList %>"></c:set>
	<c:forEach items="${memberList }" var="memberInfo"> 
		<tr>                                                      
			<td>${memberInfo.mem_id }</td>                  
			<td>${memberInfo.mem_name }</td>                
			<td>${memberInfo.mem_regno1 }</td>              
			<td>${memberInfo.mem_job }</td>                 
			<td>${memberInfo.mem_like }</td>            
		</tr>
	</c:forEach>

	</tbody>                                                         
</table>                                                         
</body>                                                         
</html>                                                         
</body>
</html>