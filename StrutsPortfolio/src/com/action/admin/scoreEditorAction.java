package com.action.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.json.JSONArray;
import org.json.JSONObject;

import com.constants.Constant;
import com.dao.AdminDao;
import com.dao.UserDao;
import com.opensymphony.xwork2.ActionSupport;
import com.pojo.Score;
import com.pojo.Subject;
import com.pojo.User;

public class scoreEditorAction extends ActionSupport implements ServletRequestAware{

	/**
	 * 
	 */
	private HttpServletRequest request;
	private static final long serialVersionUID = 1L;
	private List<User> userlist;
	private Map<Integer,String> branchD;
	private Map<Integer,String> programmeD;
	private String serverStatus;
	private String serverResponseMessage;
	private int progFilter;
	private int branchFilter;
	private int semFilter;
	private String sectionFilter;	
	private List<Score> scores;
	private List<Subject> subject;
	private String studentRollNum;
	private int SubjectCountPerSem;

	AdminDao dao;
	
	
	public scoreEditorAction(){
		dao = new AdminDao();
	} 
	
	public String getUser(){
		UserDao userdao=new UserDao();
		AdminDao addao = new AdminDao();
		try {
			setBranchD(userdao.getBranch());
			setProgrammeD(userdao.getProgramme());
			if(getBranchFilter()>0 && getSemFilter()>0 && getProgFilter()>0 && !getSectionFilter().contentEquals("0")){
				System.out.println("getBranchFilter()  "+getBranchFilter());
				System.out.println("getSemFilter()  "+getSemFilter());
				System.out.println("getProgFilter()  "+getProgFilter());
				System.out.println("getSectionFilter()  "+getSectionFilter());
				setSubject(addao.getSubjectBasedOnBranchAndProgramme(getBranchFilter(), getProgFilter()));
				setSubjectCountPerSem(addao.getSubjectCountPerSem(getProgFilter(),getBranchFilter(),getSemFilter()));
				setUserlist(dao.getUserDetailsByFilters(getSectionFilter(),getSemFilter(),getBranchFilter(),getProgFilter()));
			}
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
	
	public String getStudentScore(){
		UserDao userdao = new UserDao();
		System.out.println("getStudentRollNum :" +getStudentRollNum());
		if(semFilter==0){
			semFilter=getSemFilter();
		}
		System.out.println("sem :" +semFilter);		
		try {
			setScores(userdao.getUserScore(getStudentRollNum(),semFilter));
		} catch (ClassNotFoundException | SQLException | IOException e) {
			e.printStackTrace();
		}
    
		return Constant.SUCCESS;
	}
	
	public String submitScore(){
		AdminDao addao = new AdminDao();
		String data = request.getParameter("scoreDetails");
		System.out.println("data is :"+data);
		try {
			JSONArray jsonArray = new JSONArray(data);
			/*
			JSONArray jsonArray = new JSONArray(data);
			System.out.println("jsonArray "+jsonArray);
			System.out.println("jsonArray "+jsonArray.get(0));
			JSONObject nodeRoot  = new JSONObject();
			nodeRoot.put("result", jsonArray.get(0));
			System.out.println("JSONObject "+nodeRoot);

			System.out.println("JSONObject 2"+nodeRoot.getJSONObject("result"));
			
			JSONObject nodeRoot2=nodeRoot.getJSONObject("result");
			System.out.println("nodeRoot2 "+nodeRoot2.getString("studentRollNum"));
			*/
			for(int i=0;i<jsonArray.length();i++){
				JSONObject scoreJson  = new JSONObject();
				scoreJson.put("result", jsonArray.get(i));
				JSONObject scoreJson2=scoreJson.getJSONObject("result");
				Score score = new Score();
				score.setRollNum(scoreJson2.getString("studentRollNum"));
				score.setSubject_code(scoreJson2.getString("subjectcode"));
				score.setMidSemCount(scoreJson2.getInt("midsemNum"));
				score.setMarks(scoreJson2.getInt("score"));
				score.setSemester(scoreJson2.getInt("semFilter"));
				addao.insertScore(score);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("data is :"+data);
		return Constant.SUCCESS;
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

	public int getProgFilter() {
		return progFilter;
	}

	public void setProgFilter(int progFilter) {
		this.progFilter = progFilter;
	}

	public int getBranchFilter() {
		return branchFilter;
	}

	public void setBranchFilter(int branchFilter) {
		this.branchFilter = branchFilter;
	}

	public int getSemFilter() {
		return semFilter;
	}

	public void setSemFilter(int semFilter) {
		this.semFilter = semFilter;
	}

	public String getSectionFilter() {
		return sectionFilter;
	}

	public void setSectionFilter(String sectionFilter) {
		this.sectionFilter = sectionFilter;
	}

	public String getStudentRollNum() {
		return studentRollNum;
	}

	public void setStudentRollNum(String studentRollNum) {
		this.studentRollNum = studentRollNum;
	}

	public List<Score> getScores() {
		return scores;
	}

	public void setScores(List<Score> scores) {
		this.scores = scores;
	}

	public int getSubjectCountPerSem() {
		return SubjectCountPerSem;
	}

	public void setSubjectCountPerSem(int subjectCountPerSem) {
		SubjectCountPerSem = subjectCountPerSem;
	}

	public List<Subject> getSubject() {
		return subject;
	}

	public void setSubject(List<Subject> subject) {
		this.subject = subject;
	}

	@Override
	public void setServletRequest(HttpServletRequest servletRequest) {
		this.request = servletRequest;
	}

}
