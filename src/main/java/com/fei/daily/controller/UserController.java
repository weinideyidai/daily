package com.fei.daily.controller;

import com.fei.daily.common.enums.ExceptionEnum;
import com.fei.daily.common.exception.MyException;
import com.fei.daily.common.utils.PageBean;
import com.fei.daily.model.pojo.Role;
import com.fei.daily.model.vo.PageVO;
import com.fei.daily.model.vo.UserVO;
import com.fei.daily.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public ModelAndView login(UserVO userVO){
        ModelAndView modelAndView = new ModelAndView();
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(userVO.getUsername(), userVO.getPassword());
        try {
            subject.login(usernamePasswordToken);
        }catch (Exception e){
            throw new MyException(ExceptionEnum.SERVER_CONGESTION);
        }
        modelAndView.setViewName("/pages/index.jsp");
        return modelAndView;
    }

    @RequestMapping("/save")
    public String save(UserVO userVO){
        userService.save(userVO);
        return "redirect:all";
    }

    @RequestMapping("/check/{data}/{type}")
    public ResponseEntity<Boolean> checkData(@PathVariable("data") String data , @PathVariable("type") Integer type){
        return ResponseEntity.ok(userService.checkData(data,type));
    }

    @RequestMapping("/all")
    public ModelAndView findAll(PageVO pageVO){
        PageBean list = userService.findAll(pageVO);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/pages/userall.jsp");
        modelAndView.addObject("list", list);
        return modelAndView;
    }

    @RequestMapping("/user")
    public ModelAndView findById(Integer id){
        UserVO userVO = userService.findById(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/pages/user.jsp");
        modelAndView.addObject("userVO", userVO);
        return modelAndView;
    }

    @RequestMapping("userAddRole")
    public ModelAndView findUserByidxAndRole(Integer id){
        //根据id查询用户信息
        UserVO userVO = userService.findById(id);
        //根据用户id查询可以增加的角色
        List<Role> otherRoles = userService.findOtherRoles(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/pages/userAddRole.jsp");
        modelAndView.addObject("userVO", userVO);
        modelAndView.addObject("otherRoles", otherRoles);
        return modelAndView;
    }

    @RequestMapping("/addRoleToUser")
    public String addRoleToUser(Integer uid , Integer[] rids){
        int[] rid = Arrays.stream(rids).mapToInt(Integer::valueOf).toArray();
        userService.addRoleToUser(uid,rid);
        return "redirect:all";
    }

    //注解验角色和权限
    @RequiresRoles("admin")
    @RequiresPermissions("add")
    @RequestMapping("/index")
    public String index() {
        return "index!";
    }
}
