<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'> </script>
<script>
	$(function() {
		$('input[type=button]').on('click', function() {
			$.ajax({
				url : '<%=request.getContextPath()%>/09/createXML.jsp',
				dataType : 'xml',
				error : function(result) {
					alert(result.status + ' | ' + result.responseText);
				},
				success : function(result) {
					$('member', result).each(function(){
						$('#viewTable').html($('#viewTable').html() + '<br/>' +
								             $(this).attr('id') + '<br/>' +
								             $('mem_pass', this).text() + '<br/>' +
								             $('mem_regno1', this).text() + '<br/>' +
								             $('mem_regno2', this).text() + '<br/>');
					});
				},
			});
		});
	});
</script>
</head>
<body>
<input type="button" value="요청" />
<div id="viewTable"></div>
</body>
</html>