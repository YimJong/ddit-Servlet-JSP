<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.indigo-pink.min.css">
<script src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
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
			<c:import url="/10/layout/header.jsp"></c:import>
		</div>
		<p style="clear: both;"></p>
		<div>
			<div class="left">
				<c:import url="/10/layout/left.jsp"></c:import>
			</div>
			<div id="content" style="height: 700px; width: 100%; overflow: auto;">
				<c:import url="${!empty param.contextPage ? param.contextPage : '/10/prodList.jsp'}"></c:import>
			</div>
		</div>
		<div>
			<c:import url="/10/layout/footer.jsp"></c:import>
		</div>
	</div>
</center>
</body>
</html>









