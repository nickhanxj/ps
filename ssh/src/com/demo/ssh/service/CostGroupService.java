package com.demo.ssh.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.demo.ssh.dao.CostGroupDao;
import com.demo.ssh.entity.CostGroup;

@Service
public class CostGroupService {
	@Resource
	private CostGroupDao groupDao;
	
	public void save(CostGroup group){
		groupDao.save(group);
	}
	
	public List<CostGroup> findAll(){
		return groupDao.selectAll(CostGroup.class);
	}
	
	public List<CostGroup> findByUserId(String userId){
		return groupDao.findByUserId(userId);
	}
	
	public CostGroup findById(Long groupId){
		return groupDao.getById(CostGroup.class, groupId);
	}
	
}
