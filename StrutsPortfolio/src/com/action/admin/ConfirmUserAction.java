package com.action.admin;

import java.util.List;

import com.constants.Constant;
import com.dao.AdminDao;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pojo.User;

public class ConfirmUserAction extends ActionSupport implements ModelDriven<User>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected User user=new User();
	private List<User> userlist;	
	private String serverStatus;
	private String serverResponseMessage;
	AdminDao dao;
	
	public ConfirmUserAction(){
		dao = new AdminDao();
	} 
	
	public String getUser(){
		try {
			setUserlist(dao.getAllUserDetails());
			if(serverStatus != null){
				if(serverStatus.contentEquals(Constant.SUCCESS)){
					setServerResponseMessage(Constant.SUCCESS_MESSAGE);
				}else{
					setServerResponseMessage(Constant.ERROR_MESSAGE);
				}
			}
			System.out.println(getServerStatus());
			System.out.println(getServerResponseMessage());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Constant.SUCCESS;
	}
	
	public String updateUserStatus(){
		try {
			if(dao.updateUserStatus(user.getStatus(),user.getRollNo())){
				setServerStatus(Constant.SUCCESS);
			}else{
				setServerStatus(Constant.ERROR);
			}
		} catch (Exception e) {
			e.printStackTrace();
			setServerStatus(Constant.ERROR);
		}
		return Constant.SUCCESS;
	}
	
	public String suspendAll(){
		try {
			if(dao.updateAllUserStatus()){
				setServerStatus(Constant.SUCCESS);
			}else{
				setServerStatus(Constant.ERROR);
			}
		} catch (Exception e) {
			e.printStackTrace();
			setServerStatus(Constant.ERROR);
		}
		return Constant.SUCCESS;
	}

	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}

	public List<User> getUserlist() {
		return userlist;
	}

	public void setUserlist(List<User> userlist) {
		this.userlist = userlist;
	}

	public String getServerStatus() {
		return serverStatus;
	}

	public void setServerStatus(String serverStatus) {
		this.serverStatus = serverStatus;
	}

	public String getServerResponseMessage() {
		return serverResponseMessage;
	}

	public void setServerResponseMessage(String serverResponseMessage) {
		this.serverResponseMessage = serverResponseMessage;
	}



}
