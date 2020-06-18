<%@page import="kr.or.ddit.prod.service.IProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.service.IProdService"%>
<%@page import="kr.or.ddit.vo.LprodVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	IProdService service = IProdServiceImpl.getInstance();
	List<LprodVO> lprodList = service.selectAllLprod();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'> </script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script>
 	$(function() {
 		$('table tr:gt(0)').on('click', function() {
 			const lprod_nm = $(this).find('td:eq(0)').text();
 			
 			$.ajax({
 				url : '${pageContext.request.contextPath}/12/checkDuplicateResult.jsp',
 				data : { 'lprod_nm' : lprod_nm },
 				dataType : 'json',
 				error : function(result) {
 					alert('상태 : ' + result.status);
 				},
 				success : function(result) {
 					$(opener.document).find('input[name=buyer_id]').val(result.buyer_id);
 					$(opener.document).find('#buyer_id').closest('div').addClass('is-dirty');
 					$(opener.document).find('#buyer_lgu option:contains(' + result.lprod_nm + ')').attr('selected', 'selected');
 					$(opener.document).find('#resSpan').text('사용 가능한 거래처 코드 입니다.').css('color', 'green');
 					self.close();
 				},
 			});
 		});
 	});
</script>	
<style>
	table {
		text-align : center;
	}
</style>

</head>
<body>
<div id="container" >
    <div class="panel panel-danger col-sm-6 col-sm-offset-3" style="padding-top: 15px">
        <div class="panel-heading" >
            <h3 class="panel-title text-center" >취급 상품 분류 선택</h3>
        </div>
        <div class="panel-body">  
            <div style="overflow: auto; white-space: nowrap; overflow-X: hidden;" id="tableView">
            <table class="table table-bordered table-hover">
               <thead>
             		<tr>
              	     	<th style="text-align:center;">취급 상품 분류</th>
             		</tr>
		       </thead>
		       <tbody>
		       <c:set var="lprodInfo" value="<%=lprodList %>"></c:set>
		       <c:forEach items="${lprodInfo }" var="lprod">
		       		<tr>
		       			<td>${lprod.lprod_nm }</td>
		       		</tr>
		       </c:forEach>
		       </tbody>
			</table> 					            
            
            </div>
        </div>
    </div>
</div>
</body>
</html>