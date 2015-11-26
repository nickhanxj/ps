package com.demo.ssh.quartz;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import com.demo.ssh.entity.User;
import com.demo.ssh.service.CostRecordService;
import com.demo.ssh.service.UserService;
import com.demo.ssh.util.HttpRequestUtil;
import com.demo.ssh.util.MailSendManager;

public class MailSendQuartz {
	@Resource
	private UserService userService;
	@Resource
	private CostRecordService recordService;
	private Calendar calendar;
	MailSendManager sendManager = new MailSendManager(true);
	
	public void sendEmail(){
		calendar = Calendar.getInstance();
		String year = String.valueOf(calendar.get(Calendar.YEAR));
		String month = String.valueOf(calendar.get(Calendar.MONTH)+1);
		List<String> receiveUser = new ArrayList<String>();
		List<User> allUsers = userService.getAllUsers();
		for (User user : allUsers) {
			receiveUser.add(user.getEmail());
		}
		String url = "http://localhost/cost/statisticsForEmail.html";
		String param = "year="+year+"&month="+month;
		String sendHtml = HttpRequestUtil.sendGet(url, param);
		System.out.println(sendHtml);
		sendManager.doSendHtmlEmail(year+"年+"+month+"月消费账单", sendHtml, receiveUser);
	}
	
	public static void main(String[] args) {
		MailSendQuartz sendQuartz = new MailSendQuartz();
		sendQuartz.sendEmail();
	}
	
}
