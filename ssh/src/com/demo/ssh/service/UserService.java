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
	
	public boolean validateBaseInfo(String email, String phone, String trueName){
		return userDao.validateBaseInfo(email, phone, trueName);
	}
	
	public User getUserByEmail(String email){
		return userDao.getUserByEmail(email);
	}
	
	//�ж��û����Ƿ����
	public boolean hasExist(String userName){
		User u = userDao.getByName(userName);
		if(u != null){
			return true;
		}
		return false;
	}
	
	public boolean trueNameHasExist(String trueName){
		return userDao.trueNameHasExist(trueName);
	}
	
	//�û���¼��Ȩ
	public User authUser(User user){
		return userDao.getUserByCondition(user);
	}
}
