package com.demo.ssh.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name = "t_blog")
public class Blog {

	private long id;
	private String title;
	private String content;
	private User user;
	private List<Image> images;// ���ͼƬ
	private int category;// ���� 1.ѧϰ 2.���� 3.����
	private int praisedTimes = 0;// ���޴���
	private int shredTimes = 0;// ���������
	private int suggestedTimes = 0;// �Ƽ�����
	private int disSuggestTimes = 0;// ���Դ���
	private int readedTimes = 0;// �Ķ�����
	private Date publishDate;
	private int enshrineTimes = 0;// �ղش���
	private int status; // 1 ���� 0��ɾ��
	private int published = 0; // 1 �ѷ��� 0δ����
	private int auth;// 1 ˽�� 2����

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false, unique = true)
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@OneToMany(mappedBy = "blog")
	@LazyCollection(LazyCollectionOption.EXTRA)
	// azyCollection�������ó�EXTRAָ���˵������ѯ���ݵĸ���ʱ��ֻ�ᷢ��һ�� count(*)����䣬�������
	public List<Image> getImages() {
		return images;
	}

	public void setImages(List<Image> images) {
		this.images = images;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public int getPraisedTimes() {
		return praisedTimes;
	}

	public void setPraisedTimes(int praisedTimes) {
		this.praisedTimes = praisedTimes;
	}

	public int getShredTimes() {
		return shredTimes;
	}

	public void setShredTimes(int shredTimes) {
		this.shredTimes = shredTimes;
	}

	public int getSuggestedTimes() {
		return suggestedTimes;
	}

	public void setSuggestedTimes(int suggestedTimes) {
		this.suggestedTimes = suggestedTimes;
	}

	public Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getDisSuggestTimes() {
		return disSuggestTimes;
	}

	public void setDisSuggestTimes(int disSuggestTimes) {
		this.disSuggestTimes = disSuggestTimes;
	}

	public int getReadedTimes() {
		return readedTimes;
	}

	public void setReadedTimes(int readedTimes) {
		this.readedTimes = readedTimes;
	}

	public int getPublished() {
		return published;
	}

	public void setPublished(int published) {
		this.published = published;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	public int getEnshrineTimes() {
		return enshrineTimes;
	}

	public void setEnshrineTimes(int enshrineTimes) {
		this.enshrineTimes = enshrineTimes;
	}

}
