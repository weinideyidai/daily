package com.fei.daily;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@MapperScan("com.fei.daily.mapper")
@SpringBootApplication
@EnableTransactionManagement(proxyTargetClass = true)
public class DailyApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(DailyApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(DailyApplication.class);
    }
}
