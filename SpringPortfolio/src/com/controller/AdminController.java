package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.dao.AdminDao;
import com.pojo.Notification;


@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping(value="welcome")
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
	
}
