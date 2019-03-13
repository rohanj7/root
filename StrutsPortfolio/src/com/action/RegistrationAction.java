package com.action;


import java.util.Map;
import com.constants.Constant;
import com.dao.UserDao;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pojo.User;

public class RegistrationAction extends ActionSupport implements ModelDriven<User> {

	UserDao userdao;
	private static final long serialVersionUID = 1L;
	protected User user = new User();
	private String status;
	private Map<Integer,String> branchD;
	private Map<Integer,String> programmeD;
	
	public RegistrationAction(){
		userdao = new UserDao();
	}
	
	@Override
	public User getModel() {
		return user;
	}
	
	public String getRegisterPageDetails(){
		try {
			setBranchD(userdao.getBranch());
			setProgrammeD(userdao.getProgramme());
		} catch (Exception e) {
			e.printStackTrace();
			return Constant.ERROR;
		}
		return Constant.SUCCESS;
	}
	
	public String registerUser(){
		try {
			setStatus(userdao.checkUserStatus(user.getRollNo()));
			if(getStatus().equals(Constant.NOTFOUND)){
				System.out.println(userdao.addUser(user));
			}else{
				return Constant.ALREADY;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return Constant.ERROR;
		}
		return Constant.SUCCESS;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Map getBranchD() {
		return branchD;
	}

	public void setBranchD(Map branchD) {
		this.branchD = branchD;
	}

	public Map getProgrammeD() {
		return programmeD;
	}

	public void setProgrammeD(Map programmeD) {
		this.programmeD = programmeD;
	}
}
