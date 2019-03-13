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
import com.pojo.Score;
import com.pojo.User;

//Donot forget to close connection in each method
public class UserDao {

	String insertNewUser = "INSERT INTO student_details"
			+ "(`roll_number`,`first_name`,`last_name`,`dob`,`year_of_joining`,`semester`,`section`,`email`,`mobile_number`,`programme`,`branch`) VALUES"
			+ "(?,?,?,?,?,?,?,?,?,?,?)";
	
	String getMarks="SELECT * FROM score s left join subject sub on sub.subject_code=s.subject_id where s.roll_number=? AND s.semester=?";
	
	String updateUser="UPDATE student_details SET first_name=?,last_name=?,dob=?,year_of_joining=?,"
			+ "semester=?,section=?,email=?,mobile_number=?,programme=?,branch=? where roll_number=?";
	
	String insertLoginUser = "INSERT INTO login"
			+ "(`roll_user_number`,`password`,`login_status`) VALUES"
			+ "(?,?,?)";
	
	String getLoginUser="SELECT * FROM login where roll_user_number = ?";
	
	String getProgramme="SELECT * FROM programme";
	
	String getBranch="SELECT * FROM branch";
	
	
	String deleteUerLogin="delete from login where roll_user_number=?";
	String deleteUserScore="delete from score where roll_number=?";
	String deleteUserDetails="delete from student_details where roll_number=?";
	
	private String getUserDetails="Select * from student_details s left join login l on s.roll_number=l.roll_user_number "
			+ "left join branch b on s.branch=b.internal_id "
			+ "left join programme p on s.programme=p.internal_id where s.roll_number=?";
	
	public static void main(String[] args) {
			UserDao object;
			try {
				object = new UserDao();
				object.getConnection();
				object.getUserScore("0007cs13dd16",10);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			

	}

	public Connection conn=null;
	
	public void getConnection() throws ClassNotFoundException, SQLException, IOException{
		Properties prop = new Properties();
		InputStream input = null;
		input = getClass().getClassLoader().getResourceAsStream("application.properties");
		prop.load(input);			
		Class.forName("com.mysql.jdbc.Driver");			  
		conn = (Connection) DriverManager.getConnection(prop.getProperty("dburl"),prop.getProperty("user"),prop.getProperty("password")); 
		System.out.println("connection established");

	}
	
	public String getPassword(String rollNo) throws ClassNotFoundException, SQLException, IOException{
		getConnection();
		PreparedStatement preparedStatement = conn.prepareStatement(getLoginUser);
		preparedStatement.setString(1,rollNo);
		ResultSet rs = preparedStatement.executeQuery();
			
		while (rs.next()){
			String status = rs.getString("login_status");
			String password = rs.getString("password");
			preparedStatement.close();
			conn.close();
			if(status.equalsIgnoreCase(Constant.ACTIVE )||status.equals(Constant.ADMIN) || status.equalsIgnoreCase(Constant.SUSPENDED)){
				return password;
			}else{
				return Constant.INACTIVE;
			}
		}	
		preparedStatement.close();
		conn.close();
		return Constant.NOTFOUND;
	}
	
	// This function tells wheter user is active/inactive/admin/exist in our system
	public String checkUserStatus(String rollNo) throws SQLException, ClassNotFoundException, IOException{
		getConnection();
		PreparedStatement preparedStatement = conn.prepareStatement(getLoginUser);
		preparedStatement.setString(1,rollNo);
		ResultSet rs = preparedStatement.executeQuery();
			
		while (rs.next()){
			String status = rs.getString("login_status");
			preparedStatement.close();
			conn.close();
			if(status.equalsIgnoreCase(Constant.ACTIVE)){
				return Constant.ACTIVE;
			}else if(status.equalsIgnoreCase(Constant.ADMIN)){
				return Constant.ADMIN;
			}else if(status.equalsIgnoreCase(Constant.SUSPENDED)){
				return Constant.SUSPENDED;
			}else{
				return Constant.INACTIVE;
			}
		}	
		preparedStatement.close();
		conn.close();
		return Constant.NOTFOUND;
	}
	
	// This function is use to add User into our system 
	public boolean addUser(User user) throws SQLException, ClassNotFoundException, IOException{
		getConnection();
		int i=0;
		// Adding in Details Table
		PreparedStatement preparedStatement = conn.prepareStatement(insertNewUser);
		preparedStatement.setString(1,user.getRollNo());
		preparedStatement.setString(2,user.getFirstName());
		preparedStatement.setString(3,user.getLastName());
		preparedStatement.setString(4,user.getDob());
		preparedStatement.setInt(5,user.getYoj());
		preparedStatement.setInt(6,Integer.parseInt(user.getSem()));
		preparedStatement.setString(7,user.getSection());
		preparedStatement.setString(8,user.getEmail());
		preparedStatement.setString(9,user.getMobNum());
		preparedStatement.setInt(10,user.getProg());
		preparedStatement.setInt(11,user.getBranch());
		i= preparedStatement.executeUpdate();
		preparedStatement.close();
		
		// Adding in Login Table
		preparedStatement = conn.prepareStatement(insertLoginUser);
		preparedStatement.setString(1,user.getRollNo());
		preparedStatement.setString(2,user.getPsw());
		preparedStatement.setString(3,Constant.INACTIVE);
		i+= preparedStatement.executeUpdate();
		preparedStatement.close();
		conn.close();	
		if(i>1)
			return true;
		else
			return false;
	}
	
	public Map<Integer,String> getProgramme() throws ClassNotFoundException, SQLException, IOException{
		
		Map<Integer,String> m1 = new HashMap<Integer,String>(); 
		getConnection();
		PreparedStatement preparedStatement = conn.prepareStatement(getProgramme);
		ResultSet rs = preparedStatement.executeQuery();
		while(rs.next()){
			m1.put(rs.getInt(1),rs.getString(2));
		}
		conn.close();
		return m1;
	}
	
	public Map<Integer,String> getBranch() throws ClassNotFoundException, SQLException, IOException{
		
		Map<Integer,String> m1 = new HashMap<Integer,String>(); 
		getConnection();
		PreparedStatement preparedStatement = conn.prepareStatement(getBranch);
		ResultSet rs = preparedStatement.executeQuery();
		while(rs.next()){
			m1.put(rs.getInt(1),rs.getString(2));
		}
		conn.close();
		return m1;
	}
	
	public boolean updateUser(User user) throws ClassNotFoundException, SQLException, IOException{
		
		getConnection();
		PreparedStatement preparedStatement = conn.prepareStatement(updateUser);	
		preparedStatement.setString(1,user.getFirstName());
		preparedStatement.setString(2,user.getLastName());
		preparedStatement.setString(3,user.getDob());
		preparedStatement.setInt(4,user.getYoj());
		preparedStatement.setInt(5,Integer.parseInt(user.getSem()));
		preparedStatement.setString(6,user.getSection());
		preparedStatement.setString(7,user.getEmail());
		preparedStatement.setString(8,user.getMobNum());
		preparedStatement.setInt(9,user.getProg());
		preparedStatement.setInt(10,user.getBranch());
		preparedStatement.setString(11,user.getRollNo());
		int i= preparedStatement.executeUpdate();
		preparedStatement.close();
		conn.close();	
		if(i>=1)
			return true;
		else
			return false;
	}
	
	public boolean deleteUser(String roll_num) throws ClassNotFoundException, SQLException, IOException{
		
		getConnection();
		PreparedStatement preparedStatement = conn.prepareStatement(deleteUserScore);	
		preparedStatement.setString(1,roll_num);
		int i= preparedStatement.executeUpdate();
		
		preparedStatement = conn.prepareStatement(deleteUerLogin);	
		preparedStatement.setString(1,roll_num);
		i+= preparedStatement.executeUpdate();

		preparedStatement = conn.prepareStatement(deleteUserDetails);	
		preparedStatement.setString(1,roll_num);
		i+= preparedStatement.executeUpdate();
	
		preparedStatement.close();
		conn.close();	
		if(i>=2)
			return true;
		else
			return false;
	}
	public User getUserDetails(String rollNo) throws ClassNotFoundException, SQLException, IOException{
		User user = new User();
		getConnection();
		PreparedStatement preparedStatement = conn.prepareStatement(getUserDetails);
		preparedStatement.setString(1,rollNo);
		ResultSet rs = preparedStatement.executeQuery();
		while(rs.next()){
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
		}
		conn.close();
		return user;
	}

public List<Score> getUserScore(String rollNum,int sem) throws ClassNotFoundException, SQLException, IOException{
		System.out.println("rollNum DAO:"+rollNum);
		System.out.println("sem DAO:"+sem);
		List<Score> scores = new ArrayList<Score>();
		getConnection();
		PreparedStatement preparedStatement = conn.prepareStatement(getMarks);
		preparedStatement.setString(1,rollNum);
		preparedStatement.setInt(2,sem);
		ResultSet rs = preparedStatement.executeQuery();
		
		while(rs.next()){
			Score score = new Score();
			System.out.println("SCORE:"+rs.getInt(3));
			score.setRollNum(rs.getString(1));
			score.setSubject_code(rs.getString(2));
			score.setMarks(rs.getInt(3));
			score.setMidSemCount(rs.getInt(4));
			score.setSemester(rs.getInt(5));
			score.setSubject_name(rs.getString(7));
			scores.add(score);
		}
		conn.close();
		return scores;
	}
	
}
