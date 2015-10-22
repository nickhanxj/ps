package com.demo.ssh.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "t_user")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false, unique = true)
	private int id;
	private String userName;
	private String password;
	private String email;
	private String phoneNumber;
	private int sex;// 0:未知 1：男 2：女
	private int status = 1;// 0:异常 1：正常
	private Date registerDate;
	private Date lastLoginDate;
	private String lastLoginIp;
	private Date curLoginDate;
	private String curLoginIp;
	private int type = 1;// 0: 管理员 1：普通用户

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public Date getLastLoginDate() {
		return lastLoginDate;
	}

	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}

	public Date getCurLoginDate() {
		return curLoginDate;
	}

	public void setCurLoginDate(Date curLoginDate) {
		this.curLoginDate = curLoginDate;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getLastLoginIp() {
		return lastLoginIp;
	}

	public void setLastLoginIp(String lastLoginIp) {
		this.lastLoginIp = lastLoginIp;
	}

	public String getCurLoginIp() {
		return curLoginIp;
	}

	public void setCurLoginIp(String curLoginIp) {
		this.curLoginIp = curLoginIp;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", userName=" + userName + ", password="
				+ password + ", email=" + email + ", phoneNumber="
				+ phoneNumber + ", sex=" + sex + ", status=" + status
				+ ", registerDate=" + registerDate + ", lastLoginDate="
				+ lastLoginDate + ", lastLoginIp=" + lastLoginIp
				+ ", curLoginDate=" + curLoginDate + ", curLoginIp="
				+ curLoginIp + ", type=" + type + "]";
	}

}
