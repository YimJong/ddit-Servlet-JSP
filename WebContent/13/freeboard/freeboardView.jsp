<%@page import="kr.or.ddit.vo.FreeBoardVO"%>
<%@page import="kr.or.ddit.freeboard.service.IFreeBoardServiceImpl"%>
<%@page import="kr.or.ddit.freeboard.service.IFreeBoardService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String bo_no = request.getParameter("bo_no");
	Map<String, String> params = new HashMap<String, String>();
	params.put("bo_no", bo_no);
	
	IFreeBoardService service = IFreeBoardServiceImpl.getInstance();
	FreeBoardVO freeboardInfo = service.freeboardInfo(params);
%>
<c:set var="freeboardInfo" value="<%=freeboardInfo %>"></c:set>
<c:url var="freboardFormURI" value="/13/main.jsp">
	<c:param name="contentPage" value="/13/freeboard/freeboardForm.jsp"></c:param>
</c:url>
<c:url var="deleteFreeboardURI" value="/13/freeboard/deleteFreeboard.jsp"></c:url>
<c:url var="mainURI" value="/13/main.jsp"></c:url>
<c:url var="updateFreeboardURI" value="/13/freeboard/updateFreeboardInfo.jsp"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 정보</title>
<!-- 이미지 슬라이드 사이즈 조정 -->
<style type="text/css">
.carousel{
	width:200px;
    height:150px;
    margin-left: 200px;
}
.carousel-inner > .item > img{
    width:200px;
    height:150px;
}       
</style>
<script>
$(function(){
	// 섬머노트를 div를 활용한 textarea에 추가.
	// http://summernote.org 활용
    $('#bo_content').summernote({
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    
    // Document 초기값 설정
    $('#bo_title').val('${freeboardInfo.bo_title}');
    $('#bo_nickname').val('${freeboardInfo.bo_nickname}');
    $('#bo_pwd').val('${freeboardInfo.bo_pwd}');
    $('#bo_mail').val('${freeboardInfo.bo_mail}');
    $('#bo_content').summernote('code', '${freeboardInfo.bo_content}');
    
    // 글쓰기
    $('#btn1').on('click', function() {
    	// /ddit/13/main/jsp?contentPage=/13/freeboard/freeboardForm.jsp
    	$(location).attr('href', '${freeboardFormURI}');
    });
    // 삭제
    $('#btn2').on('click', function() {
    	let flag = true;
    	if(eval('$(!empty LOGIN_MEMBERINFO)')) {
    		if('${LOGIN_MEMBERINFO.mem_id}' == '${freeboardInfo.bo_writer}') {
    			// /ddit/13/freeboard/deleteFreeboardInfo.jsp?bo_no=1
    	    	$(location).attr('href', '${deleteFreeboardURI}?bo_no=${freeboardInfo.bo_no}');
    		}else {
    			flag = false;		
    		}
    	} else {
    		flag = false;
    	}
    	if(!flag) {
    		BootstrapDialog.show({
    		    title: '알림',
    		    message: '작성자만 게시글 삭제가 가능합니다.'
    		});
    	}
    });
    // 목록
    $('#btn4').on('click', function() {
    	$(location).attr('href', '${mainURI}');
    });
    
    
    $('form[name=freeboardViewForm]').submit(function() {
    	if(!$('#bo_title').val().validationTITLE()) {
			return alertPrint('제목을 30자 이하로 바르게 입력해주세요.');
		}
		
		if(!$('#bo_nickname').val().validationNICKNAME()) {
			return  alertPrint('넥네임을 2자리 이상 5자리 이하로 바르게 입력해주세요.');
		}
		
		if(!$('#bo_pwd').val().validationPWD()) {
			return alertPrint('패스워드를 바르게 입력해주세요.');
		}
		
		if(!$('#bo_mail').val().validationMAIL()) {
			return alertPrint('이메일 주소를 바르게 입력해주세요.');
		}
		
		let bo_content = $('#bo_content').summernote('code');
		$(this).append('<input type="hidden" name="bo_content" value="' + bo_content + '" />');
		$(this).append('<input type="hidden" name="bo_no" value="${freeboardInfo.bo_no}" />');
		
		$(this).append('<input type="hidden" name="bo_ip" value="${pageContext.request.remoteAddr}" />');
		$(this).attr('action', '${updateFreeboardURI}');
		
		return true;	
    });
    
});
</script>
</head>
<body>
<form name="freeboardViewForm" class="form-horizontal" role="form" action="" method="post">
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="bo_title" name="bo_title" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_nickname">작성자 대화명:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="bo_nickname" name="bo_nickname" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_pwd">패스워드:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="bo_pwd" name="bo_pwd" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_mail">메일:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="bo_mail" name="bo_mail" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_content">내용:</label>
		<div class="col-sm-10"> 
			<div id="bo_content"></div>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_content">첨부파일:</label>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>
	
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox" style="height: 200px;">
				<div class="item active">
					<img src="./images/thumbs/arch-1.jpg" alt="pic1">
				</div>
		
				<div class="item">
					<img src="./images/thumbs/arch-2.jpg" alt="pic2">
				</div>
		
				<div class="item">
					<img src="./images/thumbs/autumn-1.jpg" alt="pic3">
				</div>
		
				<div class="item">
					<img src="./images/thumbs/boats-1.jpg" alt="pic4">
				</div>
			</div>
			<!-- Left and right controls -->
			<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
			<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
		</div>
	</div>
	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">
			<button type="button" class="btn btn-success" id="btn1">글쓰기</button>
			<button type="button" class="btn btn-danger" id="btn2">삭제</button>
			<button type="button" class="btn btn-primary" id="btn3">댓글</button>
			<button type="button" class="btn btn-info" id="btn4">목록</button>
			<button type="submit" class="btn btn-default" style="float: right" id="btn5">수정</button>
		</div>
	</div>
</form>
</body>
</html>