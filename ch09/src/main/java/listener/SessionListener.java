package listener;

import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionAttributeListener;
import jakarta.servlet.http.HttpSessionBindingEvent;

@WebListener
public class SessionListener implements HttpSessionAttributeListener {
	
	int count = 0;
	
	@Override
	public void attributeAdded(HttpSessionBindingEvent event) {
		// 세션에 값이 추가될 때
		count++;
		System.out.println("현재 로그인 총 사용자 : " + count);
	}
	
	@Override
	public void attributeRemoved(HttpSessionBindingEvent event) {
		// 세션에 값이 제거될 때
		count--;
		System.out.println("현재 로그인 총 사용자 : " + count);
	}

}