package kr.or.ddit.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Filter1 implements Filter {

	
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// 해당 필터의 최초 인스턴스 시 1회에 한해 콜백되는 메서드
		// 해당 필터에서 활용 될 자원의 취득용으로 사용
	}

	@Override
	public void destroy() {
		// 해당 필터가 서버의 종료 또는 필터의 인스턴스가 GC되기 직전에 콜백되는 콜백 메서드
		// 취득했던 자원의 반납용으로 이용
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
			FilterChain chain/*다른 필터 호출에 사용*/) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		
		HttpSession session = request.getSession();
		
		// 전처리 코드 : 다른 필터 또는 jsp의 요청 처리 전에 실행되어야 하는 코드 구성
		System.out.println("Filter1의 doFilter() 내 전처리 코드");
		
		chain.doFilter(servletRequest, servletResponse);
		
		// 후처리 코드 : jsp에 의해 작성된 응답 컨텐츠의 클라이언트(브라우저)대상
		//           전송 시작 전 실행되어야 하는 코드 구성
		System.out.println("Filter1의 doFilter() 내 후처리 코드");
	}
}
