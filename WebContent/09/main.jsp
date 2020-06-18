<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// http://localhost/ddit/09/main.jsp(default : 전체 회원 리스트 출력)
	// http://localhost/ddit/09/main.jsp?contentPage=/09/memberForm.jsp
	// http://localhost/ddit/09/main.jsp?contentPage=/09/memberView.jsp
	// http://localhost/ddit/09/main.jsp?contentPage=/09/memberList.jsp
	
	// 1. loginForm.jsp 활용
	// 2. 로그인 후 main.jsp 요청 시작
	// 3. memberList.jsp
	//           [검색] | [글쓰기] 미구현
	// 4. loginForm.jsp에서 '회원가입을 원하세요? 클릭 시 main.jsp 내 컨텐츠 영역에
	//    memberForm.jsp 출력
	// 5. memberForm.jsp 컨텐츠의 [가입하기] | [목록] 버튼 처리
	//    [가입하기] 클릭 /ddit/09/insertMemberInfo.jsp 요청 처리
	//    가입 처리 후 loginForm.jsp로 리다이렉트 처리
	// 6. memberList.jsp 에서 특정 회원정보 클릭 후 main.jsp 내 컨텐츠 영역에 memberView.jsp 출력
	//    [수정하기] | [삭제(탈퇴)] | [목록] 버튼 처리
	String mem_id = request.getParameter("mem_id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.indigo-pink.min.css">
<script
	src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style type="text/css">
.mdl-layout__container {
	width: 240px;
}
</style>
</head>
<body>
<center>
	<div id="wrap">
		<div id="header">
			<c:import url="/09/layout/header.jsp"></c:import>
		<!-- 
			UI 레이아웃 구성을 위해 활용되는 JSP 액션태그
				include 액션태그 : UI 레이아웃 구성을 위해 활용.
								page 속성에 선언된 해당 JSP로 포워드 처리 후 
								해당 JSP가 응답 객체의 출력 버퍼에 저장한 응답 컨텐츠를 include 액션 태그가 선언된
								코드라인에 추가. 
		 -->
		</div>
		<p style="clear: both;"></p>
		<div>
			<div class="left">
				<c:import url="/09/layout/left.jsp">
					<c:param name="mem_id" value="${sessionScope.mem_id }"></c:param>
				</c:import>
			</div>
			<div id="content" style="height: 600px; margin-left: 250px; overflow: scroll;">
				<c:import url="${!empty param.contentPage ? param.contentPage : '/09/memberList.jsp' }"></c:import>
			</div>
		</div>
		<div>
			<c:import url="/09/layout/footer.jsp"></c:import>
		</div>
	</div>
</center>
</body>
</html>









