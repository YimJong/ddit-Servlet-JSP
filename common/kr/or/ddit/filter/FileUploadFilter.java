package kr.or.ddit.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.utils.FileUploadRequestWrapper;

import org.apache.commons.lang3.StringUtils;

public class FileUploadFilter implements Filter {

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}
	
	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
			FilterChain chain) throws IOException, ServletException {
		// 클라이언트 요청 시 컨텐츠 타입
		// 		content type  -  null
		//                       직접 브라우저의 주소창에 URL 입력 후 요청
		//                       location.href = 'URI'
		//                       location.replace('URI')
		// 		                 <a href='URI'> 훅 들어감 </a>
		//                    -  application/x-www-form-urlencoded
		//                       <form action='URI'/>
		//                       ajax
		//                    -  multipart/form-data
		//                       <form action='URI' enctype='multipart/form-data' method='post'
		//                       ajax
		
		String contentType = servletRequest.getContentType(); // 컨텐츠 타입 취득
		
		if(StringUtils.isNotEmpty(contentType) && contentType.toLowerCase().contains("multipart")) { // contentType이 널이 아니면 true
			 																					     // 스트리밍 요청 확인
			FileUploadRequestWrapper wrapper = new FileUploadRequestWrapper((HttpServletRequest)servletRequest); // HttpServletRequest = servletRequest의 부모
			chain.doFilter(wrapper, servletResponse); // jsp에 전달 => jsp는 wrapper를 받아서 캐스팅 하여 이용
		} else { 
			chain.doFilter(servletRequest, servletResponse);
		}
		
	}

}
