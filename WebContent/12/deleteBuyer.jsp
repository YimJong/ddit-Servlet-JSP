<%@page import="kr.or.ddit.buyer.service.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");

	String buyer_id = request.getParameter("buyer_id");
	IBuyerService service = IBuyerServiceImpl.getInstance();
	
	int result = service.deleteBuyer(buyer_id);
%>
<c:set var="result" value='<%=result %>'></c:set>
<c:if test="${result ne 0 }">
	<c:redirect url="/12/main.jsp">
		<c:param name="contextPage" value="/12/buyerList.jsp"></c:param>
		<c:param name="message1" value="거래처가 삭제되었습니다."></c:param>
	</c:redirect>
</c:if>