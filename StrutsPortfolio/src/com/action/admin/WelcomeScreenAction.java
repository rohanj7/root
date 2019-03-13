package com.action.admin;

import java.util.List;

import com.constants.Constant;
import com.dao.AdminDao;
import com.opensymphony.xwork2.ActionSupport;
import com.pojo.Notification;

public class WelcomeScreenAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Notification> listOfAllNotification;
	
	public String getAllDetails(){
		AdminDao dao = new AdminDao();
		try {
			setListOfAllNotification(dao.getAllNotification(true,false));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Constant.SUCCESS;
	}
	
	public List<Notification> getListOfAllNotification() {
		return listOfAllNotification;
	}
	public void setListOfAllNotification(List<Notification> listOfAllNotification) {
		this.listOfAllNotification = listOfAllNotification;
	}	
}
