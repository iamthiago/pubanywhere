package com.pub.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;

@Configuration
@ComponentScan(value = "com.pub.config", excludeFilters = @Filter(type = FilterType.ASSIGNABLE_TYPE, value = RootConfig.class))
public class RootConfig {

}