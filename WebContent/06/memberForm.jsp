<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'> </script>
<script type='text/javascript' src='${pageContext.request.contextPath }/js/common/validation.js'> </script>
<script>
	$(function() {
		$('form').submit(function() {
			const mem_id = $('input[name=mem_id]').val();
			if(!mem_id.validationID()){
				alert("올바른 아이디를 입력해주세요.");
				return false;
			};
			
			const mem_pass = $('input[name=mem_pass]').val();
			if(!mem_pass.validationPWD()){
				alset("올바른 비밀번호를 입력해주세요.");
				return false;
			};
			
			const mem_bir = $('input[name=mem_bir]').val();
			if(!mem_pass.validationBIR()){
				alset("올바른 생년월일을 입력해주세요.");
				return false;
			};
			
			const mem_hometel = $('input[name=mem_hometel]').val();
			if(!mem_pass.validationHOMETEL()){
				alset("올바른 집 전화번호를 입력해주세요.");
				return false;
			};
			
			const mem_comtel = $('input[name=mem_comtel]').val();
			if(!mem_pass.validationCOMTEL()){
				alset("올바른 회사전화번호를 입력해주세요.");
				return false;
			};
			
			const mem_mail = $('input[name=mem_mail]').val();
			if(!mem_pass.validationMAIL()){
				alset("올바른 이메일을 입력해주세요.");
				return false;
			};
			
			const mem_hp = $('input[name=mem_hp]').val();
			if(!mem_pass.validationHP()){
				alset("올바른 휴대폰 번호를 입력해주세요.");
				return false;
			};
			return true;
		});
	});
</script>
</head>
<body>
<form action='${pageContext.request.contextPath }/06/insertMember.jsp' method='post'>                            
	<table>                                                               
		<tr>                                                              
			<td>아이디</td>                                                  
			<td>                                                          
				<input type='text' name='mem_id' />                   
			</td>                                                         
		</tr>                                                             
		<tr>                                                              
			<td>패스워드</td>                                                 
			<td>                                                          
				<input type='text' name='mem_pass'/>                      
			</td>                                                         
		</tr>                                                             
		<tr>                                                              
			<td>성명</td>                                                   
			<td><input type='text' name='mem_name'/></td>
		</tr>                                                             
		<tr>                                                              
			<td>주민등록번호</td>                                               
			<td>                                                          
				<input type='text' name='mem_regno1'/>        
				<input type='text' name='mem_regno2'/>         
			</td>                                                         
		</tr>                                                             
		<tr>                                                              
			<td>생년월일</td>                                                 
			<td><input type='text' name='mem_bir'/></td> 
		</tr>                                                             
		<tr>                                                              
			<td>우편번호</td>                                                 
			<td><input type='text' name='mem_zip'/></td>
		</tr>                                                             
		<tr>                                                              
			<td>주소</td>                                                   
			<td>                                                          
				<input type='text' name='mem_add1' />-                    
				<input type='text' name='mem_add2' />                     
			</td>                                                         
		</tr>                                                             
		<tr>                                                              
			<td>집전화번호</td>                                                
			<td><input type='text' name='mem_hometel'/></td>              
		</tr>                                                             
		<tr>                                                              
			<td>회사전화번호</td>                                               
			<td><input type='text' name='mem_comtel'/></td>               
		</tr>                                                             
		<tr>                                                              
			<td>휴대폰번호</td>                                                
			<td><input type='text' name='mem_hp'></td>                    
		</tr>                                                             
		<tr>                                                              
			<td>이메일</td>                                                  
			<td><input type='text' name='mem_mail' /></td>                
		</tr>                                                             
		<tr>                                                              
			<td>직업</td>                                                   
			<td><input type='text' name='mem_job' /></td>                 
		</tr>                                                             
		<tr>                                                              
			<td>취미</td>                                                   
			<td><input type='text' name='mem_like'/></td>                 
		</tr>                                                             
		<tr>                                                              
			<td colspan='2'>                                              
				<input type='submit' value='회원가입' />                      
				<input type='reset' value='취소' />                         
			</td>                                                         
		</tr>                                                             
	</table>                                                              
</form>                                                                  
</body>                                                                  
</html>                                                                  
