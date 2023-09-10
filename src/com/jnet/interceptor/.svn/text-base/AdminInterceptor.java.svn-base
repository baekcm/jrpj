package com.jnet.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter{
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler){
		if(request.getSession().getAttribute("adminInfo") == null ){
			try {
				response.sendRedirect("/admin/formLogin");	
			} catch (Exception e) {
				e.printStackTrace();
			}
			return false;
		}
		return true;
	}
}
