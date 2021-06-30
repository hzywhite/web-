package com.dao;

import java.util.List;
import com.entity.Flights;

public interface FlightsDao {
	
	public String api(String from,String to);
	
	public boolean reserveFlight(String phone,String city,String endcity,String flightno,String departdate,String departtime,String arrivaldate,String arrivaltime,String departport,String departterminal,String arrivalport,String arrivalterminal,String minprice,String reservationtime,String airline,String departportcode,String arrivalportcode,String seatclass);
}
