package com.demo.ssh.action;

import com.demo.ssh.base.BaseAction;

public class ResourceAction extends BaseAction{
	private static final long serialVersionUID = 1L;

	
	public String homepage(){
		return "homepage";
	}
	/**
	 * 
	 * @return
	 */
	public String blog(){
		return "blog";
	}
	
	/**
	 * 
	 * @return
	 */
	public String photo(){
		return "photo";
	}
	
	/**
	 * 
	 * @return
	 */
	public String music(){
		return "music";
	}
	
	/**
	 * 
	 * @return
	 */
	public String video(){
		return "video";
	}
}
