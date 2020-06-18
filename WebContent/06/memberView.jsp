<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String memberInfo = request.getParameter("mem_id");
	Map<String, String> params = new HashMap<String, String>();
	params.put("mem_id", memberInfo);
	IMemberService service = IMemberServiceImpl.getInstance();
	
	MemberVO memberVO = service.memberInfo(params);
	
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'> </script>
<script type='text/javascript'>
	$(function() {
		
		$('input[value=회원목록]').on('click', function() {
			$(location).attr('href', <%=request.getContextPath()%> + '/06/memberList.jsp');
		});
		
		$('input[value=탈퇴]').on('click', function() {
			$(location).attr('href', <%=request.getContextPath()%> + '/06/deleteMember.jsp?mem_id=' + '<%=memberVO.getMem_id()%>' );
		});	
		
		$('input[value=로그아웃]').on('click', function() {
			$(location).attr('href', <%=request.getContextPath()%> + '/06/logout.jsp');
		});	
		
		$('form').submit(function() {
			const mem_pass = $('input[name=mem_pass]').val();
			if(!mem_pass.validation()) {
				
			};
		})
		
	});

</script>
</head>
<body>

<form action='<%=request.getContextPath()%>/06/updateMember.jsp' method='post'>     
<input type='hidden' name='mem_id' value='<%=memberVO.getMem_id()%>'>                       
	<table>                                                               
		<tr>                                                              
			<td>아이디</td>                                                  
			<td>                                                          
				<input type='text' name='mem_id' value= '<%= memberVO.getMem_id()%>' disabled="disabled"/>                   
			</td>                                                         
		</tr>                                                             
		<tr>                                                              
			<td>패스워드</td>                                                 
			<td>                                                          
				<input type='text' name='mem_pass' value= '<%= memberVO.getMem_pass() %>'/>                      
			</td>                                                         
		</tr>                                                             
		<tr>                                                              
			<td>성명</td>                                                   
			<td><input type='text' name='mem_name' value= '<%= memberVO.getMem_name() %>' disabled="disabled"/></td>
		</tr>                                                             
		<tr>                                                              
			<td>주민등록번호</td>                                               
			<td>                                                          
				<input type='text' name='mem_regno1' value= '<%= memberVO.getMem_regno1() %>' disabled="disabled"/>        
				<input type='text' name='mem_regno2' value= '<%= memberVO.getMem_regno2() %>' disabled="disabled" />         
			</td>                                                         
		</tr>                                                             
		<tr>                                                              
			<td>생년월일</td>                                                 
			<td><input type='text' name='mem_bir' value= '<%= memberVO.getMem_bir() %>'></td> 
		</tr>                                                             
		<tr>                                                              
			<td>우편번호</td>                                                 
			<td><input type='text' name='mem_zip' value= '<%= memberVO.getMem_zip() %>'></td>
		</tr>                                                             
		<tr>                                                              
			<td>주소</td>                                                   
			<td>                                                          
				<input type='text' name='mem_add1' value= '<%= memberVO.getMem_add1() %>'>                   
				<input type='text' name='mem_add2' value= '<%= memberVO.getMem_add2() %>'>                     
			</td>                                                         
		</tr>                                                             
		<tr>                                                              
			<td>집전화번호</td>                                                
			<td><input type='text' name='mem_hometel' value= '<%= memberVO.getMem_hometel() %>'></td>              
		</tr>                                                             
		<tr>                                                              
			<td>회사전화번호</td>                                               
			<td><input type='text' name='mem_comtel' value= '<%= memberVO.getMem_comtel() %>'></td>               
		</tr>                                                             
		<tr>                                                              
			<td>휴대폰번호</td>                                                
			<td><input type='text' name='mem_hp' value= '<%= memberVO.getMem_hp() %>'></td>                    
		</tr>                                                             
		<tr>                                                              
			<td>이메일</td>                                                  
			<td><input type='text' name='mem_mail' value= '<%= memberVO.getMem_mail() %>'/></td>                
		</tr>                                                             
		<tr>                                                              
			<td>직업</td>                                                   
			<td><input type='text' name='mem_job' value= '<%= memberVO.getMem_job() %>'></td>                 
		</tr>                                                             
		<tr>                                                              
			<td>취미</td>                                                   
			<td><input type='text' name='mem_like'value= '<%= memberVO.getMem_like() %>'></td>                 
		</tr>                                                             
		<tr>                                                              
			<td colspan='2'>                                              
				<input type='submit' value='수정' />                   
				<input type='button' value='탈퇴' />                          
				<input type='reset' value='취소' />                       
				<input type='button' value='회원목록' />                                                   
				<input type='button' value='로그아웃' />                                                   
			</td>                                                         
		</tr>                                                             
	</table>                                                              
</form>                                                                  
</body>                                                                  
</html>                                                                  
