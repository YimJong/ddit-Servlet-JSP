<%@page import="kr.or.ddit.utils.RolePaginationUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String currentPage = request.getParameter("currentPage");
	if(currentPage == null) {
		currentPage = "1";
	}

	String search_keyword = request.getParameter("search_keyword");
	String search_keycode = request.getParameter("search_keycode");

	Map<String, String> params = new HashMap<String, String>();
	params.put("search_keyword", search_keyword);
	params.put("search_keycode", search_keycode);
	
	IMemberService service = IMemberServiceImpl.getInstance();
	String totalCount = service.totalCount(params);
	
	RolePaginationUtil pagination = new RolePaginationUtil(request,
														   Integer.parseInt(currentPage),
														   Integer.parseInt(totalCount));
	
	params.put("startCount", String.valueOf(pagination.getStartCount()));
	params.put("endCount", String.valueOf(pagination.getEndCount()));
	
	List<MemberVO> memberList = service.memberList(params);
%>
<c:set var="paginationMenu" value="<%=pagination.getPagingHtmls() %>"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'> </script>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/common/validation.js'> </script>
<script>
	$(function() {
		$('table tr:gt(0)').on('click', function() {
			const mem_id = $(this).find('td:eq(0)').text();
			location.href = '<%=request.getContextPath()%>/09/main.jsp?contentPage=/09/memberView.jsp&mem_id=' + mem_id
		});
	});


</script>
</head>
<body>
<div id="list">
	<table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp" style="width: 100%;">
		<thead>
			<tr>
				<th class="mdl-data-table__cell--non-numeric">아이디</th>
				<th class="mdl-data-table__cell--non-numeric">패스워드</th>
				<th class="mdl-data-table__cell--non-numeric">이름</th>
				<th class="mdl-data-table__cell--non-numeric">주민번호1</th>
				<th class="mdl-data-table__cell--non-numeric">주민번호2</th>
			</tr>
		</thead>

	<c:set var = "memberList" value="<%=memberList %>"></c:set>
	<c:forEach items="${memberList }" var="memberInfo">
		<tbody>
			<tr>
				<td class="mdl-data-table__cell--non-numeric">${memberInfo.mem_id }</td>
				<td class="mdl-data-table__cell--non-numeric">${memberInfo.mem_pass }</td>
				<td class="mdl-data-table__cell--non-numeric">${memberInfo.mem_name }</td>
				<td class="mdl-data-table__cell--non-numeric">${memberInfo.mem_regno1 }</td>
				<td class="mdl-data-table__cell--non-numeric">${memberInfo.mem_regno2 }</td>
			</tr>
	</c:forEach>

		</tbody>
	</table>
</div>
${paginationMenu }
<div class="searchForm" align="right" style="margin-top: 10px;">
	<form method="post" action="${pageContext.request.contextPath }/09/main.jsp">
		<select name="search_keycode">
			<option value="ALL">전체</option>
			<option value="MEMID">아이디</option>
			<option value="MEMNAME">성명</option>
			<option value="MEMADDR">주소(동)</option>
		</select>
		<input type="text" id="search_keyword" name="search_keyword">
		<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" type="submit">검색</button>
		<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" type="button">글쓰기</button>
	</form>
</div>
</body>
</html>








