package com.fei.daily.service;

import com.fei.daily.common.utils.PageBean;
import com.fei.daily.model.pojo.Message;
import com.fei.daily.model.vo.PageVO;

public interface MessageService {

    PageBean findAllByPageAndGroup(PageVO pageVO);

    void save(Message message);

    void deletById(Integer id);
}
