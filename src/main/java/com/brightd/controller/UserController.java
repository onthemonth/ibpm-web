package com.brightd.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.demo.service.DemoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@RequestMapping("/showUser")
	public String toIndex(HttpServletRequest request,Model model){
        User user = new User();
        user.setUserName("testuser");
        model.addAttribute("user", user);
		return "showUser";
	}
}
