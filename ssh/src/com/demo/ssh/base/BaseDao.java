package com.demo.ssh.base;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

@SuppressWarnings("all")
public class BaseDao<T> {
	@Resource
	private SessionFactory sessionFactory;

	public Session getSession() {
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

	public List<T> selectAll(Class clz) {
		String hql = "from " + clz.getSimpleName();
		Query query = getSession().createQuery(hql);
		return query.list();
	}

	public T getById(Class clz, Long id) {
		String hql = "from " + clz.getSimpleName() + " t where t.id = " + id;
		List list = getSession().createQuery(hql).list();
		if (list.size() > 0) {
			return (T) list.get(0);
		} else {
			return null;
		}
	}
}
