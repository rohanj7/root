package com.action.admin;

import java.util.List;
import java.util.Map;

import com.constants.Constant;
import com.dao.AdminDao;
import com.dao.UserDao;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pojo.User;

public class StudentProfileEditorAction extends ActionSupport implements ModelDriven<User>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected User user=new User();
	private List<User> userList;
	private Map<Integer,String> branchD;
	private Map<Integer,String> programmeD;
	private String serverStatus;
	private String serverResponseMessage;
	AdminDao dao;
	
	public StudentProfileEditorAction(){
		dao = new AdminDao();
	}
	
	public String getAllUser(){
		UserDao userdao = new UserDao();
		try {
			setBranchD(userdao.getBranch());
			setProgrammeD(userdao.getProgramme());
			setUserList(dao.getAllUserDetails());
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
	
	public String updateUser(){
		UserDao userdao = new UserDao();
		try {
			if(userdao.updateUser(user)){
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
	
	public String addUser(){
		UserDao userdao = new UserDao();
		try {
			if(userdao.addUser(user)){
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
	
	public String deleteUser(){
		UserDao userdao = new UserDao();
		try {
			if(userdao.deleteUser(user.getRollNo())){
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
		return user;
	}

	public Map<Integer,String> getBranchD() {
		return branchD;
	}

	public void setBranchD(Map<Integer,String> branchD) {
		this.branchD = branchD;
	}

	public Map<Integer,String> getProgrammeD() {
		return programmeD;
	}

	public void setProgrammeD(Map<Integer,String> programmeD) {
		this.programmeD = programmeD;
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

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

}