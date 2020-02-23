package com.fei.daily.common.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public enum ExceptionEnum {

    ID_CANNOT_BY_NULL(400,"id不能为空"),
    NAME_CANNOT_BY_NULL(400,"名字不能为空"),
    USER_NAME_IS_DISABLED(400,"用户名被禁用"),
    INSERT_OPERATION_FAILED(400,"插入操作失败"),
    INCORRECT_TYPE(400,"类型不正确"),
    SERVER_CONGESTION(400,"服务出错"),
    ID_DOES_NOT_EXIST(400,"id不存在");

    private int code;
    private String msg;
}
