<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'> </script>
<script type="text/javascript">
$(function() {
	$('form').submit(function() {
		let flag = true;
		$('input[type=file]').each(function(idx, inputTag) {
			if(!/\.(jpg|jpeg|png|gif)$/.test($(inputTag).val().toLowerCase())) {
				alert('이미지 파일 대상 업로드됩니다.');
				flag = false;
			}
		});
		return flag;
	});
});

</script>
</head>
<body>
<!-- 
	클라이언트의 파일 업로드 처리 : 쿼리스트링 전송방식 : 반드시 POST
					     contest type : multipart/form-data
					     <form/>
						 ajax
						 * 바이너리 스트리밍을 통한 서버 전송 처리
						   (폼필드 - mem_id, mem_pass, ..., 파일)
 -->
<form action="${pageContext.request.contextPath }/14/result2.jsp" enctype="multipart/form-data"
		method="post" >
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="mem_id"/></td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td><input type="password" name="mem_pass" /></td>
		</tr>
		<tr>
			<td>성명</td>
			<td><input type="text" name="mem_name" /></td>
		</tr>
		<tr>  <!-- 키는 동일한데 값이 다른경우 = request.getParameterValues("files")
		                               request.getParameterMap() 그러나 파일은 다른방식으로 처리 필요 -->
			<td>파일1</td>
			<td><input type="file" name="files" /></td>
		</tr>
		<tr>
			<td>파일2</td>
			<td><input type="file" name="files" /></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="전송" /></td>
		</tr>
	</table>
</form>
</body>
</html>