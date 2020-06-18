<%@page import="java.net.URLEncoder"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	BuyerVO buyerInfo = new BuyerVO();
	
	BeanUtils.populate(buyerInfo, request.getParameterMap());
	
	IBuyerService service = IBuyerServiceImpl.getInstance();
	
	BuyerVO result = new BuyerVO();
	result = service.insertBuyer(buyerInfo);
	
	String message = URLEncoder.encode("상품이 등록되었습니다.", "UTF-8");
%>

<c:redirect url="/12/main.jsp" >
	<c:param name="contextPage" value="/12/buyerList.jsp"></c:param>
	<c:param name="message" value="상품이 등록되었습니다." ></c:param>
</c:redirect>
