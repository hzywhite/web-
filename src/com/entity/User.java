package com.entity;
 
public class User {
	
	private String IDNum;
    private String name;
    private String phone;//Ö÷¼ü
    private String password;
    
    
    public User() {
    	
    }
    public User(String usr, String id, String phone, String pwd) {
    	this.name = usr;
    	this.IDNum = id;
    	this.phone = phone;
    	this.password = pwd;
	}
	public String getIDNum() {
		return IDNum;
	}
	public void setIDNum(String id) {
		IDNum = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String pwd) {
		this.password = pwd;
	}
}