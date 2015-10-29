package com.demo.ssh.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.demo.ssh.base.BaseDao;
import com.demo.ssh.entity.BlogPraise;

@Repository
@SuppressWarnings("all")
public class BlogPraiseDao extends BaseDao{
	public void savePraise(BlogPraise praise){
		getSession().save(praise);
	}
	
	public int countPraise(Long blogId, int type){
		String hql = "from BlogPraise bp where bp.blog.id = "+blogId +" and type = "+type;
		Query query = getSession().createQuery(hql);
		return query.list().size();
	}
	
	public boolean hasPraised(long blogId, long userId, int type){
		String hql = "from BlogPraise bp where bp.blog.id = "+blogId +" and bp.user.id = "+userId +" and bp.type = "+type;
		Query query = getSession().createQuery(hql);
		List list = query.list();
		if(list.size() > 0){
			return true;
		}else{
			return false;
		}
	}
	
	public boolean anonymousPraised(long blogId, String ip, int type){
		String hql = "from BlogPraise bp where bp.blog.id = "+blogId +" and bp.anonymousIp = '"+ip +"' and bp.type = "+type;
		Query query = getSession().createQuery(hql);
		List list = query.list();
		if(list.size() > 0){
			return true;
		}else{
			return false;
		}
	}
}
