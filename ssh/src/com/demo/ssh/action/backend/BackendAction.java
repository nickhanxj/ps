package com.demo.ssh.action.backend;

import java.util.List;

import javax.annotation.Resource;

import com.demo.ssh.base.BaseAction;
import com.demo.ssh.entity.CostGroup;
import com.demo.ssh.entity.GroupMember;
import com.demo.ssh.entity.User;
import com.demo.ssh.service.CostGroupService;
import com.demo.ssh.service.UserService;

public class BackendAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	@Resource
	private UserService userService;
	@Resource
	private CostGroupService groupService;
	private CostGroup group;
	private String members;
	
	public String index(){
		return BackendSystemConstants.INDEX;
	}

	public String users() {
		List<User> allUsers = userService.getAllUsers();
		putContext("users", allUsers);
		return "userList";
	}

	public String costgroup() {
		List<CostGroup> groups = groupService.findAll();
		putContext("groups", groups);
		return "costgroupList";
	}

	public String addCostGroup() {
		String[] members = this.members.split(",");
		for (String trueName : members) {
			GroupMember member = new GroupMember();
			User foundUser = userService.getUserByTrueName(trueName);
			member.setUser(foundUser);
			group.addMember(member);
		}
		groupService.save(group);
		return "reloadCostgroup";
	}

	public CostGroup getGroup() {
		return group;
	}

	public void setGroup(CostGroup group) {
		this.group = group;
	}

	public String getMembers() {
		return members;
	}

	public void setMembers(String members) {
		this.members = members;
	}

}
