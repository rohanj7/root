package com.controller;


import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import com.dao.AdminDao;
import com.dao.UserDao;
import com.pojo.Notification;
import com.pojo.Score;
import com.pojo.User;

@Controller
@RequestMapping("/student")
public class StudentController {
	List<Notification> listOfAllNotification ;
	List<Score> scores ;
	Map<Integer,String> branchD;
	Map<Integer,String> programmeD;
	String serverStatus;
	String ServerResponseMessage;
	
	@RequestMapping(value="/studentDashboard")
	public ModelAndView getStudentDashboard(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "semFiter",required = false) String semFiter) {
		HttpSession session=request.getSession(false);
		ModelAndView mav=new ModelAndView();
		UserDao userdao = new UserDao();
		User usr1=(User) session.getAttribute("USER");
		System.out.println(usr1);
		System.out.println(usr1.getRollNo());
		AdminDao dao = new AdminDao();
		userdao= new UserDao();
		try {
			branchD=userdao.getBranch();
			programmeD=userdao.getProgramme();
			listOfAllNotification=dao.getAllNotification(false,true);
			usr1=userdao.getUserDetails(usr1.getRollNo());	
			if(semFiter=="" || semFiter==null){
				semFiter=usr1.getSem();
			}
			System.out.println("sem :" +semFiter);
			System.out.println("sem user:" +usr1.getSem());
			scores=userdao.getUserScore(usr1.getRollNo(),Integer.parseInt(semFiter));
			session.removeAttribute("USER");
			session.setAttribute("USER",usr1);
		} catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("common/error");
		}
		mav.setViewName("student/studentHome");
		mav.addObject("branchD",branchD);
		mav.addObject("programmeD",programmeD);
		mav.addObject("listOfAllNotification",listOfAllNotification);
		mav.addObject("scores",scores);
		mav.addObject("semFiter",semFiter);
		mav.addObject("user",usr1);
		return mav;
	}
		
}
