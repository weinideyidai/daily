package com.fei.daily.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageVO {

    private Integer page;
    private Integer rows;
    private String sortBy;
    private boolean desc;
    private String key;

    private String group;
    private Date time;
    private Integer type;

}
