package com.demo.ssh.util;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

/**
 * 分页查询
 * 注： 此工具在使用延迟加载的时候会报错
 * @author john
 *
 * @param <T>
 */
@SuppressWarnings("all")
public class PageUtil<T> {
	private Session session;

	public Page<T> selectByPage(Page<T> page, Class clz) {
		//获取spring上下文
		ApplicationContext context = new FileSystemXmlApplicationContext("classpath:applicationContext.xml");
		//从spring容器中获取sessionFactory
		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
		//开启一个session用于查询
		this.session = sessionFactory.openSession();
		String customizedHql = page.getCustomizedHql();
		int currentPage = page.getCurrentPage();
		int pageSize = page.getPageSize();
		if (customizedHql == null || customizedHql == "") {
			customizedHql = "from " + clz.getSimpleName();
		}
		Query query = session.createQuery(customizedHql);
		List<T> list = query
					.setFirstResult((currentPage - 1) * pageSize)
					.setMaxResults(pageSize)
					.list();
		//封装page对象用于返回
		page.setRows(list);
		page.setTotalRow(countTotal(clz, customizedHql));
		page.setFirstPage(isFirstPage(currentPage));
		page.setLastPage(isLastPage(page));
		page.setTotalPage(countTotalPage(page.getTotalRow(), pageSize));
		//关闭session--造成延迟加载失败的原因
		session.close();
		sessionFactory.close();
		return page;
	}

	//总记录数
	private int countTotal(Class clz, String customizedHql) {
		if (customizedHql == null || customizedHql == "") {
			return session.createQuery("from " + clz.getSimpleName()).list().size();
		}
		return session.createQuery(customizedHql).list().size();

	}
	
	//总页数
	private int countTotalPage(int totalRow, int pageSize){
		int totalPage = 1;
		if(totalRow%pageSize == 0){
			totalPage = totalRow / pageSize;
		}else{
			totalPage = (totalRow / pageSize) + 1;
		}
		return totalPage;
	}

	//是否是当前页
	private boolean isFirstPage(int currentPage) {
		if (currentPage == 1) {
			return true;
		}
		return false;
	}
	
	//是否是最后一页
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
