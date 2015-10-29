package com.demo.ssh.test;

import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.demo.ssh.entity.Blog;
import com.demo.ssh.entity.User;
import com.demo.ssh.service.UserService;
import com.nick.page.pageutil.Page;
import com.nick.page.pageutil.PageUtil;
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
	
	@Test
	public void testClassName() throws Exception {
		getClassName(UnitTest.class);
	}
	
	private void getClassName(Class clz){
		System.out.println(clz.getSimpleName());
	}
	
	@Test
	public void testIp() throws Exception {
		String ip = "192.168.1.102";
		ip = ip.replace(".", "");
		System.out.println("----------------- "+ip);
	}
	
	@Test
	public void testPage() throws Exception {
		Page<Blog> p = new Page<Blog>();
		p.setCurrentPage(1);
		p.setPageSize(4);
		String hql = "from Blog b where b.user.id = 5";
		p.setCustomizedHql(hql);
		PageUtil<Blog> util = new PageUtil<Blog>();
		Page<Blog> page = util.selectByPage(p, Blog.class);
		System.out.println(page);
		List<Blog> rows = page.getRows();
	}
}
