package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.pojo.User;

public class Interceptor implements HandlerInterceptor  {
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		System.out.println("Pre-handle");
		for(int i=0;i<=500;i++){		
		}
		User user = (User) request.getSession().getAttribute("USER");		
		return true;
	}
	//override postHandle() and afterCompletion() 

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		System.out.println("After Completion");
		User user = (User) arg0.getSession().getAttribute("USER");	
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		
		System.out.println("Post-handle");
		User user = (User) arg0.getSession().getAttribute("USER");	
	}
}
