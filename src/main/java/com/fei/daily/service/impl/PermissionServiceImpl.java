package com.fei.daily.service.impl;

import com.fei.daily.common.enums.ExceptionEnum;
import com.fei.daily.common.exception.MyException;
import com.fei.daily.mapper.PermissionMapper;
import com.fei.daily.model.pojo.Permission;
import com.fei.daily.model.vo.RoleVO;
import com.fei.daily.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.List;

@Service
@Transactional
public class PermissionServiceImpl implements PermissionService {

    @Autowired
    PermissionMapper permissionMapper;

    @Override
    public List<Permission> findAll() {
        List<Permission> all = permissionMapper.findAll();
        return all;
    }

    @Override
    public int save(Permission permission) {
        int save = permissionMapper.save(permission);
        if (save==0){
            throw new MyException(ExceptionEnum.INSERT_OPERATION_FAILED);
        }
        return save;
    }
}
