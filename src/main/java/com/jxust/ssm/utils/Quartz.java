package com.jxust.ssm.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Quartz {
	public void work() {

		System.out.println("Quartz的任务调度！！！" + (new SimpleDateFormat("yyy-MM-dd HH:mm:ss").format(new Date())));
	}

	/**
	 * @param args
	 */
	@SuppressWarnings("resource")
	public static void main(String[] args) {
		System.out.println("Test start.");
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		// 如果配置文件中将startQuertz bean的lazy-init设置为false 则不用实例化
		context.getBean("myJob");
	}

}
