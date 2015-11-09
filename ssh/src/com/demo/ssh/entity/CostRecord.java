package com.demo.ssh.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "t_costrecord")
public class CostRecord {
	private Integer id;
	private String user;// 消费人
	private float cost;// 消费金额
	private String costFor;// 消费项
	private Date costdate;// 消费时间
	private String mark;// 备注
	private Integer status = 0;// 状态 0未结 1已结
	private String attachment;
	private Integer deleted = 0; // 是否删除 0未删 1已删

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false, unique = true)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	// @ManyToOne(fetch = FetchType.EAGER)
	// @JoinColumn(name = "user_id")
	// public User getUser() {
	// return user;
	// }
	//
	// public void setUser(User user) {
	// this.user = user;
	// }

	public float getCost() {
		return cost;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public void setCost(float cost) {
		this.cost = cost;
	}

	public String getCostFor() {
		return costFor;
	}

	public void setCostFor(String costFor) {
		this.costFor = costFor;
	}

	public Date getCostdate() {
		return costdate;
	}

	public void setCostdate(Date costdate) {
		this.costdate = costdate;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getAttachment() {
		return attachment;
	}

	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}

	public Integer getDeleted() {
		return deleted;
	}

	public void setDeleted(Integer deleted) {
		this.deleted = deleted;
	}

}
