package com.demo.ssh.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.demo.ssh.dao.MemberDao;
import com.demo.ssh.entity.GroupMember;

@Service
@Transactional
public class GroupMemberService {
	@Resource
	private MemberDao memberDao;
	
	public List<GroupMember> findByGroupId(Long groupId){
		return memberDao.findByGroupId(groupId);
	}
}
