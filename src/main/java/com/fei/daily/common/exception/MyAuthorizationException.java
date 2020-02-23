package com.fei.daily.common.exception;

import com.fei.daily.common.enums.ExceptionEnum;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.apache.shiro.authz.AuthorizationException;

@AllArgsConstructor
@NoArgsConstructor
@Getter
public class MyAuthorizationException extends AuthorizationException {

    private ExceptionEnum exceptionEnum;
}
