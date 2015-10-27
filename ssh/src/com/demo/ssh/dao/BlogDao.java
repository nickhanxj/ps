package com.demo.ssh.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.demo.ssh.base.BaseDao;
import com.demo.ssh.entity.Blog;

@Repository
@SuppressWarnings("all")
public class BlogDao extends BaseDao{
	
	public void saveBlog(Blog blog){
		getSession().save(blog);
	}
	
	public List<Blog> selectList(){
		Query query = getSession().createQuery("from Blog b order by b.publishDate desc");
		return query.list();
	}
	
	public void deleteBlog(Blog blog){
		getSession().delete(blog);
	}
	
	public Blog blogDetail(Long id){
		Query query = getSession().createQuery("from Blog b where b.id = "+id);
		List list = query.list();
		if(list != null && list.size() > 0){
			return (Blog) list.get(0);
		}
		return null;
	}
	
	public void updateBlog(Blog blog){
		getSession().update(blog);
	}
}
