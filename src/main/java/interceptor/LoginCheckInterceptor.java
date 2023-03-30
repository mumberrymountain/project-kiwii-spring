package interceptor;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.resource.ResourceHttpRequestHandler;

import exceptionhandler.BusinessException;
import exceptionhandler.ErrorCode;

public class LoginCheckInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HashMap<String, Object> loginInfo = getLoginInfo(request);
		 
		// loggedInGuard(handler, loginInfo);
		// notLoggedInGuard(handler, loginInfo);
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HashMap<String, Object> loginInfo = getLoginInfo(request);
		
		if(loginInfo == null) modelAndView.addObject("loginInfo", false);
		else modelAndView.addObject("loginInfo", true);
	}
	
	public HashMap<String, Object> getLoginInfo(HttpServletRequest request){
		HttpSession session = request.getSession();
		HashMap<String, Object> loginInfo = (HashMap<String, Object>) session.getAttribute("loginInfo");
		
		return loginInfo;
	}
	
	private boolean checkLoggedInAnnotation(Object handler, Class<LoggedInGuard> LoggedInGuard) {
		
        if (handler instanceof ResourceHttpRequestHandler) {
            return true;
        }

        HandlerMethod handlerMethod = (HandlerMethod) handler;

        if (null != handlerMethod.getMethodAnnotation(LoggedInGuard) || null != handlerMethod.getBeanType().getAnnotation(LoggedInGuard)) {
            return true;
        }

        return false;
    }
	
	private boolean checkNotLoggedInAnnotation(Object handler, Class<NotLoggedInGuard> NotLoggedInGuard) {
		
        if (handler instanceof ResourceHttpRequestHandler) {
            return true;
        }

        HandlerMethod handlerMethod = (HandlerMethod) handler;

        if (null != handlerMethod.getMethodAnnotation(NotLoggedInGuard) || null != handlerMethod.getBeanType().getAnnotation(NotLoggedInGuard)) {
            return true;
        }

        return false;
    }
	
	private void loggedInGuard(Object handler, HashMap<String, Object> loginInfo) {
		boolean loggedInGuard = checkLoggedInAnnotation(handler, LoggedInGuard.class);
		
		if(loggedInGuard == true) {
			if(loginInfo == null) {
				throw new BusinessException(ErrorCode.FORBIDDEN, "로그인하지 않은 상태에서 진입 시도");
			}
		}
	}
	
	private void notLoggedInGuard(Object handler, HashMap<String, Object> loginInfo) {
		boolean notLoggedInGuard = checkNotLoggedInAnnotation(handler, NotLoggedInGuard.class);
		if(notLoggedInGuard == true) {
			if(loginInfo != null) {
				throw new BusinessException(ErrorCode.FORBIDDEN, "로그인하지 않은 상태에서 진입 시도");
			}
		}
	}
}
