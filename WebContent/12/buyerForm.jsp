<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type='text/javascript' src='${pageContext.request.contextPath }/js/common/validation.js'> </script>
<script type='text/javascript' src='${pageContext.request.contextPath }/js/common/validation2.js'> </script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'> </script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <c:url var="buyerList" value="/12/main.jsp">
 	<c:param name="contextPage" value="/12/buyerList.jsp"></c:param>
 </c:url>
 <c:url var="checkFormURI" value="/12/checkDuplicateForm.jsp"></c:url>
<script>
	$(function() {
		
		$('#btn3').on('click', function() {
			location.href = '${buyerList}'
		});
		
		
		$.ajax({
			url : '${pageContext.request.contextPath}/12/lprodInfo.jsp',
			dataType : 'json',
			error : function(result) {
				alert('상태 : ' + result.status);
			},
			success : function(result) {
				for(let i = 0; i < result.length; i++) {
					let opt = $("<option value=" + result[i].lprod_gu + ">" + result[i].lprod_nm + "</option>");
					$('select[name=buyer_lgu]').append(opt);
				}; 
			},
		});
		
		$('input[name=buyer_id]').on('keypress', function() {
			const buyer_id = $('input[name=buyer_id]').val();
			if(!buyer_id.validationBUYER()) {
				$('#resSpan').text('형식에 맞지 않습니다.').css('color', 'red');	
			} else {
				$('#resSpan').text('');
			}
		});
		
		/* $('#search_buyer_id').on('click', function() {
			const buyer_id = $('input[name=buyer_id]').val();
			if(!buyer_id.validationREGIST()) {
				alert('아이디 형식이 올바르지 않습니다.');
				return;
			}
			

			$.ajax({
				url : '${pageContext.request.contextPath}/12/buyerIdCheck.jsp',
				data : { "buyer_id" : buyer_id},
				dataType : 'json',
				error : function(result) {
					alert('상태 : ' + result.status);
				},
				success : function(result) {
					if(result.res == 1) {
						$('#resSpan').text('이미 등록된 거래처 코드입니다.').css('color', 'red');
						$('input[name=buyer_id]').val('');
					} else if (result.res == 2) {
						$('#resSpan').text('사용 가능한 거래처 코드 입니다.').css('color', 'green');
					};
						
				},
			});
		}); */
		
		
		$('#search_buyer_id').on('click', function(){
			const url = '${checkFormURI }';
			const opt = 'width=300px, height=430px, status=no, resizable=no, scrollbars=no';
			window.open(url, '거래처코드 선택', opt);
		});
		
		$('#buyer_lgu').on('change', function() {
			$('input[name=buyer_id]').val('');
		});
		
		$('form').submit(function() {
			const comtel = $('input[name=buyer_comtel]').val();
			if(!comtel.validationCOMTEL()) {
				alert('올바른 전화번호를 입력해주세요.');
				return false;
			} 
			
			const mail = $('input[name=buyer_name]').val();
			if(!mail.validationMAIL()) {
				alert('올바른 이메일을 입력해주세요.');
				return false;
			}
			
			return true;
		});

		
	});
</script>
</head>
<style>
.fieldName {text-align: center; background-color: #f4f4f4;}
/* .tLine {background-color: #d2d2d2; height: 1px;} */
/* .btnGroup { text-align: right; } */
td {text-align: left; }
</style>


<body>
<form name="buyerForm" method="post" action="${pageContext.request.contextPath }/12/insertBuyer.jsp">
<table width="600" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td class="fieldName" width="100px" height="25">거래처코드</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_id" name="buyer_id">
				<label class="mdl-textfield__label" for="buyer_id">거래처코드  ex) P + 숫자 5자리</label>
				<button style="margin-left: 400px; width: 200px;" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" 
				id="search_buyer_id" type="button">거래처코드중복검사</button>
			</div>
			<br>
				<span id="resSpan"></span>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">거래처명</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_name" name="buyer_name">
				<label class="mdl-textfield__label" for="buyer_name">거래처명</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">상품분류코드</td>
		<td>
			<div class="mdl-selectfield">
				<!-- 해당 셀렉트에 출력될 option의 구성은 LProd 테이블의 lprod_gu와 lprod_nm으로 UI출력시 먼저 
				     구성되도록 함.
				 -->
				<select class="browser-default form-control" style="width:300px" name="buyer_lgu" id="buyer_lgu">
					<option value="" disabled selected>상품분류코드</option>
				</select>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">담당자</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_charger" name="buyer_charger">
				<label class="mdl-textfield__label" for="buyer_charger">담당자명</label>
			</div>			
		</td>
	</tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">거래은행</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_bank" name="buyer_bank">
				<label class="mdl-textfield__label" for="buyer_bank">거래처명</label>
			</div>			
		</td>
	</tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">거래처주소1</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_add1" name="buyer_add1">
				<label class="mdl-textfield__label" for="buyer_add1">거래처주소1</label>
			</div>			
		</td>
	</tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">거래처주소2</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_add2" name="buyer_add2">
				<label class="mdl-textfield__label" for="buyer_add2">거래처주소2</label>
			</div>
		</td>
	</tr>
</table>
<table width="600" border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
	<tr>
		<td class="fieldName" width="100px" height="25">전화번호</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_comtel" name="buyer_comtel">
				<label class="mdl-textfield__label" for="buyer_comtel">전화번호</label>
			</div>		
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">팩스번호</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_fax" name="buyer_fax">
				<label class="mdl-textfield__label" for="buyer_fax">팩스번호</label>
			</div>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="300px" height="25">거래처메일</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_mail" name="buyer_mail">
				<label class="mdl-textfield__label" for="buyer_mail">거래처메일</label>
			</div>
		</td>
	</tr>
	
	<tr><td colspan="2" height="20"></td></tr>
	
	<tr>
		<td class="btnGroup" colspan="2" >
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn1" type="submit">거래처등록</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn2" type="reset">취소</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn3" type="button">목록</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>








