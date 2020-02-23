package com.fei.daily.mapper.sqlProvider;

import com.fei.daily.model.vo.PageVO;
import org.springframework.util.StringUtils;

public class MessagerSqlProvider {
    public String findAllByPageAndGroup(PageVO pageVO){
        StringBuffer str = new StringBuffer("SELECT * FROM message where 1=1 ");
        if (!StringUtils.isEmpty(pageVO.getGroup())&&(!"全部".equals(pageVO.getGroup()))){
            str.append(" and `group` like  '%"+pageVO.getGroup()+"%'  ");
        }
        if (!StringUtils.isEmpty(pageVO.getKey())){
            str.append(" and name like  '%"+pageVO.getKey()+"%'  ");
        }
        if (!StringUtils.isEmpty(pageVO.getType())){
            str.append(" and type =" +pageVO.getType()+" ");
        }
        if (!StringUtils.isEmpty(pageVO.getSortBy())){
            StringBuffer stringBuffer = new StringBuffer(pageVO.isDesc()?"ASC":"DESC");
            str.append("ORDER BY "+ pageVO.getSortBy() + " "+stringBuffer);
        }
        return str.toString();
    }

}
