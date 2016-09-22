package com.momolela.core;

import com.momolela.core.interceptor.TZRequestMethod;

/**
 * 
 * @ClassName: Method
 * @Description: 自定义注解
 * @author: momolela
 * @date 2016-5-12 下午5:05:44
 * 
 */
@java.lang.annotation.Documented
@java.lang.annotation.Retention(value=java.lang.annotation.RetentionPolicy.RUNTIME)
@java.lang.annotation.Target(value={java.lang.annotation.ElementType.METHOD})
public @interface Method {
	public String value() default "";
	public abstract TZRequestMethod[] method() default {};
}
