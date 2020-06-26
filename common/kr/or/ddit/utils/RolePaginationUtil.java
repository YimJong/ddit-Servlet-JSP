package kr.or.ddit.utils;

import javax.servlet.http.HttpServletRequest;

public class RolePaginationUtil {
	
	private int currentPage;   	   // 현재 페이지 (매개변수)
	private int totalCount; 	   // 전체 게시글 갯수 (매개변수)
	private int totalPage;  	   // 전체 페이지 갯수
	private int blockCount = 10;   // 페이지별 출력 될 게시글 갯수 
	private int blockPage = 5;     // 페이지네이션 메뉴 갯수
	private int startPage;         // 페이지네이션 메뉴 시작 페이지 번호
	private int endPage;		   // 페이지네이션 메뉴 끝 페이지 번호
	private int startCount;       // 해당 페이지 내 게시글 시작 번호
	private int endCount;         // 해당 페이지 내 게시글 끝 번호
	private HttpServletRequest request; // (매개변수)
	private StringBuffer pagingHtmls;  // 페이지네이션 메뉴를 만드는 태그
	
	public RolePaginationUtil(HttpServletRequest request, int currentPage, int totalCount) {
		this.request = request;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		
		pagingHtmls = new StringBuffer();
		
		makePagination();
	}

	private void makePagination() {
		// 전체 페이지 갯수
		this.totalPage = (int) Math.ceil(this.totalCount / (double)this.blockCount);
		if(this.totalPage == 0) {   // 게시글이 없을 경우
			this.totalPage = 1;
		}
		
		// 해당 페이지 내 게시글 시작 번호, 끝 번호 계산
		this.startCount = this.totalCount - (this.currentPage - 1) * this.blockCount; // 제일 마지막 글을 가장 위로 올리기 때문.
		this.endCount = this.startCount - this.blockCount + 1;
		if(this.endCount < 0) {
			this.endCount = 1;
		}
		
		// 페이지별 페이지네이션 메뉴 시작 페이지 번호, 끝 페이지 번호  취득
		// 이전|1|2|3|4|5|다음
		// 이전|6|7|8|9|10|다음
		this.startPage = ((this.currentPage - 1) / this.blockPage * this.blockPage) + 1;
		this.endPage = this.startPage + this.blockPage - 1;
		if(this.endPage > this.totalPage) {
			this.endPage = this.totalPage;
		}
		
		this.pagingHtmls.append("<div class='text-center'>");
		this.pagingHtmls.append("<ul class='pagination mtm mbm'>");
		
		String requestURI = request.getRequestURI();
		
		// 이전|1|2|3|4|5|다음
		// 이전
		if((this.currentPage - 1) == 0) { // 0 페이지면 '이전'이 클릭되면 안됨
			this.pagingHtmls.append("<li class='disabled'><a href='#'>&laquo;</a></li>");
		} else { 
			this.pagingHtmls.append("<li><a href='" + requestURI + "?currentPage=" + (this.currentPage - 1) + "'>&laquo;</a></li>");
		}
		
		// |1|2|3|4|5|
		for(int i = this.startPage; i <= this.endPage; i++) {
			if(this.currentPage == i) {
				this.pagingHtmls.append("<li class='active'><a href='" + requestURI + "?currentPage=" + currentPage + "'>" + i + "</a></li>");
			} else {
				// 현재 페이지가 아닌 애들
				this.pagingHtmls.append("<li><a href='" + requestURI + "?currentPage=" + i + "'>" + i + "</a></li>");
			}
		}
		
		
		// 다음
		if(this.currentPage < this.totalPage){ // 0 페이지면 '이전'이 클릭되면 안됨
			this.pagingHtmls.append("<li><a href='" + requestURI + "?currentPage=" + (this.currentPage + 1) + "'> &raquo;</a></li>");
		} else { 
			this.pagingHtmls.append("<li class='disabled'><a href='#'>&raquo;</a></li>");
		}
		
		
		this.pagingHtmls.append("</ul>");
		this.pagingHtmls.append("</div>");
	}

	
	public int getStartCount() {
		return startCount;
	}

	public int getEndCount() {
		return endCount;
	}

	public String getPagingHtmls() {
		return pagingHtmls.toString();
	}
	
	
	
	
	
}
