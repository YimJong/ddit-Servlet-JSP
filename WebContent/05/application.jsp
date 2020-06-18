<%@page import="java.net.URL"%>
<%@page import="org.apache.commons.collections.Buffer"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //로그(trace->info->warn->debug->error->fatal)
   application.log("info 레벨의 이클립스 내 콘솔 방향 출력");
   application.log("실제 서버 배포 및 서비스 : info 레벨의 서버 인스톨 폴더/logs/파일 방향 출력");
   
   // 응답 객체의 출력버퍼(저장소)에 해당 문자열을 저장 처리
   out.println("oracleDriver : " + application.getInitParameter("oracleDriver")+"<br/>");
   out.println("oracleURL : " + application.getInitParameter("oracleURL")+"<br/>");
   out.println("mysqlDriver : " + application.getInitParameter("mysqlDriver")+"<br/>");
   out.println("mysqlURL : " + application.getInitParameter("mysqlURL")+"<br/>");
   
   out.println("웹 애플리케이션 배포 및 서비스 경로: "+ application.getRealPath("")+"<br/>");
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
OrcacleDriver : <%=application.getInitParameter("oracleDriver") %><br/>
OrcacleURL : <%=application.getInitParameter("oracleURL") %><br/>

<%
   String buffer = "";
   BufferedReader reader = new BufferedReader(
                           new InputStreamReader(
                                 new FileInputStream(application.getRealPath("/05/readme.txt")),"UTF-8"));
   while((buffer = reader.readLine()) != null){
%>
      <%=buffer %>
<%      
   }
   
   String temp="";
   // http://localhost/ddit/05/readme.txt
   URL url = application.getResource("/05/readme.txt");
   BufferedReader urlreader = new BufferedReader(
                           new InputStreamReader(
                                 url.openStream(),"UTF-8"));
   while((temp = urlreader.readLine()) != null){
      out.println(temp);
   }
%>
</body>
</html>