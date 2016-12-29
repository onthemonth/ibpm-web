package com.brightd.controller.leave;

import com.brightd.controller.User;
import com.brightd.domain.bpm.leave.LeaveAppTaskDto;
import com.brightd.service.leave.ILeaveAppService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/leave")
public class TaskController {
    public final static  String SUCCESS="success";
    public final static  String ERROR="error";

    @Resource
    private ILeaveAppService leaveAppService;

    @RequestMapping("/addTask")
    public ModelAndView addTask(HttpSession httpSession,@ModelAttribute("SpringWeb")LeaveAppTaskDto leaveAppTaskDto,Model model){
        User user = (User)httpSession.getAttribute("user");
        //leaveAppTaskDto.setEmployee(user.getUserName());
        ModelAndView view = new ModelAndView("redirect:/leave/applyList");

        leaveAppService.addTask(user.getUserName(),leaveAppTaskDto);

        return view;
    }
    //申请列表
    @RequestMapping("/applyList")
    public ModelAndView applyList(HttpSession httpSession, Model model){
        ModelAndView view = new ModelAndView("leave/apply");

        User user = (User)httpSession.getAttribute("user");
        List<LeaveAppTaskDto> tasksList = leaveAppService.listTasksByUserId(user.getUserName());
        view.addObject("taskList",tasksList);
        return view;
    }
    //确认申请方法
    @RequestMapping("/apply")
    @ResponseBody
    public Map listTasks(HttpSession httpSession,String taskId){
        HashMap<Object,String> map=new HashMap<Object,String>();
        User user = (User)httpSession.getAttribute("user");
        leaveAppService.apply(user.getUserName(),Long.parseLong(taskId));
        if(null!=taskId){
            map.put("info",SUCCESS);

        }else {
            map.put("info",ERROR);
        }
        return map;
    }


    //任务列表
    @RequestMapping("/taskList")
    public ModelAndView taskList(HttpSession httpSession,Model model) {
        ModelAndView view = new ModelAndView("leave/tasklist");
        User user = (User)httpSession.getAttribute("user");
        List<LeaveAppTaskDto> tasksList = leaveAppService.listTasksByUserId(user.getUserName());
        view.addObject("taskList",tasksList);
        return view;
    }

    //确认审核方法
    @RequestMapping("/approveTask")
    @ResponseBody
    public Map apply(HttpServletRequest request,String taskId){
        HashMap<Object,String> map=new HashMap<Object,String>();
        if(null!=taskId){
            map.put("info",SUCCESS);

        }else {
            map.put("info",ERROR);
        }
        return map;
    }

}
