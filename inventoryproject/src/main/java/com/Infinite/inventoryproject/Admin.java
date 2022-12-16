package com.Infinite.inventoryproject;

import javax.faces.bean.ManagedBean;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@ManagedBean
@Entity
@Table(name="admin")
public class Admin {
	
	@Id
	@Column(name="adminId")
	private String AdminId;
	
	@Column(name="UserName")
	private String userName;
	
	@Column(name="Passwrd")
	private String passWord;

	public String getAdminId() {
		return AdminId;
	}

	public void setAdminId(String adminId) {
		AdminId = adminId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	

}
