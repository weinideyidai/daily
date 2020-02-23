package com.fei.daily.model.vo;

import com.fei.daily.model.pojo.Role;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserVO {

    private int id;
    private String username;
    private String password;
    private String phone;
    private Date created;
    private String salt;
    private int status;

    private String statusStr;

    private int group_id;

    private List<RoleVO> roles;

}
