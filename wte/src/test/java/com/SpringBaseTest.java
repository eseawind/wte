package com;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.app.common.base.action.LoginAction;

/**
 * 因为在base的model文件夹不一样，所以扫描的数据库路径不一样，所以无法测试baseDaoTarget,
 * 但是可以测试 菜单和登录
 * */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-base.xml")
public class SpringBaseTest  {
	static Logger log = LoggerFactory.getLogger(SpringBaseTest.class);
	@Autowired
	private LoginAction loginAction;
	

	@Test
	public void login() throws Exception {
		log.debug("登录" + loginAction);
		loginAction.execute();
	}

	



}
