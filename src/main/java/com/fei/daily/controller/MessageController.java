package com.fei.daily.controller;

import com.fei.daily.common.utils.PageBean;
import com.fei.daily.model.pojo.Message;
import com.fei.daily.model.vo.PageVO;
import com.fei.daily.model.vo.UserVO;
import com.fei.daily.service.MessageService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/message")
public class MessageController {

    @Autowired
    MessageService messageService;

    @RequestMapping("/findByPageAndGroup")
    public ModelAndView findAllByPageAndGroup(PageVO pageVO) {
        ModelAndView modelAndView = new ModelAndView();
        PageBean messagePageBean = messageService.findAllByPageAndGroup(pageVO);
        modelAndView.setViewName("/pages/messagePageBean.jsp");
        modelAndView.addObject("messagePageBean", messagePageBean);
        return modelAndView;
    }

    @RequestMapping("/save")
    public String save(Message message){
        messageService.save(message);
        return "redirect:findByPageAndGroup";
    }

    @RequestMapping("/deletById")
    @RequiresPermissions("删除")
    public String deletById(Integer id){
        messageService.deletById(id);
        return "redirect:findByPageAndGroup";
    }
}
