package com.fei.daily.service.impl;

import com.fei.daily.common.enums.ExceptionEnum;
import com.fei.daily.common.exception.MyException;
import com.fei.daily.common.utils.PageBean;
import com.fei.daily.mapper.MessageMapper;
import com.fei.daily.model.pojo.Message;
import com.fei.daily.model.pojo.SysLog;
import com.fei.daily.model.vo.PageVO;
import com.fei.daily.service.MessageService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class MessageServiceImpl implements MessageService {

    @Autowired
    MessageMapper messageMapper;

    @Override
    public PageBean  findAllByPageAndGroup(PageVO pageVO) {
        if (StringUtils.isEmpty(pageVO.getPage())){
            pageVO.setPage(1);
        }
        //分页
        PageHelper.startPage(pageVO.getPage(), 5);
        //查询
        List<Message> messageList = messageMapper.findAllByPageAndGroup(pageVO);

        PageInfo info = new PageInfo(messageList);

        PageBean pageBean = new PageBean();
        pageBean.setTotalCount((int) info.getTotal());
        pageBean.setCurrPage(pageVO.getPage());
        pageBean.setData(messageList);
        return pageBean;
    }

    @Override
    public void save(Message message) {
        message.setCreateTime(new Date());
        int i = messageMapper.save(message);
        if (i==0){
            throw new MyException(ExceptionEnum.INSERT_OPERATION_FAILED);
        }
    }

    @Override
    public void deletById(Integer id) {
        int i = messageMapper.deletById(id);
        if (i==0){
            throw new MyException(ExceptionEnum.ID_DOES_NOT_EXIST);
        }
    }
}
