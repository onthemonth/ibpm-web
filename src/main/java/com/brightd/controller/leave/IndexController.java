package com.brightd.controller.leave;

import com.brightd.controller.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/leave")
public class IndexController {

	@RequestMapping("/index")
	public ModelAndView toIndex(HttpServletRequest request,Model model){
        ModelAndView view = new ModelAndView("leave/login");
		return view;
	}
    //登录页面
    @RequestMapping("/login")
    public ModelAndView login(HttpSession httpSession,Model model,@ModelAttribute("SpringWeb")User user){
        String userName = user.getUserName();
        String password = user.getPassword();
        ModelAndView mv = new ModelAndView("redirect:/leave/index");
        if(!"654321".equals(password)){
            return mv;
        }
        if("krisv".equals(userName)){
            //员工申请页面
            mv= new ModelAndView("redirect:/leave/applyList");
        }else if("marry".equals(userName) || "john".equals(userName)){
            //经理老板审核页面
            mv= new ModelAndView("redirect:/leave/taskList");
        }

        httpSession.setAttribute("user", user);
        return mv;
    }

    @RequestMapping("/logout")
    public ModelAndView login(HttpSession httpSession){
        httpSession.setAttribute("user", null);
        ModelAndView view = new ModelAndView("leave/login");
        return view;
    }
}
