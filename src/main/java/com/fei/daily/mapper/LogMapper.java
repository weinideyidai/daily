package com.fei.daily.mapper;

import com.fei.daily.mapper.sqlProvider.LogSqlProvider;
import com.fei.daily.model.pojo.SysLog;
import com.fei.daily.model.vo.PageVO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;

import java.util.List;

public interface LogMapper {

    @Insert("INSERT INTO syslog(visitTime,username,ip,url,executionTime,method)  " +
            "VALUES(#{visitTime},#{username},#{ip},#{url},#{executionTime},#{method})")
    int save(SysLog sysLog);

    @Select("select * from syslog")
    List<SysLog> findAll();

    @Delete("DELETE FROM syslog WHERE id = #{id} ")
    int deletById(Integer id);

    @SelectProvider(type = LogSqlProvider.class,method = "findAllByPage")
    List<SysLog> findAllByPage(PageVO pageVO);
}
