package com.demo.ssh.action;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.demo.ssh.base.BaseAction;
import com.opensymphony.xwork2.ActionContext;

public class FileAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	private String fileName;
	private File file;
	
	public String upload(){
		String targetFolder = ServletActionContext.getServletContext().getRealPath("/upload/photo");
		File destFile = new File(targetFolder,UUID.randomUUID().toString()+"."+getExtention(fileName));
		try {
			FileUtils.copyFile(file, destFile);
			ActionContext.getContext().put(MESSAGE, fileName+"--"+file);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ActionContext.getContext().put(MESSAGE, "upload failed!");
		}
		return SUCCESS;
	}
	
	private static String getExtention(String fileName) {   
	  int pos = fileName.lastIndexOf( "." );   
	  return fileName.substring(pos);   
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

}
