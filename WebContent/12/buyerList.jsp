<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String search_keyword = request.getParameter("search_keyword");
	String search_keycode = request.getParameter("search_keycode");

	Map<String, String> params = new HashMap<String, String>();
	params.put("search_keycode", search_keycode);
	params.put("search_keyword", search_keyword);
	
	IBuyerService service = IBuyerServiceImpl.getInstance();
	List<Map<String, String>> buyerList = service.buyerList(params);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'> </script>
<script>
	$(function () {
		if(eval('${!empty param.message}')) {
			alert('${param.message}');
		}
		if(eval('${!empty param.message1}')) {
			alert('${param.message1}');
		}
		
		$('#registBtn').on('click', function() {
			location.href = '${pageContext.request.contextPath}/12/main.jsp?contextPage=/12/buyerForm.jsp';	
		});
		
		
		$('table tr:gt(0)').on('click', function() {
			const buyer_id = $(this).find('td:eq(0)').text();
			location.href = '${pageContext.request.contextPath}/12/main.jsp?contextPage=/12/buyerView.jsp&buyer_id=' + buyer_id;
		});
	});
	
	
</script>
</head>

<body>
<div id="list">
	<table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp" style="width: 100%;">
		<thead>
			<tr>
				<th class="mdl-data-table__cell--non-numeric">거래처코드</th>
				<th class="mdl-data-table__cell--non-numeric">거래처명</th>
				<th class="mdl-data-table__cell--non-numeric">상품분류명</th>
				<th class="mdl-data-table__cell--non-numeric">담당자명</th>
				<th class="mdl-data-table__cell--non-numeric">전화번호</th>
				<th class="mdl-data-table__cell--non-numeric">메일</th>
			</tr>
		<tbody>
		<c:set var="buyerList" value="<%=buyerList%>"></c:set>
		<c:forEach items="${buyerList }" var="buyer">
			<tr>
				<td class="mdl-data-table__cell--non-numeric">${buyer['BUYER_ID']}</td>
				<td class="mdl-data-table__cell--non-numeric">${buyer['BUYER_NAME']}</td>
				<td class="mdl-data-table__cell--non-numeric">${buyer['LPROD_NM']}</td>
				<td class="mdl-data-table__cell--non-numeric">${buyer['BUYER_CHARGER']}</td>
				<td class="mdl-data-table__cell--non-numeric">${buyer['BUYER_COMTEL']}</td>
				<td class="mdl-data-table__cell--non-numeric">${buyer['BUYER_MAIL']}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
<div class="searchForm" align="right" style="margin-top: 10px;">
	<form method="post" action="${pageContext.request.contextPath }/12/main.jsp">
		<select name="search_keycode">
			<option value="ALL">전체</option>
			<option value="BUYERID">거래처코드</option>
			<option value="BUYERNAME">거래처명</option>
			<option value="BUYERCHARGER">담당자명</option>
		</select>
		<input type="text" id="search_keyword" name="search_keyword">
		<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" type="submit">검색</button>
		<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" type="button" id="registBtn">거래처등록</button>
	</form>
</div>
</body>
</html>








