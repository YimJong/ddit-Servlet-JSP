<%@page import="kr.or.ddit.utils.RolePaginationUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.vo.FreeBoardVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.freeboard.service.IFreeBoardServiceImpl"%>
<%@page import="kr.or.ddit.freeboard.service.IFreeBoardService"%>
<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String currentPage = request.getParameter("currentPage");
	if(currentPage == null) {
		currentPage = "1";
	}

	// freeboardList.jsp
	//     리다이렉트 요청  => (request[search_keycode|search_keyword], response)main.jsp
	//					     c:import 포워드 freeboradList.jsp
	// 포워드 하기 때문에 freeboardList.jsp에서 꺼내서 쓸 수 있음.
 	String search_keyword = request.getParameter("search_keyword");	
	String search_keycode = request.getParameter("search_keycode");	
	
	Map<String, String> params = new HashMap<String, String>();
	params.put("search_keyword", search_keyword);
	params.put("search_keycode", search_keycode);
	
	IFreeBoardService service = IFreeBoardServiceImpl.getInstance();
	
	String totalCount = service.totalCount(params); // 검색된 게시글의 갯수 취득
	// 매개변수 전달 시 전체 페이지 갯수, 페이지네이션 시작,끝 메뉴의 숫자, 페이지에 표시할 게시글의 시작, 끝 번호 셋팅.
	// getter로 화면에 표시할 게시글의 시작, 끝 번호와 메뉴를 만들 태그 String을 가져올 수 있음.
	RolePaginationUtil pagination = new RolePaginationUtil(request, // 요청, 현재 페이지, 전체 페이지 매개변수로 전달. 
														   Integer.parseInt(currentPage), 
														   Integer.parseInt(totalCount));
	
	params.put("startCount", String.valueOf(pagination.getStartCount())); // iBatis에 전달 할 Map에 시작 게시글 번호 셋팅
	params.put("endCount", String.valueOf(pagination.getEndCount())); // iBatis에 전달 할 Map에 끝 게시글 번호 셋팅
	
	List<FreeBoardVO> freeboardList = service.freeboardList(params);
%>
<c:set var="freeboardList" value="<%=freeboardList %>"></c:set>
<c:set var="paginationMenu" value="<%=pagination.getPagingHtmls() %>"></c:set>   <!-- 페이지네이션 메뉴 태그 가져오기 -->
<c:url var="freeboardFormURI" value="/13/main.jsp">
	<c:param name="contentPage" value="/13/freeboard/freeboardForm.jsp"></c:param>
</c:url>
<c:url var="freeboardViewURI" value="/13/main.jsp">
	<c:param name="contentPage" value="/13/freeboard/freeboardView.jsp"></c:param>
</c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 목록</title>
<script type="text/javascript">
	$(function() {
		$('#freeboardRegistBtn').on('click', function() {
			if(eval('${!empty LOGIN_MEMBERINFO}')) {
				$(location).attr('href', '${freeboardFormURI}');
			} else {
				BootstrapDialog.show({
				    title: '알림',
				    message: '게시글 작성은 로그인이 필요합니다.'
				});
			}
		});
		
		$('#freeboardTBY tr').on('click', function() {
			const bo_no = $(this).find('td:eq(0) input').val();
			const rnum = $(this).find('td:eq(0)').text();
			$(location).attr('href', '${freeboardViewURI}?bo_no=' + bo_no + '&rnum=' + rnum);
		});
	});
</script>
</head>
<body>
<div id="freeboardList_content">
	<div class="panel panel-blue">
    	<div class="panel-heading">게시판 목록</div>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th scope="col" width="5%">No</th>
					<th scope="col" width="65%">제목</th>
					<th scope="col" width="10%">작성자</th>
					<th scope="col" width="10%">작성일</th>
					<th scope="col" width="10%">조회수</th>
				</tr>
			</thead>
			<tbody id="freeboardTBY">
			<c:if test="${empty freeboardList }">
				<tr align="center">
					<td colspan="5"><font color="red">등록된 게시글이 존재하지 않습니다.</font></td>
				</tr>
			</c:if>
			<c:if test="${!empty freeboardList }">
				<c:forEach items="${freeboardList }" var="freeboardInfo">
					<tr>
						<td><input type='hidden' value='${freeboardInfo.bo_no}' />${freeboardInfo.rnum }</td>
						<td align="left">
							<c:forEach begin="1" end="${freeboardInfo.bo_depth }" varStatus="stat">
								&nbsp;&nbsp;&nbsp;
								<c:if test="${stat.last }">
									<i class="fa fa-angle-right"></i>
								</c:if>
							</c:forEach>
							${freeboardInfo.bo_title }
						</td>
						<td>${freeboardInfo.bo_nickname }</td>
						<td>${freeboardInfo.bo_reg_date }</td>
						<td>${freeboardInfo.bo_hit }</td>
					</tr>
				</c:forEach>
			</c:if>
			</tbody>
		</table>
	</div>
</div>
${paginationMenu }
<div >
<form action="${pageContext.request.contextPath }/13/main.jsp" method="post" class="form-inline pull-right">
		<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
		<select class="form-control" name="search_keycode" >
			<option>검색조건</option>
			<option value="TOTAL">전체</option>
			<option value="TITLE">제목</option>
			<option value="CONTENT">내용</option>
			<option value="NICKNAME">작성자</option>
		</select>
	    <button type="submit" class="btn btn-primary form-control">검색</button>
	    <button type="button" class="btn btn-info form-control" id="freeboardRegistBtn">게시글 등록</button>
</form>
</div>	
</body>
</html>