package com.demo.ssh.action;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.demo.ssh.base.BaseAction;
import com.demo.ssh.entity.CostRecord;
import com.demo.ssh.service.CostRecordService;
import com.nick.page.pageutil.Page;
import com.opensymphony.xwork2.ActionContext;

public class CostRecordAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	@Resource
	private CostRecordService recordService;
	private CostRecord record;
	private String year;
	private String month;
	private Date sStartTime;
	private Date sEndTime;
	private String sUserName;
	private String sCostFor;
	private String fileName;
	private File file;
	private Long recordId;

	public String list() {
		Map<String, Object> params = new HashMap<String, Object>();
		if (sStartTime != null) {
			params.put("startTime", sStartTime);
		}
		if (sEndTime != null) {
			params.put("endTime", sEndTime);
		}
		if (StringUtils.isNotBlank(sUserName)) {
			params.put("user", sUserName);
		}
		if (StringUtils.isNotBlank(sCostFor)) {
			params.put("costFor", sCostFor);
		}
		Page<CostRecord> all = recordService.selectListByPage(1, 15, params);
		putContext("records", all.getRows());
		return "list";
	}

	public String uploadPhoto() {
		Map<String, Object> rMap = new HashMap<String, Object>();
		String targetFolder = ServletActionContext.getServletContext()
				.getRealPath("/upload/costrecord");
		File destFile = new File(targetFolder, UUID.randomUUID().toString()
				+ getExtention(fileName));
		try {
			FileUtils.copyFile(file, destFile);
			rMap.put(STATUS, STATUS_SUCCESS);
			String imgUrl = "/upload/costrecord/" + destFile.getName();
			rMap.put("url", imgUrl);
			ActionContext.getContext().put(MESSAGE, fileName + "--" + file);
		} catch (Exception e) {
			e.printStackTrace();
			rMap.put(STATUS, STATUS_ERROR);
			rMap.put("url", null);
			ActionContext.getContext().put(MESSAGE, "upload failed!");
		}
		putContext(JSONDATA, rMap);
		return JSON;
	}

	private static String getExtention(String fileName) {
		return ".png";
		// int pos = fileName.lastIndexOf(".");
		// return fileName.substring(pos);
	}

	public String addRecord() {
		return "add";
	}

	public String editRecord() {
		CostRecord costRecord = recordService.getById(recordId);
		putContext("record", costRecord);
		return "edit";
	}

	public String statistics() {
		Map<String, Object> monthTotal = recordService.monthTotal(year, month);
		putContext("monthTotal", monthTotal);
		List<Map<String, Object>> rList = new ArrayList<Map<String, Object>>();
		for (int i = 1; i <= 3; i++) {
			Map<String, Object> rMap = new HashMap<String, Object>();
			Map<String, Object> statisticResult = recordService
					.statisticPerson(year, month, i + "");
			String username = "";
			if (i == 1) {
				username = "韩晓军";
			} else if (i == 2) {
				username = "胡丰盛";
			} else if (i == 3) {
				username = "李洪亮";
			}
			rMap.put("user", username);
			rMap.put("statisticResult", statisticResult);
			rList.add(rMap);
		}
		putContext("cyear", year);
		putContext("cmonth", month);
		putContext("result", rList);
		return "statistics";
	}

	public String add() {
		// 保存
		recordService.addRecord(record);
		return "redirectList";
	}

	public String update() {
		System.out.println("record: "+record);
		recordService.updateRecord(record);
		return "redirectList";
	}

	public CostRecord getRecord() {
		return record;
	}

	public void setRecord(CostRecord record) {
		this.record = record;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public Date getsStartTime() {
		return sStartTime;
	}

	public void setsStartTime(Date sStartTime) {
		this.sStartTime = sStartTime;
	}

	public Date getsEndTime() {
		return sEndTime;
	}

	public void setsEndTime(Date sEndTime) {
		this.sEndTime = sEndTime;
	}

	public String getsUserName() {
		return sUserName;
	}

	public void setsUserName(String sUserName) {
		this.sUserName = sUserName;
	}

	public String getsCostFor() {
		return sCostFor;
	}

	public void setsCostFor(String sCostFor) {
		this.sCostFor = sCostFor;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public Long getRecordId() {
		return recordId;
	}

	public void setRecordId(Long recordId) {
		this.recordId = recordId;
	}

}
