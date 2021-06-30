package com.entity;

public class Flights {
	
	private String flightNum;//主键
    private double price;
    private int numSeats;
    private int numAvail;
    private String FromCity;
    private String ArivCity;
    private String departure;
    private String ArivTime;
    //航班所属航空公司
    private String airline;
    
	public Flights() {
	    
	}
    public Flights(String flightNum, double price, int numSeats, int numAvail, String FromCity, String ArivCity, String departure,String airline) {
    	this.flightNum = flightNum;
    	this.price = price;
    	this.numSeats = numSeats;
    	this.numAvail = numAvail;
    	this.FromCity = FromCity;
    	this.ArivCity = ArivCity;
    	this.departure = departure;
    	this.airline = airline;
    	
	}
    
    public int calDuration() {
    	int minute = 0;
    	
    	return 0;
    }
    
	public String getFlightNum() {
		return flightNum;
	}
	public void setFlightNum(String flightNum) {
		this.flightNum = flightNum;
	}
	
	public String getArivTime() {
		return flightNum;
	}
	public void setArivTime(String flightNum) {
		this.flightNum = flightNum;
	}
	public String getairline() {
		return airline;
	}
	public void setairline(String airline) {
		this.airline = airline;
	}

	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getNumSeats() {
		return numSeats;
	}
	public void setNumSeats(int numSeats) {
		this.numSeats = numSeats;
	}
	public int getNumAvail() {
		return numAvail;
	}
	public void setNumAvail(int numAvail) {
		this.numAvail = numAvail;
	}
	public String getFromCity() {
		return FromCity;
	}
	public void setFromCity(String fromCity) {
		this.FromCity = fromCity;
	}
	public String getArivCity() {
		return ArivCity;
	}
	public void setArivCity(String arivCity) {
		this.ArivCity = arivCity;
	}
	public String getDeparture() {
		return departure;
	}
	public void setDeparture(String departure) {
		this.departure = departure;
	}

	
}
