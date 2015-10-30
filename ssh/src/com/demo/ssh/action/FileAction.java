package com.demo.ssh.action;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.demo.ssh.base.BaseAction;
import com.demo.ssh.entity.Album;
import com.demo.ssh.entity.Photo;
import com.demo.ssh.service.AlbumService;
import com.demo.ssh.service.PhotoService;
import com.opensymphony.xwork2.ActionContext;

public class FileAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private static final String PHOTO_LIST = "phptolist";
	private static final String ALBUM_LIST = "albumlist";
	private String fileName;
	private File file;
	private Album album;
	private Photo photo;
	@Resource
	private PhotoService photoService;
	@Resource
	private AlbumService albumService;

	public String uploadPhoto() {
		String targetFolder = ServletActionContext.getServletContext()
				.getRealPath("/upload/photo");
		File destFile = new File(targetFolder, UUID.randomUUID().toString()
				+ "." + getExtention(fileName));
		try {
			FileUtils.copyFile(file, destFile);
			ActionContext.getContext().put(MESSAGE, fileName + "--" + file);
		} catch (IOException e) {
			e.printStackTrace();
			ActionContext.getContext().put(MESSAGE, "upload failed!");
		}
		return PHOTO_LIST;
	}
	
	public String createAlbum(){
		try {
			album.setUser(getSessionUser());
			albumService.saveAlbum(album);
			putContext(STATUS, STATUS_SUCCESS);
			putContext(MESSAGE, "create album ["+album.getName()+"] success!");
		} catch (Exception e) {
			e.printStackTrace();
			putContext(STATUS, STATUS_ERROR);
			putContext(MESSAGE, "create album ["+album.getName()+"] failed!");
		}
		return "photo";
	}
	
	public String photo(){
		List<Album> all = albumService.getAll();
		putContext("albums", all);
		return "photo";
	}

	private static String getExtention(String fileName) {
		int pos = fileName.lastIndexOf(".");
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

	public Album getAlbum() {
		return album;
	}

	public void setAlbum(Album album) {
		this.album = album;
	}

	public Photo getPhoto() {
		return photo;
	}

	public void setPhoto(Photo photo) {
		this.photo = photo;
	}

}
