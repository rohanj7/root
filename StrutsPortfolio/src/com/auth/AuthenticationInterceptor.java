package com.auth;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.pojo.User;

public class AuthenticationInterceptor implements Interceptor {

	private static final long serialVersionUID = -5011962009065225959L;

	@Override
	public void destroy() {
		//release resources here
	}

	@Override
	public void init() {
		// create resources here
	}

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		System.out.println("inside auth interceptor");
		Map<String, Object> sessionAttributes = actionInvocation.getInvocationContext().getSession();	
		User user = (User) sessionAttributes.get("USER");		
		if(user == null ){
			return "error";
		}else{
			//Action action = (Action) actionInvocation.getAction();
			return actionInvocation.invoke();
		}
	}

}
