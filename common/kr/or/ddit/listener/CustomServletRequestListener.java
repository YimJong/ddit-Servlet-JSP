package kr.or.ddit.listener;

import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class CustomServletRequestListener implements
		ServletContextAttributeListener, ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// HttpServletRequest가 GC되기 직전에 전파되는 이벤트 청취자 리스너 (메모리 상에서 사라질 때)
		// WHEN? 서버의 클라이언트 요청에 따른 응답 처리 완료 시 HttpServletRequest가 GC.
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// HttpServletRequest가 인스턴스화 될 때 마다 전파되는 이벤트 청취자 리스너
		// WHEN? 클라이언트의 요청이 웹 어플리케이션 서버에 전달될 때마다 인스턴스화 처리.
		//       Request, Response 새로 생성
	}

	@Override
	public void attributeAdded(ServletContextAttributeEvent arg0) {
		// HttpServletRequest.setAttribute(키, 값) 저장 시 마다 전파되는 이벤트 청취자.
	}

	@Override
	public void attributeRemoved(ServletContextAttributeEvent arg0) {
		// HttpServletRequest.removeAttribute(키) 삭제 시 마다 전파되는 이벤트 청취자.
	}

	@Override
	public void attributeReplaced(ServletContextAttributeEvent arg0) {
		// HttpServletRequest.setAttribute(기존 동일한 키, 상이한 값) 갱신 시 마다 전파되는 이벤트 청취자.
	}

}
