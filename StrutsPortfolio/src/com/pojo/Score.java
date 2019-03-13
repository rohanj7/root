package com.pojo;

public class Score {

	private String rollNum;
	private int MidSemCount;
	private int semester;
	private int marks;
	private String subject_code;
	private String subject_name;
	
	public String getRollNum() {
		return rollNum;
	}
	public void setRollNum(String rollNum) {
		this.rollNum = rollNum;
	}
	public int getMidSemCount() {
		return MidSemCount;
	}
	public void setMidSemCount(int midSemCount) {
		MidSemCount = midSemCount;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public int getMarks() {
		return marks;
	}
	public void setMarks(int marks) {
		this.marks = marks;
	}
	public String getSubject_code() {
		return subject_code;
	}
	public void setSubject_code(String subject_code) {
		this.subject_code = subject_code;
	}
	public String getSubject_name() {
		return subject_name;
	}
	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}
	
}
