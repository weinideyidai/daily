package com.fei.daily.service.impl;

import com.fei.daily.common.enums.ExceptionEnum;
import com.fei.daily.common.exception.MyException;
import com.fei.daily.common.utils.PageBean;
import com.fei.daily.mapper.LogMapper;
import com.fei.daily.model.pojo.SysLog;
import com.fei.daily.model.vo.PageVO;
import com.fei.daily.service.LogService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.List;

@Service
@Transactional
public class LogServiceImpl implements LogService {

    @Autowired
    LogMapper logMapper;

    @Override
    public void save(SysLog sysLog) {
        int i = logMapper.save(sysLog);
        if (i==0) {
            throw new MyException(ExceptionEnum.SERVER_CONGESTION);
        }
    }

    @Override
    public List<SysLog> findAll() {
        List<SysLog> logs = logMapper.findAll();
        if (CollectionUtils.isEmpty(logs)){
            throw new MyException(ExceptionEnum.SERVER_CONGESTION);
        }
        return logs;
    }

    @Override
    public void deletById(Integer id) {
        int i = logMapper.deletById(id);
        if (i==0){
            throw new MyException(ExceptionEnum.ID_DOES_NOT_EXIST);
        }
    }

    @Override
    public PageBean findAllByPage(PageVO pageVO) {
        if (StringUtils.isEmpty(pageVO.getPage())){
            pageVO.setPage(1);
        }
        //分页
        PageHelper.startPage(pageVO.getPage(), 5);
        //查询
        List<SysLog> logList = logMapper.findAllByPage(pageVO);

        PageInfo info = new PageInfo(logList);

        PageBean pageBean = new PageBean();
        pageBean.setTotalCount((int) info.getTotal());
        pageBean.setCurrPage(pageVO.getPage());
        pageBean.setData(logList);

        return pageBean;
    }
}
