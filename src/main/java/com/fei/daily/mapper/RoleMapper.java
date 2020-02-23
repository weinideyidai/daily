package com.fei.daily.mapper;

import com.fei.daily.model.pojo.Permission;
import com.fei.daily.model.pojo.Role;
import com.fei.daily.model.vo.RoleVO;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface RoleMapper {

    @Select("select * from role where id in(select roleId from user_role where userId = #{userId})")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "roleName",column = "roleName"),
            @Result(property = "roleDesc",column = "roleDesc"),
            @Result(property = "permissions",column = "id",javaType = java.util.List.class,many = @Many(select = "com.fei.daily.mapper.PermissionMapper.findPermissionByRoleId"))
    })
    List<RoleVO> findRoleByUserId(int userId);

    @Select("select * from role")
    List<RoleVO> findAll();

    @Insert("insert into role(roleName,roleDesc) values(#{roleName},#{roleDesc})")
    int save(Role role);

    @Select("SELECT COUNT(*) FROM `role`")
    int findRoleCount();

    @Select("select * from permission where id not in (select permissionId from role_permission where roleId =#{id})")
    List<Permission> findOtherPermission(int id);

    @Insert("insert into role_permission(permissionId,roleId) values(#{pid},#{rid})")
    int addPermissionToRole(@Param("rid") int rid, @Param("pid") int pid);

    @Select("select * from role where id = #{id}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "roleName",column = "roleName"),
            @Result(property = "roleDesc",column = "roleDesc"),
            @Result(property = "permissions",column = "id",javaType = java.util.List.class,many = @Many(select = "com.fei.daily.mapper.PermissionMapper.findPermissionByRoleId"))
    })
    RoleVO findById(int id);
}
