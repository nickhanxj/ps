package com.demo.ssh.dao;

import java.util.Iterator;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.demo.ssh.base.BaseAction;
import com.demo.ssh.base.BaseDao;
import com.demo.ssh.entity.User;

@Repository
@SuppressWarnings("all")
public class UserDao extends BaseDao<User>{
	private static final long serialVersionUID = 1L;

	public void addUser(User user) {
		getSession().save(user);
	}

	public void updateUser(User user) {
		getSession().update(user);
	}

	public User getUserByCondition(User user) {
		String userName = user.getEmail();
		String password = user.getPassword();
		if (StringUtils.isNotBlank(userName) && StringUtils.isBlank(password)) {
			Iterator iterate = getSession().createQuery(
					"from User u where u.userName = '" + user.getUserName()
							+ "'").iterate();
			if (iterate.hasNext()) {
				return (User) iterate.next();
			}
		} else if (StringUtils.isNotBlank(userName)
				&& StringUtils.isNotBlank(password)) {
			Iterator iterate = getSession()
					.createQuery(
							"from User u where u.email = '"
									+ user.getEmail()
									+ "' and u.password = '"
									+ user.getPassword() + "'").iterate();
			if (iterate.hasNext()) {
				return (User) iterate.next();
			}
		}
		return null;
	}

	public User selectUserById(String id) {
		String hql = "from User u where u.id = " + id;
		Query query = getSession().createQuery(hql);
		List list = query.list();
		if (list != null && list.size() > 0) {
			return (User) list.get(0);
		}
		return null;
	}
}
