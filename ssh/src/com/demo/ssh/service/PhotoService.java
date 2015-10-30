package com.demo.ssh.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.demo.ssh.dao.PhotoDao;
import com.demo.ssh.entity.Photo;

@Service
@Transactional
public class PhotoService {
	@Resource
	private PhotoDao photoDao;
	
	public void savePhoto(Photo photo){
		photoDao.save(photo);
	}
}
