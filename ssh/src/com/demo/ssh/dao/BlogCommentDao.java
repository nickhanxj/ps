package com.demo.ssh.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.demo.ssh.base.BaseDao;
import com.demo.ssh.entity.BlogComment;

@Repository
@SuppressWarnings("all")
public class BlogCommentDao extends BaseDao {
	public void saveComments(BlogComment comment) {
		getSession().save(comment);
	}

	public List<BlogComment> getCommentsByBlogId(long blogId) {
		String hql = "from BlogComment bc where bc.blog.id = " + blogId +"order by bc.pubTime";
		Query query = getSession().createQuery(hql);
		return query.list();
	}
}
