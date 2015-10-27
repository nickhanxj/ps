package com.demo.ssh.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.demo.ssh.base.BaseDao;
import com.demo.ssh.entity.EnshrineBlog;

@Repository
@SuppressWarnings("all")
public class EnshrineBlogDao extends BaseDao<EnshrineBlog> {
	
	public int countEnshrined(long blogId) {
		String hql = "from EnshrineBlog eb where eb.blog.id = " + blogId;
		Query query = getSession().createQuery(hql);
		List list = query.list();
		return list.size();
	}
	
	public boolean hasEnshrined(long blogId, long userId){
		String hql = "from EnshrineBlog eb where eb.blog.id = "+blogId +" and eb.user.id = "+userId;
		Query query = getSession().createQuery(hql);
		List list = query.list();
		if(list.size() > 0){
			return true;
		}else{
			return false;
		}
	}
}
