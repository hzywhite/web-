package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.entity.Flights;
import com.entity.Order;
import com.entity.User;
import com.util.DBconn;

public class OrderDaoImpl implements OrderDao{
	
	public ArrayList<Order> inquire(String phonenumber) {
		ArrayList<Order> list = new ArrayList<Order>();
		try {
		    DBconn.init();
			ResultSet rs = DBconn.selectSql("select * from reservations where phone='" + phonenumber + "' ");
			while(rs.next()){
				Order order = new Order();
				order.setphone(rs.getString("phone"));
				order.setFlightnumber(rs.getString("flightNum"));
				order.setPayState(rs.getString("payState"));
				order.setSeatNum(rs.getString("seatNum"));
				order.setDeparture(rs.getString("departure"));
				list.add(order);
			}
			DBconn.closeConn();
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public boolean OrderCancel(String phone,String flightno,String seatno) {
		boolean flag=false;
  		DBconn.init();
  		int temp = DBconn.addUpdDel("update reservations set status = 'canceled' where phone ='"+phone+"' and flightno = '"+flightno+"' and seatno = '"+seatno+"'");
  		System.out.println("OrderCancel:flag="+flag);
  		DBconn.closeConn();
  		if(temp>0) {
  			flag=true;
  		}
  		return flag;
	}
	//生成订单，存入reservations表里，同时生成订单号和？座位号？（未完成）
	public int createreservation(String name,String phone,String flightno,String airline,String departportcode,String departport,String departterminal,String arrivalportcode,String arrivalport,String arrivalterminal,String departdate,String departtime,String arrivaldate,String arrivaltime,String costtime,String seattype,String price) {
		int flag = 0;
		Connection  conn = null;
		String reservedatetime = "";	//当前系统时间
		String reservationID = "";
		String sql = "";
		
		int seatno = 0;	//座位号  ???怎么生成座位号
		
		//(订单号)reservationID=reservedate+phone+flightno+dapartdate+departportcode
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		SimpleDateFormat df2 = new SimpleDateFormat("yyyyMMddHHmmss");
		Date datetime = new Date();	// new Date()为获取当前系统时间
		reservedatetime = df2.format(datetime); 
    	try {
		    DBconn.init();
		    reservationID = reservedatetime+phone+flightno+departdate+departportcode;
			sql = "insert into reservations values('"+reservationID+"','"+name+"','"+phone+"','"+flightno+"','"+airline+"','"+departportcode+"','"+departport+"','"+departterminal+"','"+arrivalportcode+"','"+arrivalport+"','"+arrivalterminal+"',str_to_date('"+departdate+"','%Y-%m-%d'),str_to_date('"+departtime+"','%H:%i:%s'),str_to_date('"+arrivaldate+"','%Y-%m-%d'),str_to_date('"+arrivaltime+"','%H:%i:%s'),str_to_date('"+costtime+"','%k:%i:%s'),str_to_date('"+df.format(datetime)+"','%Y-%m-%d %H:%i:%s'),'"+seattype+"',"+seatno+","+Integer.parseInt(price)+",'unpaid');";
		    PreparedStatement ps =  conn.prepareStatement(sql);
			flag =  ps.executeUpdate();
			DBconn.closeConn();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
}
