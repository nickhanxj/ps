package com.demo.ssh.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.demo.ssh.dao.CostRecordDao;
import com.demo.ssh.entity.CostRecord;
import com.demo.ssh.util.Page;
import com.demo.ssh.util.PageUtil;

@Service
@Transactional
@SuppressWarnings("all")
public class CostRecordService {
	@Resource
	private CostRecordDao recordDao;
	
	public List<CostRecord> getAll(){
		return recordDao.getAll();
	}
	
	public void addRecord(CostRecord record){
		recordDao.save(record);
	}
	
	public void updateRecord(CostRecord record){
		recordDao.updateRecord(record);
	}
	
	public Map<String, Object> monthTotal(String year, String month){
		return recordDao.monthTotal(year, month);
	}
	
	public Map<String, Object> statisticPerson(String year, String month, String user){
		return recordDao.statisticPerson(year, month, user);
	}
	
	public ArrayList statisticCostByDay(String year, String month){
		return recordDao.statisticCostByDay(year, month);
	}
	
	public Map<String, Object> dailyCosyByPerson(String year, String month, String user){
		return recordDao.dailyCosyByPerson(year, month, user);
	}
	
	public Page<CostRecord> selectListByPage(int currentPage, int pageSize, Map<String, String> params){
		StringBuffer extraParams = new StringBuffer();
		if(StringUtils.isNotBlank(params.get("startTime"))){
			extraParams.append(" and cr.costdate >= '"+params.get("startTime")+"' ");
		}
		if(StringUtils.isNotBlank(params.get("endTime"))){
			extraParams.append(" and cr.costdate <= '"+params.get("endTime")+"' ");
		}
		if(StringUtils.isNotBlank(params.get("user")) && !"0".equals(params.get("user"))){
			extraParams.append(" and cr.user = "+params.get("user")+" ");
		}
		if(StringUtils.isNotBlank(params.get("costFor"))){
			extraParams.append(" and cr.costFor like '%"+params.get("costFor")+"%' ");
		}
		StringBuffer baseHql = new StringBuffer("from CostRecord cr where cr.deleted = 0 "+extraParams.toString()+" order by cr.costdate desc");
		Page<CostRecord> page = new Page<CostRecord>();
		page.setCurrentPage(currentPage);
		page.setPageSize(pageSize);
		page.setCustomizedHql(baseHql.toString());
		PageUtil<CostRecord> pageUtil = new PageUtil<CostRecord>();
		Page<CostRecord> resultPage = pageUtil.selectByPage(page, CostRecord.class);
		return resultPage;
	}
	
	public CostRecord getById(Long id){
		return recordDao.getById(CostRecord.class, id);
	}
	
	public boolean hasPreDayRecord(String date){
		return recordDao.hasPreDayRecord(date);
	}
}
