package kr.or.ddit.listener;

import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import kr.or.ddit.vo.MemberVO;

public class SessionManager implements HttpSessionAttributeListener,  // 동시 로그인을 막기 위한 클래스
		HttpSessionListener {
	
	public static SessionManager sessionManager = null;
	
	// 생성 된 모든 세션(모든 클라이언트)들을 저장
	public static Hashtable<String, Object> sessionMonitor; // Object => Session 자체
	
	public SessionManager() {
		if(sessionMonitor == null) {
			sessionMonitor = new Hashtable<String, Object>();
		}
	}
	
	public static synchronized SessionManager getInstance() { // 내 쓰레드가 동작 중이면 다른 쓰레드가 접근 못함.
		if(sessionManager == null) {
			sessionManager = new SessionManager();
		}
		return sessionManager;
	}
	
	@Override
	public void sessionCreated(HttpSessionEvent event) {
		HttpSession newSession =  event.getSession(); // 금번 신규 생성된 세션을 취득
		
		synchronized(sessionMonitor) { 
			sessionMonitor.put(newSession.getId(), newSession);
		}
	}
	
	public boolean loginDuplicationCheck(String sessionID, String mem_id) { // 로그인 중복 체크
		boolean flag = false;
		
		Enumeration<Object> sessions =  sessionMonitor.elements(); // 세션들을 다 꺼냄
		while(sessions.hasMoreElements()) {
			HttpSession session = (HttpSession) sessions.nextElement();
			
			// 로그인 회원정보 취득
			MemberVO loginedMemberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
			
			if(loginedMemberInfo != null) {
				// 해당 메서드에 전달 된 mem_id 값은 금번 신규 로그인한 회원의 아이디임.
				// loginedMemberInfo.getMem_id() 값은 기존 로그인한 회원의 아이디.
				if(mem_id.intern() == loginedMemberInfo.getMem_id().intern() && // 같다면 중복 로그인을 시도하는 것 임.
						sessionID.intern() != session.getId().intern() /*세션의 아이디가 다르면..*/) {   
					session.invalidate();  // sessionDestoryed로 전파
					flag = true;
				}
			}
		}
		return flag;
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		HttpSession removeSession = event.getSession(); // 금번 삭제되는 세션을 취득
		
		synchronized(sessionMonitor) { 
			sessionMonitor.remove(removeSession.getId());
		}	
	}

	@Override
	public void attributeAdded(HttpSessionBindingEvent arg0) {
		
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent arg0) {
		
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent arg0) {
		
	}

}
