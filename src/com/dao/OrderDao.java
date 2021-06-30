package com.dao;

import java.util.List;
import com.entity.Flights;
import com.entity.Order;
import com.util.DBconn;

public interface OrderDao {
	
	//≤È—Ø∫Ω∞‡
	public List<Order> inquire(String phonenumber);
	public boolean OrderCancel(String phone,String flightno,String seatno);

}
