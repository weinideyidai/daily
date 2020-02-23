package com.fei.daily.common.advice;

import com.fei.daily.common.enums.ExceptionEnum;
import com.fei.daily.common.exception.MyAuthorizationException;
import com.fei.daily.common.exception.MyException;
import com.fei.daily.common.vo.ExceptionResult;
import org.apache.shiro.authz.AuthorizationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
public class CommonExceptionHandler {

    @ExceptionHandler(MyException.class)
    public ResponseEntity<ExceptionResult> handleExcption(MyException e){
        return ResponseEntity.status(e.getExceptionEnum().getCode()).body(new ExceptionResult(e.getExceptionEnum()));
    }

    @ExceptionHandler
    @ResponseBody
    public String ErrorHandler(AuthorizationException e) {
        return "没有通过权限验证！";
    }
}
