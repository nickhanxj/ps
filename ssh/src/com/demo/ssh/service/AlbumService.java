package com.demo.ssh.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.demo.ssh.dao.AlbunDao;
import com.demo.ssh.entity.Album;

@Service
@Transactional
public class AlbumService {
	@Resource
	private AlbunDao albunDao;
	
	public void saveAlbum(Album album){
		albunDao.save(album);
	}
	
	public List<Album> getAll(){
		return albunDao.selectAll(Album.class);
	}
}
