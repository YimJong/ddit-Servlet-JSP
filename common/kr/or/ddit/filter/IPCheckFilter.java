package kr.or.ddit.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

public class IPCheckFilter implements Filter {
	private static Map<String, String> ipMap;
	
	
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		ipMap = new HashMap<String, String>();
		ipMap.put("127.0.0.1", "A");
		ipMap.put("0:0:0:0:0:0:0:1", "A");
		ipMap.put("192.168.206.48", "A");
		ipMap.put("192.168.206.52", "F");
	}
	
	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
			FilterChain chain) throws IOException, ServletException {
		String clientIP = servletRequest.getRemoteAddr(); // 클라이언트 아이피 주소 취득
		
		boolean flag = true;
		if(StringUtils.isNotEmpty(clientIP) && ipMap.containsKey(clientIP)) { // null, ""이 아닌경우
			if("A".intern() == ipMap.get(clientIP).intern()) {
				chain.doFilter(servletRequest, servletResponse);
			} else {
				flag = false;
			}
		} else { // Map에 없는 아이피로 접근하는 경우
			flag = false;
		}
		
		if(!flag) {
			HttpServletResponse response = (HttpServletResponse) servletResponse;
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charsht=UTF-8");
			
			PrintWriter out = response.getWriter();
			out.println("<html>");
			out.println("<body>");
			out.println("<font color='red'>잘생긴놈 꺼져..</font>");
			out.println("</body>");
			out.println("</html>");
		}
	}


}
