package com.fei.daily.service;

import com.fei.daily.common.utils.PageBean;
import com.fei.daily.common.utils.PageResult;
import com.fei.daily.model.pojo.SysLog;
import com.fei.daily.model.vo.PageVO;

import java.util.List;

public interface LogService {

    void  save(SysLog sysLog);

    List<SysLog> findAll();

    void deletById(Integer id);

    PageBean findAllByPage(PageVO pageVO);
}
