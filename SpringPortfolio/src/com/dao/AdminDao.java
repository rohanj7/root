package com.dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import com.constants.Constant;
import com.pojo.Notification;
import com.pojo.Subject;
import com.pojo.User;

// Do not forget to close connection in each method
public class AdminDao {

	public Connection conn=null;
	
	private String getAllNotification="SELECT * FROM notice n where publish_area in (?,?,?)";
	private String insertNotification = "INSERT INTO notice"
			+ "(`message`,`header`,`publish_area`,`created_date`,`status`) VALUES"
			+ "(?,?,?,?,?)";
	private String updateNotification ="UPDATE notice SET message=?,header=?,publish_area=?,status=? WHERE internal_id=?";
	private String removeNotification=" delete from notice where internal_id=?";
	//private String getAllUserDetails="Select * from student_details s left join login l on s.roll_number=l.roll_user_number";
	private String getAllUserDetails="Select * from student_details s left join login l on s.roll_number=l.roll_user_number "
			+ "left join branch b on s.branch=b.internal_id "
			+ "left join programme p on s.programme=p.internal_id";
	
	private String getProgrammes="SELECT * FROM programme p";
	private String updateUserStatus ="UPDATE login SET login_status=? WHERE roll_user_number=?";
	private String getAllSubjectDetails ="select s.subject_code,s.subject_name,s.branch_code,s.programme_code,s.status,b.branch_name,p.programme_name "
			+ "from subject s ,branch b,programme p where "
			+ "s.branch_code=b.internal_id AND s.programme_code=p.internal_id;";
	private String insertSubject = "INSERT INTO subject"
			+ "(`subject_code`,`subject_name`,`branch_code`,`programme_code`,`status`) VALUES"
			+ "(?,?,?,?,?)";
	private String updateSubject ="UPDATE subject SET subject_name=?,branch_code=?,programme_code=?,status=? "
			+ "WHERE subject_code=?";
	private String getUserByFilter="Select * from student_details s left join login l on s.roll_number=l.roll_user_number "
			+ "left join branch b on s.branch=b.internal_id left join programme p on s.programme=p.internal_id "
			+ "where s.semester=? AND s.section=? AND s.programme=? AND s.branch=?";
	
	public static void main(String[] args) {
		AdminDao object;
		try {
			object = new AdminDao();
			object.getConnection();
			Notification not= new Notification();
			not.setId(2);
			not.setHeader("testing123131231");
			not.setDescription("Hi Hello");
			not.setPublishArea("ALL");
			not.setDate("11/07/2019");
			not.setStatus(Constant.INACTIVE);
			object.updateNotification(not);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	
	}
	
	public void getConnection() throws ClassNotFoundException, SQLException, IOException{
		Properties prop = new Properties();
		InputStream input = null;
		input = getClass().getClassLoader().getResourceAsStream("application.properties");
		prop.load(input);			
		Class.forName("com.mysql.jdbc.Driver");			  
		conn = (Connection) DriverManager.getConnection(prop.getProperty("dburl"),prop.getProperty("user"),prop.getProperty("password")); 
		System.out.println("--------------------------connection established-------------------------------");
	}
	
	public List<Notification> getAllNotification(boolean blog ,boolean studentPortal) throws ClassNotFoundException, SQLException, IOException{
		
		List<Notification> notifications = new ArrayList<Notification>();
		getConnection();
		
		
		PreparedStatement preparedStatement = conn.prepareStatement(getAllNotification);
		preparedStatement.setString(1,Constant.ALL);
		if(blog)
			preparedStatement.setString(2,Constant.BLOG);
		else
			preparedStatement.setString(2,Constant.ALL);
		
		if(studentPortal)
			preparedStatement.setString(3,Constant.STUDENT_PORTAL);
		else
			preparedStatement.setString(3,Constant.ALL);
		
		ResultSet rs = preparedStatement.executeQuery();
		while(rs.next()){
			Notification notification = new Notification();
			notification.setId(rs.getInt(1));
			notification.setDescription(rs.getString(2));
			notification.setHeader(rs.getString(3));
			notification.setStatus(rs.getString(4));
			notification.setPublishArea(rs.getString(5));
			notification.setDate(rs.getString(6));
			notifications.add(notification);
		}
		conn.close();
		return notifications;
	}
	
	public boolean addNotification(Notification notification) throws ClassNotFoundException, SQLException, IOException{
		
		getConnection();
		PreparedStatement preparedStatement = conn.prepareStatement(insertNotification);
		preparedStatement.setString(1,notification.getDescription());
		preparedStatement.setString(2,notification.getHeader());
		preparedStatement.setString(3,notification.getPublishArea());
		preparedStatement.setString(4,notification.getDate());
		preparedStatement.setString(5,Constant.ACTIVE);
		int i= preparedStatement.executeUpdate();
		preparedStatement.close();
		conn.close();	
		if(i>=1)
			return true;
		else
			return false;
	}
	
	public boolean updateNotification(Notification notification) throws ClassNotFoundException, SQLException, IOException{
		
		getConnection();
		PreparedStatement preparedStatement = conn.prepareStatement(updateNotification);
		preparedStatement.setString(1,notification.getDescription());
		preparedStatement.setString(2,notification.getHeader());
		preparedStatement.setString(3,notification.getPublishArea());
		preparedStatement.setString(4,notification.getStatus());
		preparedStatement.setInt(5,notification.getId());
		int i= preparedStatement.executeUpdate();
		preparedStatement.close();
		conn.close();	
		if(i>=1)
			return true;
		else
			return false;
	}
	
	public boolean deleteNotification(int id) throws ClassNotFoundException, SQLException, IOException{
		
		getConnection();
		PreparedStatement preparedStatement = conn.prepareStatement(removeNotification);
		preparedStatement.setInt(1,id);
		int i= preparedStatement.executeUpdate();
		preparedStatement.close();
		conn.close();	
		if(i>=1)
			return true;
		else
			return false;
	}
	
	public List<User> getAllUserDetails() throws ClassNotFoundException, SQLException, IOException{
		
		List<User> users = new ArrayList<User>();
		getConnection();
		PreparedStatement preparedStatement = conn.prepareStatement(getAllUserDetails);
		ResultSet rs = preparedStatement.executeQuery();
		while(rs.next()){
			User user = new User();
			user.setRollNo(rs.getString(1));
			user.setFirstName(rs.getString(2));
			user.setLastName(rs.getString(3));
			user.setDob(rs.getString(4));
			user.setYoj(rs.getInt(5));
			user.setSem(rs.getInt(6)+"");
			user.setSection(rs.getString(7));
			user.setEmail(rs.getString(8));
			user.setMobNum(rs.getString(9));
			user.setProg(rs.getInt(10));
			user.setBranch(rs.getInt(11));
			user.setStatus(rs.getString(14));
			user.setBranch_name(rs.getString(16));
			user.setProg_name(rs.getString(18));
			users.add(user);
		}
		conn.close();
		return users;
	}
	
	public List<User> getUserDetailsByFilters(String section,int sem,int branch,int prog) throws ClassNotFoundException, SQLException, IOException{
		
		List<User> users = new ArrayList<User>();
		getConnection();
		PreparedStatement preparedStatement = conn.prepareStatement(getUserByFilter);
		preparedStatement.setInt(1,sem);
		preparedStatement.setString(2,section);
		preparedStatement.setInt(3,prog);
		preparedStatement.setInt(4,branch);
		
		ResultSet rs = preparedStatement.executeQuery();
		while(rs.next()){
			User user = new User();
			user.setRollNo(rs.getString(1));
			user.setFirstName(rs.getString(2));
			user.setLastName(rs.getString(3));
			user.setDob(rs.getString(4));
			user.setYoj(rs.getInt(5));
			user.setSem(rs.getInt(6)+"");
			user.setSection(rs.getString(7));
			user.setEmail(rs.getString(8));
			user.setMobNum(rs.getString(9));
			user.setProg(rs.getInt(10));
			user.setBranch(rs.getInt(11));
			user.setStatus(rs.getString(14));
			user.setBranch_name(rs.getString(16));
			user.setProg_name(rs.getString(18));
			users.add(user);
		}
		conn.close();
		return users;
	}

	public Map<Integer,String> getProgramme() throws ClassNotFoundException, SQLException, IOException{
		
		Map<Integer,String> m1 = new HashMap<Integer,String>(); 
		getConnection();
		PreparedStatement preparedStatement = conn.prepareStatement(getProgrammes);
		ResultSet rs = preparedStatement.executeQuery();
		while(rs.next()){
			m1.put(rs.getInt(1),rs.getString(2));
		}
		conn.close();
		return m1;
	}
	
	public boolean updateUserStatus(String status,String rollNum) throws ClassNotFoundException, SQLException, IOException{
		
		getConnection();
		PreparedStatement preparedStatement = conn.prepareStatement(updateUserStatus);
		preparedStatement.setString(1,status);
		preparedStatement.setString(2,rollNum);
		int i= preparedStatement.executeUpdate();
		preparedStatement.close();
		conn.close();	
		if(i>=1)
			return true;
		else
			return false;
	}
	
	public List<Subject> getAllSubjectDetails() throws ClassNotFoundException, SQLException, IOException{
		
		List<Subject> subjects = new ArrayList<Subject>();
		getConnection();
		PreparedStatement preparedStatement = conn.prepareStatement(getAllSubjectDetails);
		ResultSet rs = preparedStatement.executeQuery();
		while(rs.next()){
			Subject subject = new Subject();
			subject.setSubject_code(rs.getString(1));
			subject.setSubject_name(rs.getString(2));
			subject.setBranch_code(rs.getInt(3));
			subject.setProgramme_code(rs.getInt(4));
			subject.setStatus(rs.getString(5));
			subject.setBranch_name(rs.getString(6));
			subject.setProgramme_name(rs.getString(7));
			subjects.add(subject);
		}
		conn.close();
		return subjects;
	}
	
	public boolean addSubject(Subject subject) throws ClassNotFoundException, SQLException, IOException{
		
		getConnection();
		PreparedStatement preparedStatement = conn.prepareStatement(insertSubject);
		preparedStatement.setString(1,subject.getSubject_code());
		preparedStatement.setString(2,subject.getSubject_name());
		preparedStatement.setInt(3,subject.getBranch_code());
		preparedStatement.setInt(4,subject.getProgramme_code());
		preparedStatement.setString(5,Constant.ACTIVE);
		int i= preparedStatement.executeUpdate();
		preparedStatement.close();
		conn.close();	
		if(i>=1)
			return true;
		else
			return false;
	}
	
	public boolean updateSubject(Subject subject) throws ClassNotFoundException, SQLException, IOException{
		
		getConnection();
		PreparedStatement preparedStatement = conn.prepareStatement(updateSubject);	
		preparedStatement.setString(1,(subject.getSubject_name()).trim());
		preparedStatement.setInt(2,subject.getBranch_code());
		preparedStatement.setInt(3,subject.getProgramme_code());
		preparedStatement.setString(4,Constant.ACTIVE);
		preparedStatement.setString(5,(subject.getSubject_code()).trim());
		int i= preparedStatement.executeUpdate();
		preparedStatement.close();
		conn.close();	
		if(i>=1)
			return true;
		else
			return false;
	}
}
