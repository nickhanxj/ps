package com.demo.ssh.util;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class PageUtil<T> {
	private Session session;

	public Page<T> selectByPage(Page<T> page, Class clz) {
		ApplicationContext context = new FileSystemXmlApplicationContext(
				"classpath:applicationContext.xml");
		SessionFactory sessionFactory = (SessionFactory) context
				.getBean("sessionFactory");
		this.session = sessionFactory.openSession();
		String customizedHql = page.getCustomizedHql();
		int currentPage = page.getCurrentPage();
		int pageSize = page.getPageSize();
		if (customizedHql == null || customizedHql == "") {
			customizedHql = "from " + clz.getSimpleName();
		}
		Query query = session.createQuery(customizedHql);
		List<T> list = query.setFirstResult((currentPage - 1) * pageSize)
				.setMaxResults(pageSize).list();
		page.setRows(list);
		page.setTotalRow(countTotal(clz, customizedHql));
		page.setFirstPage(isFirstPage(currentPage));
		page.setLastPage(isLastPage(page));
		session.close();
		sessionFactory.close();
		return page;
	}

	private int countTotal(Class clz, String customizedHql) {
		if (customizedHql == null || customizedHql == "") {
			return session.createQuery("from " + clz.getSimpleName()).list()
					.size();
		}
		return session.createQuery(customizedHql).list().size();

	}

	private boolean isFirstPage(int currentPage) {
		if (currentPage == 1) {
			return true;
		}
		return false;
	}
	
	private boolean isLastPage(Page page){
		int currentPage = page.getCurrentPage();
		int pageSize = page.getPageSize();
		int totalRow = page.getTotalRow();
		int totalPage = 1;
		if(totalRow % pageSize == 0){
			totalPage = totalRow / pageSize;
		}else{
			totalPage = totalRow / pageSize + 1;
		}
		if(currentPage == totalPage){
			return true;
		}
		return false;
	}
}
