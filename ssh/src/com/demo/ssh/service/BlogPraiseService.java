package com.demo.ssh.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.demo.ssh.dao.BlogPraiseDao;
import com.demo.ssh.entity.BlogPraise;

@Transactional
@Service
public class BlogPraiseService {
	@Resource
	private BlogPraiseDao praiseDao;

	public void savePraise(BlogPraise praise) {
		praiseDao.savePraise(praise);
	}
	
	public int countPraise(Long blogId, int type){
		return praiseDao.countPraise(blogId, type);
	}
	
	public boolean hasPraised(long blogId, long userId, int type){
		return praiseDao.hasPraised(blogId, userId, type);
	}
	
	public boolean anonymousPraised(long blogId, String ip, int type){
		return praiseDao.anonymousPraised(blogId, ip, type);
	}
}
