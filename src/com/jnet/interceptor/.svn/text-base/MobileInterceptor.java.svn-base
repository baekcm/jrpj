package com.jnet.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MobileInterceptor extends HandlerInterceptorAdapter{
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler){
		try {
			Device device = DeviceUtils.getCurrentDevice(RequestContextHolder.currentRequestAttributes());
			if(device.isMobile()) {
				System.out.println("========= mobile 접속 =========");
				response.sendRedirect("http://m.ijongno.co.kr");
				return false;
			} else {
				System.out.println("========= pc 접속 =========");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}
}
