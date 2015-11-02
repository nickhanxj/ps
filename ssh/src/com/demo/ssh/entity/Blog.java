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
	private List<Image> images;// 相关图片
	private int category;// 分类 1.学习 2.娱乐 3.生活
	private int praisedTimes = 0;// 被赞次数
	private int shredTimes = 0;// 被分享次数
	private int suggestedTimes = 0;// 推荐次数
	private int disSuggestTimes = 0;// 反对次数
	private int readedTimes = 0;// 阅读次数
	private Date publishDate;
	private Date lastEditDate;
	private int enshrineTimes = 0;// 收藏次数
	private int status; // 1 正常 0被删除
	private int published = 0; // 1 已发布 0未发布
	private int auth;// 1 私有 2公开

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

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@OneToMany(mappedBy = "blog")
	@LazyCollection(LazyCollectionOption.EXTRA)
	// azyCollection�������ó�EXTRAָ���˵�����ѯ��ݵĸ���ʱ��ֻ�ᷢ��һ�� count(*)����䣬�������
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

	public int getPraisedTimes() {
		return praisedTimes;
	}

	public void setPraisedTimes(int praisedTimes) {
		this.praisedTimes = praisedTimes;
	}

	public int getDisSuggestTimes() {
		return disSuggestTimes;
	}

	public void setDisSuggestTimes(int disSuggestTimes) {
		this.disSuggestTimes = disSuggestTimes;
	}

	public Date getLastEditDate() {
		return lastEditDate;
	}

	public void setLastEditDate(Date lastEditDate) {
		this.lastEditDate = lastEditDate;
	}

	@Override
	public String toString() {
		return "Blog [id=" + id + ", title=" + title + ", content=" + content
				+ ", user=" + user + ", images=" + images + ", category="
				+ category + ", praisedTimes=" + praisedTimes + ", shredTimes="
				+ shredTimes + ", suggestedTimes=" + suggestedTimes
				+ ", disSuggestTimes=" + disSuggestTimes + ", readedTimes="
				+ readedTimes + ", publishDate=" + publishDate
				+ ", lastEditDate=" + lastEditDate + ", enshrineTimes="
				+ enshrineTimes + ", status=" + status + ", published="
				+ published + ", auth=" + auth + "]";
	}

}
