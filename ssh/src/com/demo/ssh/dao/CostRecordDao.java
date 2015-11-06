package com.demo.ssh.dao;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.criterion.CriteriaSpecification;
import org.springframework.stereotype.Repository;

import com.demo.ssh.base.BaseDao;
import com.demo.ssh.entity.CostRecord;

@Repository
@SuppressWarnings("all")
public class CostRecordDao extends BaseDao<CostRecord> {
	public List<CostRecord> getAll() {
		String hql = "from CostRecord cr order by cr.costdate desc";
		return getSession().createQuery(hql).list();
	}
	
	//计算月消费总额
	public Map<String, Object> monthTotal(String year, String month){
		Map<String, Object> rMap = new HashMap<String, Object>();
		String byYearAndMonth = " and year(tc.costdate) = "+year+" and month(tc.costdate) = "+month;
		//月消费总额
		String totalCostPerMonthSql = "select sum(cost) from t_costrecord tc where 1 = 1 "+byYearAndMonth;
		SQLQuery totalCostPerMonth = getSession().createSQLQuery(totalCostPerMonthSql);
		rMap.put("monthTotal", totalCostPerMonth.uniqueResult());
		return rMap;
	}
	
	//根据消费人统计查询信息
	public Map<String, Object> statisticPerson(String year, String month, String user){
		String byYearAndMonth = " and year(tc.costdate) = "+year+" and month(tc.costdate) = "+month;
		Map<String, Object> rMap = new HashMap<String, Object>();
		
		String costTimesSql = "select count(*) from t_costrecord tc where tc.user = "+user+byYearAndMonth;
		SQLQuery costTimes = getSession().createSQLQuery(costTimesSql);
		rMap.put("costTimes", costTimes.uniqueResult());//消费次数
		
		String costTotalSql = "select sum(cost) csum,avg(cost) cavg from t_costrecord tc where tc.user = "+user+byYearAndMonth;
		Query costTotal = getSession().createSQLQuery(costTotalSql).setResultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP);
		rMap.put("costTotal", costTotal.uniqueResult());//消费总金额  日均消费
		
		String settledSql = "select count(*) from t_costrecord tc where tc.status = 1 and tc.user = "+user+byYearAndMonth;
		rMap.put("settled", getSession().createSQLQuery(settledSql).uniqueResult());//已结消费
		String unsettledSql = "select count(*) from t_costrecord tc where tc.status = 0 and tc.user = "+user+byYearAndMonth;
		rMap.put("unsettled", getSession().createSQLQuery(unsettledSql).uniqueResult());//未结消费
		return rMap;
	}
}
