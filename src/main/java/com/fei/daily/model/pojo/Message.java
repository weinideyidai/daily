package com.fei.daily.model.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Message {

    private int id;
    private Date createTime;
    private String group;
    private String name;
    private String content;
    private String difficulty;
    private String way;
    private String experience;
    private String plan;
    private int type;
    private int userId;
}
