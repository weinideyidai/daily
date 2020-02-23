package com.fei.daily.controller;

import com.fei.daily.model.pojo.Permission;
import com.fei.daily.model.pojo.Role;
import com.fei.daily.model.vo.RoleVO;
import com.fei.daily.model.vo.UserVO;
import com.fei.daily.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @RequestMapping("/all")
    public ModelAndView findAll(){
        List<RoleVO> roleVOList = roleService.findAll();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("roleVOList", roleVOList);
        modelAndView.setViewName("/pages/roleVOList.jsp");
        return modelAndView;
    }

    @RequestMapping("/save")
    public String save(Role role){
        roleService.save(role);
        return "redirect:all";
    }

    @RequestMapping("/roleAddPermission")
    public ModelAndView findRoleByIdAndAllPermission(Integer id){
        RoleVO roleVO = roleService.findById(id);
        List<Permission> otherPermission = roleService.findOtherPermission(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("roleVO", roleVO);
        modelAndView.addObject("otherPermission", otherPermission);
        modelAndView.setViewName("/pages/otherPermission.jsp");
        return modelAndView;
    }

    @RequestMapping("/addPermissionToRole")
    public String addPermissionToRole(Integer rid , Integer[] pids){
        int[] pid = Arrays.stream(pids).mapToInt(Integer::valueOf).toArray();
        roleService.addPermissionToRole(rid,pid);
        return "redirect:all";
    }

    @RequestMapping("findRole")
    public ModelAndView findById(Integer id){
        RoleVO roleVO = roleService.findById(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/pages/role.jsp");
        modelAndView.addObject("roleVO", roleVO);
        return modelAndView;
    }
 }
