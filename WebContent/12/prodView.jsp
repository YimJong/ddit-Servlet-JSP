<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@page import="kr.or.ddit.prod.service.IProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.service.IProdService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String prod_name = request.getParameter("prod_name");
	String message = request.getParameter("message");
	
	IProdService service = IProdServiceImpl.getInstance();
	ProdVO prodInfo = service.getProdInfo(prod_name);
	
	String lprod_gu = service.searchLprodGu(prodInfo.getProd_lgu());
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.fieldName {text-align: center; background-color: #f4f4f4;}
.tLine {background-color: #d2d2d2; height: 1px;}
.btnGroup { text-align: right; }
td {text-align: left; }
</style>
<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'> </script>
<script>
	$(function() {
		
		if('<%=message%>' != 'null') {
			alert('삭제 실패');
		}
		
		
		$('#btn3').on('click', function() {
			location.href = "<%= request.getContextPath()%>/10/main.jsp";	
		});
		
		$('#btn4').on('click', function() {
			const prod_id = $('input[name=prod_id]').val();
			const prod_name = $('input[name=prod_name]').val();
			location.href = "<%= request.getContextPath()%>/10/deleteProd.jsp?prod_id=" + prod_id + "&prod_name=" + prod_name;
		});
	});


</script>
<body>
<form name="buyerForm" method="post" action="<%=request.getContextPath()%>/10/updateProd.jsp">
<table width="600" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td class="fieldName" width="100px" height="25">상품코드</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_id1" name="prod_id1" 
						value="<%=prodInfo.getProd_id() %>"	disabled="disabled">
				<input type="hidden" id="prod_id" name="prod_id" value="<%=prodInfo.getProd_id() %>">
				<label class="mdl-textfield__label" for="prod_id">상품코드</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">상품명</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_name" name="prod_name" 
					value="<%=prodInfo.getProd_name() %>"  disabled="disabled">
				<input type="hidden" id="prod_name" name="prod_name" value="<%=prodInfo.getProd_name() %>">
				<label class="mdl-textfield__label" for="prod_name">상품명</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">상품분류명</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_lgu" name="prod_lgu" 
					value="<%=lprod_gu %>" disabled="disabled">
				<label class="mdl-textfield__label" for="prod_lgu">상품분류명</label>
			</div>			
		</td>
	</tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">거래처코드</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_buyer" name="prod_buyer" 
					value="<%=prodInfo.getProd_buyer() %>"  disabled="disabled">
				<input type="hidden" id="prod_buyer" name="prod_buyer" value="<%=prodInfo.getProd_buyer() %>">
				<label class="mdl-textfield__label" for="prod_buyer">거래처코드</label>
			</div>			
		</td>
	</tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">매입가</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_cost" name="prod_cost" 
							value="<%=prodInfo.getProd_cost() %>">
				<label class="mdl-textfield__label" for="prod_cost">매입가</label>
			</div>			
		</td>
	</tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">소비자가</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_price" name="prod_price"
							value="<%=prodInfo.getProd_price() %>">
				<label class="mdl-textfield__label" for="prod_price">소비자가</label>
			</div>
		</td>
	</tr>
</table>
<table width="600" border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
	<tr>
		<td class="fieldName" width="100px" height="25">판매가</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_sale" name="prod_sale"
							value="<%=prodInfo.getProd_sale() %>">
				<label class="mdl-textfield__label" for="prod_sale">판매가</label>
			</div>		
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">상품설명</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_outline" name="prod_outline"
							value="<%=prodInfo.getProd_outline() %>">
				<label class="mdl-textfield__label" for="prod_outline">상품설명</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="300px" height="25">상품상세설명</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_detail" name="prod_detail"
							value="<%=prodInfo.getProd_detail() %>">
				<label class="mdl-textfield__label" for="prod_detail">상품상세설명</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="300px" height="25">총입고수량</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_qtyin" name="prod_qtyin"
							value="<%=prodInfo.getProd_qtyin() %>">
				<label class="mdl-textfield__label" for="prod_qtyin">총입고수량</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="300px" height="25">재고수량</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_totalstock" name="prod_totalstock"
							value="<%=prodInfo.getProd_totalstock() %>">
				<label class="mdl-textfield__label" for="prod_totalstock">재고수량</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="300px" height="25">안전재고수량</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_properstock" name="prod_properstock"
							value="<%=prodInfo.getProd_properstock() %>">
				<label class="mdl-textfield__label" for="prod_properstock">안전재고수량</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="300px" height="25">입고일자</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_insdate" name="prod_insdate"
							value="<%=prodInfo.getProd_insdate().substring(0,11) %>">
				<label class="mdl-textfield__label" for="prod_insdate">입고일자</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="btnGroup" colspan="2" >
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn1" type="submit">상품정보수정</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn2" type="reset">취소</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn3" type="button">목록</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn4" type="button">상품정보삭제</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>








