package com.brightd.controller.leave;

import com.brightd.controller.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/leave")
public class IndexController {
	
	@RequestMapping("/index")
	public ModelAndView toIndex(HttpServletRequest request,Model model){
        User user = new User();
        user.setUserName("testuser");
        model.addAttribute("user", user);
        ModelAndView view = new ModelAndView("leave/login");
		return view;
	}
}
