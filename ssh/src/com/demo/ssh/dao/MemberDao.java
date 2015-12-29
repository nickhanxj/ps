package com.demo.ssh.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.demo.ssh.base.BaseDao;
import com.demo.ssh.entity.GroupMember;

@Repository
public class MemberDao extends BaseDao<GroupMember>{
	public List<GroupMember> findByGroupId(Long groupId){
		return getSession().createQuery("from GroupMember gm where gm.group_id = "+groupId).list();
	}
}
