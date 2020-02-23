package com.fei.daily.service.impl;

import com.fei.daily.common.enums.ExceptionEnum;
import com.fei.daily.common.exception.MyException;
import com.fei.daily.mapper.RoleMapper;
import com.fei.daily.model.pojo.Permission;
import com.fei.daily.model.pojo.Role;
import com.fei.daily.model.vo.RoleVO;
import com.fei.daily.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.List;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public List<RoleVO> findAll() {
        List<RoleVO> all = roleMapper.findAll();
        return all;
    }

    @Override
    public int save(Role role) {
        int save = roleMapper.save(role);
        if (save==0){
            throw new MyException(ExceptionEnum.INSERT_OPERATION_FAILED);
        }
        return save;
    }

    @Override
    public List<Permission> findOtherPermission(int id) {
        List<Permission> list = roleMapper.findOtherPermission(id);
        return list;
    }

    @Override
    public void addPermissionToRole(int rid, int[] pids) {
        for (int pid : pids){
            int i = roleMapper.addPermissionToRole(rid,pid);
            if (i==0) throw new MyException(ExceptionEnum.INSERT_OPERATION_FAILED);
        }
    }

    @Override
    public RoleVO findById(int id) {
        RoleVO roleVO = roleMapper.findById(id);
        return roleVO;
    }
}
