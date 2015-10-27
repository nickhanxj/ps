package com.demo.ssh.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.demo.ssh.dao.BlogDao;
import com.demo.ssh.entity.Blog;

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
	
	public Blog blogDetail(Long id){
		return dao.blogDetail(id);
	}
	
	public void updateBlog(Blog blog){
		dao.updateBlog(blog);
	}
}
