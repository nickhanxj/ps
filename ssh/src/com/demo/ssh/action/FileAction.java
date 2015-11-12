package com.demo.ssh.action;

import java.io.File;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
	private String filename;
	private String name;
	private File fileList;
	private Album album;
	private Photo photo;
	@Resource
	private PhotoService photoService;
	@Resource
	private AlbumService albumService;

	public String uploadPhoto() {
		System.out.println("filename: "+filename);
		Map<String, Object> rMap = new HashMap<String, Object>();
		String targetFolder = ServletActionContext.getServletContext()
				.getRealPath("/upload/photo");
		File destFile = new File(targetFolder, UUID.randomUUID().toString()
				+ getExtention(filename));
		try {
			 FileUtils.copyFile(fileList, destFile);
			rMap.put(STATUS, STATUS_SUCCESS);
			rMap.put("url", "/upload/photo/" + destFile.getName());
		} catch (Exception e) {
			e.printStackTrace();
			rMap.put(STATUS, STATUS_ERROR);
			rMap.put("url", null);
		}
		putContext(JSONDATA, rMap);
		return JSON;
	}

	public String createAlbum() {
		try {
			album.setUser(getSessionUser());
			albumService.saveAlbum(album);
			putContext(STATUS, STATUS_SUCCESS);
			putContext(MESSAGE, "create album [" + album.getName()
					+ "] success!");
		} catch (Exception e) {
			e.printStackTrace();
			putContext(STATUS, STATUS_ERROR);
			putContext(MESSAGE, "create album [" + album.getName()
					+ "] failed!");
		}
		return ALBUM_LIST;
	}

	public String album() {
		List<Album> all = albumService.getAll();
		putContext("albums", all);
		return "album";
	}

	private static String getExtention(String fileName) {
		return ".png";
		// int pos = fileName.lastIndexOf(".");
		// return fileName.substring(pos);
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public File getFileList() {
		return fileList;
	}

	public void setFileList(File fileList) {
		this.fileList = fileList;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
