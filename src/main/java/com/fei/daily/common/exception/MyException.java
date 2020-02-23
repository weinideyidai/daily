package com.fei.daily.common.exception;

import com.fei.daily.common.enums.ExceptionEnum;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
public class MyException extends RuntimeException {

    private ExceptionEnum exceptionEnum;

}
