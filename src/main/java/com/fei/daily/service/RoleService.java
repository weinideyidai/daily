package com.fei.daily.service;

import com.fei.daily.model.pojo.Permission;
import com.fei.daily.model.pojo.Role;
import com.fei.daily.model.vo.RoleVO;

import java.util.List;

public interface RoleService {

    List<RoleVO> findAll();

    int save(Role role);

    List<Permission> findOtherPermission(int id);

    void addPermissionToRole(int rid, int[] pids);

    RoleVO findById(int id);
}
