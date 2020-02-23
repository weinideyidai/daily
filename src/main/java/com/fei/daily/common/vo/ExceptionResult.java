package com.fei.daily.common.vo;

import com.fei.daily.common.enums.ExceptionEnum;
import lombok.Data;

@Data
public class ExceptionResult {

    private int status;
    private String message;
    private Long timestamp;

    public ExceptionResult(ExceptionEnum em){
        this.status = em.getCode();
        this.message = em.getMsg();
        this.timestamp = System.currentTimeMillis();
    }
}
