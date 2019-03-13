package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.constants.Constant;
import com.dao.AdminDao;
import com.dao.UserDao;
import com.pojo.Notification;
import com.pojo.User;

import org.springframework.ui.ModelMap;

@Controller
@RequestMapping("/")
public class CommonController{
	@RequestMapping(value="**/welcome")
	public String getWelcomePage(ModelMap model){
		List<Notification> listOfAllNotification ;
		AdminDao dao = new AdminDao();
		try {
			listOfAllNotification = dao.getAllNotification(true,false);
		} catch (ClassNotFoundException | SQLException | IOException e){
			e.printStackTrace();
			return "common/error";
		}
		model.addAttribute("listOfAllNotification",listOfAllNotification);
		return "common/welcome";
	}

	@RequestMapping(value="**/loginPage")
	public String getLoginPage(ModelMap model){
		Map<Integer,String> branchD;
		Map<Integer,String> programmeD;
		
		UserDao userdao = new UserDao();
		try {
			branchD = userdao.getBranch();
			programmeD=userdao.getProgramme();
		} catch (ClassNotFoundException | SQLException | IOException e){
			e.printStackTrace();
			return "common/error";
		}
		model.addAttribute("branchD",branchD);
		model.addAttribute("programmeD",programmeD);
		
		return "common/login";
	}
	
	@RequestMapping(value="**/registerUser",method=RequestMethod.POST)
	public ModelAndView addUser(HttpServletRequest request, HttpServletResponse response,
	@ModelAttribute("user") User user) {
		UserDao userdao = new UserDao();
		String status="";
		try {
			status = userdao.checkUserStatus(user.getRollNo());
			if(status.equals(Constant.NOTFOUND)){
				System.out.println(userdao.addUser(user));
			}else{
				System.out.println(status);
				return new ModelAndView("common/already","status",status);
			}
		} catch (ClassNotFoundException | SQLException | IOException e) {
			e.printStackTrace();
			return new ModelAndView("common/error");			
		}
		return new ModelAndView("common/thankyou");
	}
	
	@RequestMapping(value="**/login", method=RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "rollnumber", required = true) String rollnumber,
			@RequestParam(value = "userPassword", required = true) String userPassword){
		
		User user = new User();
		String status="";
		if(rollnumber.trim().equals("")){
			return new ModelAndView("common/error");
		}
		
		UserDao ud = new UserDao();
		String password;
		String role;
		try {
			password = ud.getPassword(rollnumber);
			role=ud.checkUserStatus(rollnumber);
			System.out.println("Pasword :"+password);
			System.out.println("Role :"+role);	
		} catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("common/error");	
		}	
		
		if(password.equals(userPassword)){
			ModelAndView modelAndView = new ModelAndView();
			user.setRollNo(rollnumber);
			(request.getSession()).setAttribute("USER", user);
			if(role.equals(Constant.ADMIN)){
				status=Constant.ADMIN;
				modelAndView.setViewName("/admin/dashboard");
				modelAndView.addObject("status",status);
			    modelAndView.addObject("USER", user);		    
			    return modelAndView;
			}else{
				status=Constant.SUCCESS;
				modelAndView.setViewName("redirect:/student/studentDashboard");
				modelAndView.addObject("status",status);
				modelAndView.addObject("USER", user);	    
			    return modelAndView;
			}
			
		}else if(password.equals(Constant.NOTFOUND)){
			status=Constant.NOTFOUND;
		}else if(password.equals(Constant.INACTIVE)){
			status=Constant.INACTIVE;
		}else{
			status=Constant.INCORRECT;
		}
		
		return new ModelAndView("common/already","status",status);
	}
	
	@RequestMapping(value="**/logout")
	public ModelAndView logout(){	
		return new ModelAndView("redirect:/loginPage");
	}
}