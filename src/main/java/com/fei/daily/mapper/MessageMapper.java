package com.fei.daily.mapper;

import com.fei.daily.mapper.sqlProvider.LogSqlProvider;
import com.fei.daily.mapper.sqlProvider.MessagerSqlProvider;
import com.fei.daily.model.pojo.Message;
import com.fei.daily.model.vo.PageVO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.SelectProvider;

import java.util.List;

public interface MessageMapper {

    @SelectProvider(type = MessagerSqlProvider.class,method = "findAllByPageAndGroup")
    List<Message> findAllByPageAndGroup(PageVO pageVO);

    @Insert("insert into message(createTime,`group`,`name`,content,difficulty,way,experience,plan,type) "+
            "value(#{createTime},#{group},#{name},#{content},#{difficulty},#{way},#{experience},#{plan},#{type})")
    int save(Message message);

    @Delete("DELETE FROM message WHERE id = #{id} ")
    int deletById(Integer id);
}
