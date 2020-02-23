package com.fei.daily.service.impl;

import com.fei.daily.common.enums.ExceptionEnum;
import com.fei.daily.common.exception.MyException;
import com.fei.daily.common.utils.PageBean;
import com.fei.daily.mapper.RoleMapper;
import com.fei.daily.mapper.UserMapper;
import com.fei.daily.model.pojo.Role;
import com.fei.daily.model.pojo.SysLog;
import com.fei.daily.model.vo.PageVO;
import com.fei.daily.model.vo.UserVO;
import com.fei.daily.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public UserVO getUserByName(String name){
        UserVO userVO = userMapper.getUserByName(name);
        if (StringUtils.isEmpty(userVO)){
            throw new MyException(ExceptionEnum.NAME_CANNOT_BY_NULL);
        }
        if (userVO.getStatus()==0){
            throw new MyException(ExceptionEnum.USER_NAME_IS_DISABLED);
        }
        return userVO;
    }

    @Override
    public int save(UserVO userVO) {
        ByteSource salt = ByteSource.Util.bytes(userVO.getUsername());
        String md5 = new SimpleHash("MD5", userVO.getPassword(), salt, 1024).toHex();
        userVO.setPassword(md5);
        userVO.setCreated(new Date());
        userVO.setStatus(1);
        int save = userMapper.save(userVO);
        if (save==0){
            throw new MyException(ExceptionEnum.INSERT_OPERATION_FAILED);
        }
        return save;
    }

    @Override
    public boolean checkData(String data, Integer type) {
        UserVO userVO;
        switch (type){
            case 1:
                userVO = userMapper.getUserByName(data);
                return StringUtils.isEmpty(userVO);
            case 2:
                userVO = userMapper.getUserByPhone(data);
                return StringUtils.isEmpty(userVO);
            default:
                throw new MyException(ExceptionEnum.INCORRECT_TYPE);
        }
    }

    @Override
    public PageBean findAll(PageVO pageVO) {

        if (StringUtils.isEmpty(pageVO.getPage())){
            pageVO.setPage(1);
        }
        //分页
        PageHelper.startPage(pageVO.getPage(), 5);
        //查询
        List<UserVO> logList = userMapper.findAll(pageVO);

        PageInfo info = new PageInfo(logList);

        PageBean pageBean = new PageBean();
        pageBean.setTotalCount((int) info.getTotal());
        pageBean.setCurrPage(pageVO.getPage());
        pageBean.setData(logList);

        return pageBean;
    }

    @Override
    public UserVO findById(int id) {
        UserVO userVO = userMapper.findUserById(id);
        return userVO;
    }

    @Override
    public List<Role> findOtherRoles(int id) {
        List<Role> otherRoles = userMapper.findOtherRoles(id);
        return otherRoles;
    }

    @Override
    public void addRoleToUser(int uid, int[] rids) {
        for (int rid : rids){
            int i = userMapper.addRoleToUser(uid, rid);
            if (i==0) throw new MyException(ExceptionEnum.INSERT_OPERATION_FAILED);
        }
    }
}
