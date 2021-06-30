package com.entity;
 
public class Order {
	
	private String phone;
    private String flightnumber;
    private String payState;//Ö÷¼ü
    private String seatNum;
    private String departure;
    
    public Order() {
    	
    }
    public Order(String phone, String flightnumber, String payState, String seatNum,String departure) {
    	this.phone = phone;
    	this.setFlightnumber(flightnumber);
    	this.setPayState(payState);
    	this.setSeatNum(seatNum);
    	this.setDeparture(departure);
	}
	public String getphone() {
		return phone;
	}
	public void setphone(String phone) {
		this.phone = phone;
	}
	
	public String getPayState() {
		return payState;
	}
	public void setPayState(String payState) {
		this.payState = payState;
	}
	public String getFlightnumber() {
		return flightnumber;
	}
	public void setFlightnumber(String flightnumber) {
		this.flightnumber = flightnumber;
	}
	public String getSeatNum() {
		return seatNum;
	}
	public void setSeatNum(String seatNum) {
		this.seatNum = seatNum;
	}
	public String getDeparture() {
		return departure;
	}
	public void setDeparture(String departure) {
		this.departure = departure;
	}
	
}