package com.demo.ssh.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.demo.ssh.dao.UserDao;
import com.demo.ssh.entity.User;

@Transactional
@Service
public class UserService {
	@Resource
	private UserDao userDao;
	
	public void addUser(User user){
		userDao.addUser(user);
	}
	
	public void updateUser(User user){
		userDao.updateUser(user);
	}
	
	public User getUserByid(String id){
		return userDao.selectUserById(id);
	}
	
	public User getUserByName(String userName){
		return userDao.getByName(userName);
	}
	
	//�ж��û����Ƿ����
	public boolean hasExist(String userName){
		User user = new User();
		user.setUserName(userName);
		User u = userDao.getUserByCondition(user);
		if(u != null){
			return true;
		}
		return false;
	}
	
	//�û���¼��Ȩ
	public User authUser(User user){
		return userDao.getUserByCondition(user);
	}
}
