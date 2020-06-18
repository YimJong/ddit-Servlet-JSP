<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'> </script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
 <script>
 	$(function() {
 		$('button').on('click', function() {
 			$.ajax({
 	 			url : '<%=request.getContextPath()%>/10/searchBuyerResult.jsp',
 	 			dataType : 'json',
 	 			data : { "buyer_name" : $('input[name=buyer_name]').val() },
 	 			error : function(result) {
 	 				alert('error code : ' + result.status +
 	 					   	' | message : ' + result.responseTest);
 	 			},
 	 			success : function(result) {
 	 				let htmls = '<table class="table table-bordered table-hover">' +
 			 	              	  '<thead>' +
 				               		 '<tr>' +
 				                     	 '<th>거래처 아이디</th>' +
 				                    	 '<th>거래처 이름</th>' +
 				                         '<th>분류번호</th>' +
 				                	     '<th>전화번호</th>' +
 				               		 '</tr>' +
 					           	 '</thead>' +
 					            '<tbody>';
 	 				for(var i = 0; i < result.length; i++) {
 	 					htmls += '<tr>' +
	 	 							 '<td>' + result[i].buyer_id + '</td>' +
	 	 						     '<td>' + result[i].buyer_name + '</td>' +
	 	 						     '<td>' + result[i].buyer_lgu + '</td>' +
	 	 						     '<td>' + result[i].buyer_comtel + '</td>' +
 	 						     '</tr>';
 	 				};
 	 				htmls += '</tbody></table>';
 	 				
 	 				$('#tableView').empty().html(htmls);
 	 				
 	 				$('table tr:gt(0)').on('click', function() {
 	 					const buyer_id = $(this).find('td:eq(0)').text();
 	 					
 	 					$(opener.document).find('input[name=prod_buyer]').val(buyer_id);
 	 					$(opener.document).find('input[name=prod_buyer]').focus();
 	 					self.close();
 	 				});
 	 			},
 	 		});
 		});
 	});
 
 </script>	
</head>
<body>
<div id="container" >
    <div class="panel panel-primary col-sm-6 col-sm-offset-3" style="padding-top: 15px">
        <div class="panel-heading" >
            <h3 class="panel-title text-center" >거래처 검색</h3>
        </div>
        <div class="panel-body">
            <form>
                <input type="text" name="buyer_name" class="form-control" style="margin-bottom: 5px;" placeholder="거래처 이름">
                <button type="button" class="btn btn-primary btn-block" style="margin-bottom: 10px">검색</button>
            </form>
            <div style="overflow: auto; white-space: nowrap; overflow-X: hidden;" id="tableView">
            </div>
        </div>
    </div>
</div>

</body>
</html>