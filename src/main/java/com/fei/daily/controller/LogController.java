package com.fei.daily.controller;

import com.fei.daily.common.utils.PageBean;
import com.fei.daily.common.utils.PageResult;
import com.fei.daily.model.pojo.SysLog;
import com.fei.daily.model.vo.PageVO;
import com.fei.daily.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("log")
public class LogController {

    @Autowired
    private LogService logService;

    @RequestMapping("findAll")
    public ModelAndView findAll(){
        List<SysLog> logs= logService.findAll();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("logs",logs);
        modelAndView.setViewName("sysLog");
        return modelAndView;
    }

    @RequestMapping("deletById")
    public String deletById(Integer id){
        logService.deletById(id);
        return "redirect:findAllByPage";
    }

    @RequestMapping("findAllByPage")
    public ModelAndView findAllByPage(PageVO pageVO){
        ModelAndView modelAndView = new ModelAndView();
        PageBean sysLogPage = logService.findAllByPage(pageVO);
        modelAndView.addObject("sysLogPage",sysLogPage);
        modelAndView.setViewName("/pages/sysLogPage.jsp");
        return modelAndView;
    }
}
