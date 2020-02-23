package com.fei.daily.service;

import com.fei.daily.common.utils.PageBean;
import com.fei.daily.model.pojo.Role;
import com.fei.daily.model.pojo.User;
import com.fei.daily.model.vo.PageVO;
import com.fei.daily.model.vo.UserVO;

import java.util.List;

public interface UserService {

     UserVO getUserByName(String name);

     int save(UserVO user);

     boolean checkData(String data, Integer type);

     PageBean findAll(PageVO pageVO);

     UserVO findById(int id);

     List<Role> findOtherRoles(int id);

     void addRoleToUser(int uid, int[] rids);
}
