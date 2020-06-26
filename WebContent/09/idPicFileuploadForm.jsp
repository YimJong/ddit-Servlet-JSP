<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
td {f on t-family:"돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
}

td a {
	font-family: "돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
	text-decoration: none;
}

td a:hover {
	font-family: "돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
	text-decoration: underline;
}

#hiddenFileInput{
	position : relative;
	width : 80px; 
	height:30px; 
	overflow:hidden; 
	cursor:pointer; 
	background-image:url('${pageContext.request.contextPath}/image/bt_search.gif');
	background-repeat: no-repeat;
}
#idPic{
	width:80px; 
	height:30px; 
	filter:alpha(opacity=0); 
	opacity:0; 
	-moz-opacity:0; 
	cursor:pointer;
	vertical-align: middle;
}
.bar {
    height: 18px;
    background: green;
}

</style>
<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'> </script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/form/jquery.form.js"></script>
<script type="text/javascript">
	 
	// ajax 베이스의 form 태그를 활용한 파일 업로드 처리
	// http://malsup.com/jquery/form/#download
	
	let name = '';
	function idPicTargetFile(fileName) {
		// d:\\temp\\files\a.png or a.png
		let fileNameArray = fileName.split('\\');
		fileName = fileNameArray[fileNameArray.length - 1];
		
		if(!/\.(jpg|jpeg|png|gif)$/.test(fileName.toLowerCase())) {
			alert('이미지 파일을 선택해주세요.');
			return;
		}
		
		$('#fileName').val(fileName);
		
		$('#idPicForm').ajaxForm({
			dataType : 'json',
			error : function(result) {
				alert(result.status);
			},
			success : function(result) {
				// {'fileName' : 'a.png' }
				name = result.fileName;
				
				$('#viewTable').html('<img src="/files/' + name + '" width="200px" height="230px"/>');
			},
		});
		
		$('#idPicForm').submit();
	}
	
</script>
</head>
<body>
	<table width="354" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="30" style="text-align: center;"><font color="red" size="5">증명 사진 업로드</font></td>
		</tr>
		<tr>
			<td><img src="../image/open_table01.gif" width="354" height="10"></td>
		</tr>
		<tr>
			<td height="10" background="../image/open_table02.gif" align="center">&nbsp;</td>
		</tr>
		<tr>
			<td height="300" align="center" valign="top"
				background="../image/open_table02.gif">
				<table width="300" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="25">
							<div align="center">등록하려는 사진(gif | jpg | jpeg | png)를 선택해주세요.</div>
						</td>
					</tr>
					<tr>
						<td height="38" background="../image/open_tt.gif" align="center">
							<form id="idPicForm" action="${pageContext.request.contextPath }/09/idPicFileUpload.jsp"
									method="post" enctype="multipart/form-data" >
								<input type="text" id="fileName" name="fileName"/>
								<span id="hiddenFileInput">
	    							<input type="file" id="idPic" name="idPic" onchange="idPicTargetFile(this.value)"/>
								</span>
							</form>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
							<div style="overflow: auto; white-space: nowrap; overflow-X: hidden; height: 200px;" id="viewTable"></div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><img src="../image/open_table03.gif" width="354" height="10"></td>
		</tr>
	</table>
</body>
</html>