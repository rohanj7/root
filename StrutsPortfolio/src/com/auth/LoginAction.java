package com.auth;


import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;
import com.constants.Constant;
import com.dao.UserDao;
import com.opensymphony.xwork2.ActionSupport;
import com.pojo.User;

public class LoginAction extends ActionSupport implements SessionAware{

	private static final long serialVersionUID = -3369875299120377549L;
	private User user = new User();	
	private Map<String,Object> sessionAttributes = null;
	private String userPassword;
	private String rollnumber;
	private String status;
	
	@Override
	public void setSession(Map<String, Object> sessionAttributes) {
		this.sessionAttributes = sessionAttributes;
	}
		
	@Override
	public String execute(){
		
		if(rollnumber.trim().equals("")){
			return Constant.ERROR;
		}
		
		UserDao ud = new UserDao();
		String password;
		String role;
		try {
			password = ud.getPassword(rollnumber);
			role=ud.checkUserStatus(rollnumber);
			System.out.println("Pasword :"+password);
			System.out.println("Role :"+role);	
		} catch (Exception e) {
			e.printStackTrace();
			return Constant.ERROR;	
		}	
		
		if(password.equals(userPassword)){
			user.setRollNo(rollnumber);
			sessionAttributes.put("USER",user);
			if(role.equals(Constant.ADMIN)){
				status=Constant.ADMIN;
				return Constant.ADMIN;
			}else{
				status=Constant.SUCCESS;
				return Constant.SUCCESS;
			}
		}else if(password.equals(Constant.NOTFOUND)){
			status=Constant.NOTFOUND;
		}else if(password.equals(Constant.INACTIVE)){
			status=Constant.INACTIVE;
		}else{
			status=Constant.INCORRECT;
		}
		return Constant.ALREADY;
	}
	
	public String logout(){	
		sessionAttributes.remove("USER");
		return Constant.SUCCESS;
	}
	  
	public String getRollnumber() {
		return rollnumber;
	}

	public void setRollnumber(String rollnumber) {
		this.rollnumber = rollnumber;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
