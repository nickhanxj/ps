package com.demo.ssh.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.demo.ssh.dao.CostRecordDao;
import com.demo.ssh.entity.Blog;
import com.demo.ssh.entity.CostRecord;
import com.nick.page.pageutil.Page;
import com.nick.page.pageutil.PageUtil;

@Service
public class CostRecordService {
	@Resource
	private CostRecordDao recordDao;
	
	public List<CostRecord> getAll(){
		return recordDao.getAll();
	}
	
	public void addRecord(CostRecord record){
		recordDao.save(record);
	}
	
	public Map<String, Object> monthTotal(String year, String month){
		return recordDao.monthTotal(year, month);
	}
	
	public Map<String, Object> statisticPerson(String year, String month, String user){
		return recordDao.statisticPerson(year, month, user);
	}
	
	public Page<CostRecord> selectListByPage(int currentPage, int pageSize, Map<String, Object> params){
		StringBuffer extraParams = new StringBuffer();
		if(params.get("startTime") != null){
			
		}
		StringBuffer baseHql = new StringBuffer("from CostRecord cr order by cr.costdate desc");
		Page<CostRecord> page = new Page<CostRecord>();
		page.setCurrentPage(currentPage);
		page.setPageSize(pageSize);
		page.setCustomizedHql(baseHql.toString());
		PageUtil<CostRecord> pageUtil = new PageUtil<CostRecord>();
		Page<CostRecord> resultPage = pageUtil.selectByPage(page, CostRecord.class);
		return resultPage;
	}
}
