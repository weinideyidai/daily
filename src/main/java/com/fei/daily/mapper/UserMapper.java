package com.fei.daily.mapper;

import com.fei.daily.mapper.sqlProvider.LogSqlProvider;
import com.fei.daily.mapper.sqlProvider.UserSqlProvider;
import com.fei.daily.model.pojo.Role;
import com.fei.daily.model.pojo.User;
import com.fei.daily.model.vo.PageVO;
import com.fei.daily.model.vo.UserVO;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface UserMapper {

    @Select("select * from user where username = #{username}")
    @Results({
           @Result(id = true,property = "id",column = "id"),
           @Result(property = "username",column = "username"),
           @Result(property = "password",column = "password"),
           @Result(property = "phone",column = "phone"),
           @Result(property = "created",column = "created"),
           @Result(property = "salt",column = "salt"),
           @Result(property = "status",column = "status"),
           @Result(property = "group_id",column = "group_id"),
           @Result(property = "roles",column = "id",javaType = java.util.List.class,many = @Many(select = "com.fei.daily.mapper.RoleMapper.findRoleByUserId"))
    })
    UserVO getUserByName(String username);

    @Insert("insert into user(username,password,phone,created,status,group_id) " +
            "value(#{username},#{password},#{phone},#{created},#{status},#{group_id})")
    int save(UserVO user);

    @Select("select * from user where phone = #{phone}")
    UserVO getUserByPhone(String phone);

    @SelectProvider(type = UserSqlProvider.class,method = "findAll")
    List<UserVO> findAll(PageVO pageVO);

    @Select("select * from user where id = #{id}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "username",column = "username"),
            @Result(property = "password",column = "password"),
            @Result(property = "phone",column = "phone"),
            @Result(property = "created",column = "created"),
            @Result(property = "salt",column = "salt"),
            @Result(property = "status",column = "status"),
            @Result(property = "group_id",column = "group_id"),
            @Result(property = "roles",column = "id",javaType = java.util.List.class,many = @Many(select = "com.fei.daily.mapper.RoleMapper.findRoleByUserId"))
    })
    UserVO findUserById(int id);

    @Select("select * from role where id not in (select roleId from user_role where userId = #{id})")
    List<Role> findOtherRoles(int id);

    @Insert("insert into user_role(userId,roleId) values(#{uid},#{rid})")
    int addRoleToUser(@Param("uid") int uid, @Param("rid") int rid);
}
