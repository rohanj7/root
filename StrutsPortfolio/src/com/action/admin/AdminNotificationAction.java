
package com.action.admin;

import java.util.List;
import com.constants.Constant;
import com.dao.AdminDao;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pojo.Notification;


public class AdminNotificationAction extends ActionSupport implements ModelDriven<Notification>{

	AdminDao dao; 
	private static final long serialVersionUID = 1L;
	protected Notification notification = new Notification();
	private List<Notification> listOfAllNotification;	
	private String serverStatus;
	private String serverResponseMessage;
	
	public AdminNotificationAction(){
		dao = new AdminDao();
	} 

	public String getNotification(){
		try {
			setListOfAllNotification(dao.getAllNotification(true,true));
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

	public String addNotification(){
		try {
			if(dao.addNotification(notification)){
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
	
	public String removeNotification(){
		try {
			if(dao.deleteNotification(notification.getId())){
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
	
	public String updateNotification(){
		try {
			if(dao.updateNotification(notification)){
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
	public Notification getModel() {
		return notification;
	}

	public List<Notification> getListOfAllNotification() {
		return listOfAllNotification;
	}

	public void setListOfAllNotification(List<Notification> listOfAllNotification) {
		this.listOfAllNotification = listOfAllNotification;
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
