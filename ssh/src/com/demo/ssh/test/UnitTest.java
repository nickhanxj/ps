package com.demo.ssh.test;

import org.apache.commons.codec.digest.DigestUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.demo.ssh.entity.User;
import com.demo.ssh.service.UserService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")
public class UnitTest {
	@Autowired
	private UserService userService;
	
	@Test
	public void testAddUser() throws Exception {
		User user = new User();
		user.setUserName("admin");
		user.setPassword("admin");
		user.setEmail("admin@admin.com");
		user.setPhoneNumber("15648795247");
		user.setSex(1);
		userService.addUser(user);
	}
	
	@Test
	public void testByte() throws Exception {
		String s = "这是一个简单的字符串！";
		byte[] bytes = s.getBytes();
		System.out.println(bytes);
		System.out.println(new String(bytes));
	}
	
	@Test
	public void testMd5() throws Exception {
		String pwd = "qwertty";
		String md5Hex = DigestUtils.md5Hex(pwd);
		System.out.println(md5Hex);
		System.out.println(DigestUtils.md5Hex("qwertyy"));
	}
}
