package com.demo.ssh.action;

import javax.annotation.Resource;

import com.demo.ssh.base.BaseAction;
import com.demo.ssh.entity.Album;
import com.demo.ssh.service.AlbumService;
import com.demo.ssh.service.PhotoService;

public class PhotoAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private static final String PHOTO_LIST = "phptolist";
	private Long albumId;
	@Resource
	private PhotoService photoService;
	@Resource
	private AlbumService albumService;

	public String photos(){
		Album album = albumService.getAlbum(albumId);
		putContext("album", album);
		return PHOTO_LIST;
	}

	public String upload() {
		return SUCCESS;
	}

	public Long getAlbumId() {
		return albumId;
	}

	public void setAlbumId(Long albumId) {
		this.albumId = albumId;
	}

}
