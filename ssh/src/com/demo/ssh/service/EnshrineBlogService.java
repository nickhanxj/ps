package com.demo.ssh.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.demo.ssh.dao.EnshrineBlogDao;
import com.demo.ssh.entity.EnshrineBlog;

@Service
@Transactional
public class EnshrineBlogService {
	@Resource
	private EnshrineBlogDao dao;
	
	public void saveEnshrine(EnshrineBlog enshrineBlog){
		dao.save(enshrineBlog);
	}
	
	public int countEnshrined(long blogId) {
		return dao.countEnshrined(blogId);
	}
	
	public boolean hasEnshrined(long blogId, long userId){
		return dao.hasEnshrined(blogId, userId);
	}
}
