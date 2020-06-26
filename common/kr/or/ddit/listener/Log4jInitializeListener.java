package kr.or.ddit.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import kr.or.ddit.utils.Log4jInitialize;

public class Log4jInitializeListener implements
		ServletContextAttributeListener, ServletContextListener {
	
	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("Application(ServletContent) 최초 인스턴스 시 전파되는 이벤트 청취자 리스너");
		
		Log4jInitialize.init();
	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("Application(ServletContent) GC되기 직전 전파되는 이벤트 청취자 리스너");
	}


	@Override
	public void attributeAdded(ServletContextAttributeEvent event) {
		System.out.println("application.setAttribute(키, 값) 저장 시 전파되는 이벤트 청취자 리스너");
		ServletContext application = event.getServletContext();
		
		// application.setAttribute(키, 값)
		String key = event.getName(); // 이벤트의 키 취득
		Object value = event.getValue();
		
	}

	@Override
	public void attributeRemoved(ServletContextAttributeEvent arg0) {
		System.out.println("application.removeAttrebute(키) 삭제 시 전파되는 이벤트 청취자 리스너");
	}

	@Override
	public void attributeReplaced(ServletContextAttributeEvent arg0) {
		System.out.println("application.setAttribute(기존의 동일한 키, 상이한 값) 갱신 시 전파되는 이벤트 청취자 리스너");
	}

}
