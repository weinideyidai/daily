package com.fei.daily.model.vo;

import com.fei.daily.model.pojo.Permission;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoleVO {

    private int id;
    private String roleName;
    private String roleDesc;

    private List<Permission> permissions;
}
