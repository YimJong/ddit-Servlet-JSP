<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	// request.setCharacterEncoding("UTF-8");
	
	IBuyerService service = IBuyerServiceImpl.getInstance();
	
	BuyerVO buyerInfo = new BuyerVO();
	BeanUtils.populate(buyerInfo, request.getParameterMap());
	
	int result = service.updateBuyer(buyerInfo);
%>
<c:set var="result" value='<%=result %>'></c:set>
<c:if test='${result == 1 }'>
	<c:redirect url="/12/main.jsp">
		<c:param name="contextPage" value="/12/buyerView.jsp"></c:param>
		<c:param name="buyer_id" value='<%=buyerInfo.getBuyer_id() %>'></c:param>
		<c:param name="message" value="거래처 정보가 수정되었습니다."></c:param>
	</c:redirect>
</c:if>
