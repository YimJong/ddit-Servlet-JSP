<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="customtargetclass" uri="http://www.bagrant.com/taglib/customtargetclass-taglib"%>
<c:set var="targetString1" value="function 태그는 java.lang.String 클래스 내 사용이 빈번한 메서드를 태그로 활용할 수 있습니다."></c:set>
<c:set var="targetString2" value="Using"></c:set>
<c:set var="targetString3" value="201호, 202호, 203호, 204호"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
length() : ${fn:length(targetString1) } <br>
toUpperCase() : ${fn:toUpperCase(targetString1) }<br>
toLowerCase() : ${fn:toLowerCase(targetString1) }<br>
substring() : ${fn:substring(targetString1, 0, 9) }<br>
subStringBefore : ${fn:substringBefore(targetString1, '태그') }<br>
subStringAfter : ${fn:substringAfter(targetString1, '태그') }<br>
replace() : ${fn:replace(targetString1, '사용', targetString2) } <br>
replace() : ${fn:replace(targetString1, '사용', '') } <br>
indexOf() : ${fn:indexOf(targetString1, targetString2) }<br>
startsWith() : ${fn:startsWith(targetString1, 'fun') }<br>
endsWith() : ${fn:endsWith(targetString1, 'fun') }<br>
contains() : ${fn:contains(targetString1, targetString2) }<br>
split() : ${fn:split(targetString3, ', ')[0] }<br>
<c:set var="targetString4" value="<script type='text/javascript'>alert('경고창');</script>"></c:set>
escapeXml() : ${fn:escapeXml(fn:trim(targetString4)) }<br>

<h3>사용자 정의 태그 활용</h3>
plus(10, 20) : ${customtargetclass:plus(10, 20) }<br>
multiple('20', 30) : ${customtargetclass:multiple('20', 30) }<br>
today() : ${customtargetclass:today() }<br>
charCount('1234555678', '5') : ${customtargetclass:charCount('1234555678', '5') }
</body>
</html>