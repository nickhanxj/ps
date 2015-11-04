package com.demo.ssh.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.demo.ssh.dao.BlogDao;
import com.demo.ssh.entity.Blog;
import com.nick.page.pageutil.Page;
import com.nick.page.pageutil.PageUtil;

@Transactional
@Service
public class BlogService {
	@Resource
	private BlogDao dao;
	
	public void saveBlog(Blog blog){
		dao.saveBlog(blog);
	}
	
	public List<Blog> selectList(){
		return dao.selectList();
	}
	
	public List<Blog> selectMyBlogs(long userId){
		return dao.selectMyBlogs(userId);
	}
	
	public Blog blogDetail(Long id){
		return dao.blogDetail(id);
	}
	
	public void updateBlog(Blog blog){
		dao.updateBlog(blog);
	}
	
	public Map<String, Object> preAndNext(Long blogId){
		return dao.preAndNext(blogId);
	}
	
	public List<Blog> selectHotBlog(){
		return dao.selectHotBlog(50);
	}
	
	public Page<Blog> selectListByPage(int currentPage, int pageSize){
		Page<Blog> page = new Page<Blog>();
		page.setCurrentPage(currentPage);
		page.setPageSize(pageSize);
		page.setCustomizedHql("from Blog b order by b.publishDate desc");
		PageUtil<Blog> pageUtil = new PageUtil<Blog>();
		Page<Blog> resultPage = pageUtil.selectByPage(page, Blog.class);
		return resultPage;
	}
	
	public Page<Blog> selectHotBlogsByPage(int currentPage, int pageSize){
		Page<Blog> page = new Page<Blog>();
		page.setCurrentPage(currentPage);
		page.setPageSize(pageSize);
		page.setCustomizedHql("from Blog b where b.readedTimes >= 50 order by b.readedTimes desc");
		PageUtil<Blog> pageUtil = new PageUtil<Blog>();
		Page<Blog> resultPage = pageUtil.selectByPage(page, Blog.class);
		return resultPage;
	}
	
}
