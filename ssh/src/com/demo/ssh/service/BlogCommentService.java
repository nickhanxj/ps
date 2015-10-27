package com.demo.ssh.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.demo.ssh.dao.BlogCommentDao;
import com.demo.ssh.entity.BlogComment;

@Transactional
@Service
public class BlogCommentService {
	@Resource
	private BlogCommentDao commentDao;

	public void saveComments(BlogComment comment) {
		commentDao.saveComments(comment);
	}

	public List<BlogComment> getCommentsByBlogId(long blogId) {
		return commentDao.getCommentsByBlogId(blogId);
	}
}
