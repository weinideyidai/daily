package com.fei.daily.service;

import com.fei.daily.model.pojo.Permission;

import java.util.List;

public interface PermissionService {

    List<Permission> findAll();

    int save(Permission permission);
}
