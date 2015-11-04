package com.demo.ssh.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public List<Blog> selectMyBlogs(long userId){
		Query query = getSession().createQuery("from Blog b where b.user.id = "+userId+" order by b.publishDate desc");
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
	
	public List<Blog> selectHotBlog(int readedTimes){
		String hql = "from Blog b where b.readedTimes >= "+readedTimes +" order by b.readedTimes desc";
		Query query = getSession().createQuery(hql);
		return query.list();
	}
	
	public Map<String, Object> preAndNext(Long blogId){
		Map<String, Object> result = new HashMap<String, Object>();
		String preHql = "from Blog b where b.id = "+(blogId-1);
		String nextHql = "from Blog b where b.id = "+(blogId+1);
		List preQuery = getSession().createQuery(preHql).list();
		List nextQuery = getSession().createQuery(nextHql).list();
		if(preQuery.size() > 0){
			result.put("pre", preQuery.get(0));
		}else{
			result.put("pre", null);
		}
		if(nextQuery.size() > 0){
			result.put("next", nextQuery.get(0));
		}else{
			result.put("next", null);
		}
		return result;
	}
}
