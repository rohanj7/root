package com.action.admin;

import java.util.List;
import java.util.Map;

import com.constants.Constant;
import com.dao.AdminDao;
import com.dao.UserDao;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pojo.Subject;

public class SubjectEditorAction extends ActionSupport implements ModelDriven<Subject>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected Subject subject=new Subject();
	private List<Subject> subjectlist;
	private Map<Integer,String> branchD;
	private Map<Integer,String> programmeD;
	private String serverStatus;
	private String serverResponseMessage;
	AdminDao dao;
	
	public SubjectEditorAction(){
		dao = new AdminDao();
	}
	
	public String getAllSubject(){
		UserDao userdao = new UserDao();
		try {
			setBranchD(userdao.getBranch());
			setProgrammeD(userdao.getProgramme());
			setSubjectlist(dao.getAllSubjectDetails());
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
	
	public String updateSubject(){
		try {
			if(dao.updateSubject(subject)){
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
	
	public String addSubject(){
		try {
			if(dao.addSubject(subject)){
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
	public Subject getModel() {
		return subject;
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

	public List<Subject> getSubjectlist() {
		return subjectlist;
	}

	public void setSubjectlist(List<Subject> subjectlist) {
		this.subjectlist = subjectlist;
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
	
	
}
