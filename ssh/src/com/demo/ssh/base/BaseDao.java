package com.demo.ssh.base;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

@SuppressWarnings("all")
public class BaseDao<T>{
	@Resource
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public void save(T t) {
		getSession().save(t);
	}

	public void update(T t) {
		getSession().update(t);
	}

	public void delete(T t) {
		getSession().delete(t);
	}
	
	public List<T> selectAll(Class clz){
		String hql = "from "+clz.getSimpleName();
		Query query = getSession().createQuery(hql);
		return query.list();
	}
}
