package com.jnet.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class NonInterceptor extends HandlerInterceptorAdapter{
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler){
		if(request.getSession().getAttribute("userInfo") != null ){
			try {
				response.sendRedirect("/main");	
			} catch (Exception e) {
				e.printStackTrace();
			}
			return false;
		}
		return true;
	}
}
