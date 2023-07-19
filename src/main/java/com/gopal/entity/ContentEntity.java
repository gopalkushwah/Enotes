package com.gopal.entity;

import java.io.Serializable;
import java.util.Date;

public class ContentEntity implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String title;
	private String content;
	private Date date;
	private UserEntity user;
	private int uid;
	public ContentEntity() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ContentEntity(int id, String title, String content,Date date,UserEntity user) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.date = date;
		this.user = user;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public UserEntity getUser() {
		return user;
	}
	public void setUser(UserEntity user) {
		this.user = user;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	
	
	
}
