package com.dao;

public class Main {
	public static void main(String[] args) {
		FlightsDaoImpl flightDaoImpl = new FlightsDaoImpl();
		flightDaoImpl.api("XIY", "PEK");
	}
}
