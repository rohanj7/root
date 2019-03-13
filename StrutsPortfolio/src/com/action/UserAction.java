package com.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.constants.Constant;
import com.dao.AdminDao;
import com.dao.UserDao;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pojo.Notification;
import com.pojo.Score;
import com.pojo.User;

public class UserAction extends ActionSupport implements ModelDriven<User>{

	UserDao userdao;
	private static final long serialVersionUID = 1L;
	private User user = new User();
	private String status;
	private Map<Integer,String> branchD;
	private Map<Integer,String> programmeD;
	private List<Notification> listOfAllNotification;
	private String serverStatus;
	private String serverResponseMessage;
	private List<Score> scores;
	private int semFiter;
	
	public String getAllDetails(){
		HttpSession session=ServletActionContext.getRequest().getSession(false);
		User usr1=(User) session.getAttribute("USER");
		AdminDao dao = new AdminDao();
		userdao= new UserDao();
		
		try {
			setBranchD(userdao.getBranch());
			setProgrammeD(userdao.getProgramme());
			setListOfAllNotification(dao.getAllNotification(false,true));
			setUser(userdao.getUserDetails(usr1.getRollNo()));
			
			System.out.println("Before sem :" +semFiter);
			if(semFiter==0){
				semFiter=Integer.parseInt(getUser().getSem());
			}
			System.out.println("sem :" +semFiter);
			
			setScores(userdao.getUserScore(getUser().getRollNo(),getSemFiter()));
			System.out.println(getModel().getFirstName());
			if(serverStatus != null){
				if(serverStatus.contentEquals(Constant.SUCCESS)){
					setServerResponseMessage(Constant.SUCCESS_MESSAGE);
				}else{
					setServerResponseMessage(Constant.ERROR_MESSAGE);
				}
			}
			setStatus(getUser().getStatus());
			System.out.println("USer Status : "+user.getStatus());
			session.removeAttribute("USER");
			session.setAttribute("USER",getModel());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Constant.SUCCESS;
	}
		
	public String updateUser(){
		UserDao userdao = new UserDao();
		AdminDao addao = new AdminDao();
		HttpSession session=ServletActionContext.getRequest().getSession(false);
		User usr1=(User) session.getAttribute("USER");
		try {
			if(userdao.updateUser(user)){
				setServerStatus(Constant.SUCCESS);
			if(usr1.getStatus().equals(Constant.SUSPENDED)){
				addao.updateUserStatus(Constant.RESUBMITTED,user.getRollNo());
			}
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

	public User getUser(){
		return getModel();
	}
	
	public void setUser(User user){
		this.user=user;
	}
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public List<Score> getScores() {
		return scores;
	}

	public void setScores(List<Score> scores) {
		this.scores = scores;
	}

	public int getSemFiter() {
		return semFiter;
	}

	public void setSemFiter(int semFiter) {
		this.semFiter = semFiter;
	}

}
