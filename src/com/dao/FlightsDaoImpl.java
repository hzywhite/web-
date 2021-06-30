package com.dao;

import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;


import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import com.entity.Flights;
import com.util.DBconn;
import com.dao.HttpUtils;


public class FlightsDaoImpl implements FlightsDao {
	
	public String api(String from,String to) {
        String host = "https://flight.market.alicloudapi.com";
        String path = "/flight/query";
        String method = "ANY";
        String appcode = "dcd8952b286b4521a1db781007cd1825";
        Map<String, String> headers = new HashMap<String, String>();
        String json = null;
        //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
        headers.put("Authorization", "APPCODE " + appcode);
        //根据API的要求，定义相对应的Content-Type
        headers.put("Content-Type", "application/json; charset=UTF-8");
        Map<String, String> querys = new HashMap<String, String>();
        querys.put("city", from);
        //querys.put("date", "2021-05-17");
        querys.put("endcity", to);

        try {
        	HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
        	System.out.println(response.toString());
            //获取response的body
            
            json = EntityUtils.toString(response.getEntity(),"utf-8");
            System.out.println(json);
            return json;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json;
    }
	
	public String api_date(String from,String to,String date) {
        String host = "https://flight.market.alicloudapi.com";
        String path = "/flight/query";
        String method = "ANY";
        String appcode = "dcd8952b286b4521a1db781007cd1825";
        Map<String, String> headers = new HashMap<String, String>();
        String json = null;
        //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
        headers.put("Authorization", "APPCODE " + appcode);
        //根据API的要求，定义相对应的Content-Type
        headers.put("Content-Type", "application/json; charset=UTF-8");
        Map<String, String> querys = new HashMap<String, String>();
        querys.put("city", from);
        querys.put("date", date);
        querys.put("endcity", to);

        try {
        	HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
        	System.out.println(response.toString());
            //获取response的body
            
            json = EntityUtils.toString(response.getEntity(),"utf-8");
            System.out.println(json);
            return json;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json;
    }
	
	public String api_flightno(String flightNo) {
        String host = "https://flight.market.alicloudapi.com";
        String path = "/flight/query";
        String method = "ANY";
        String appcode = "dcd8952b286b4521a1db781007cd1825";
        Map<String, String> headers = new HashMap<String, String>();
        String json = null;
        //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
        headers.put("Authorization", "APPCODE " + appcode);
        //根据API的要求，定义相对应的Content-Type
        headers.put("Content-Type", "application/json; charset=UTF-8");
        Map<String, String> querys = new HashMap<String, String>();
        querys.put("flightno", flightNo);

        try {
        	HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
        	System.out.println(response.toString());
            //获取response的body
            
            json = EntityUtils.toString(response.getEntity(),"utf-8");
            System.out.println(json);
            return json;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json;
    }
	
	public boolean reserveFlight(String phone,String city,String endcity,String flightno,String departdate,String departtime,String arrivaldate,String arrivaltime,String departport,String departterminal,String arrivalport,String arrivalterminal,String minprice,String reservationtime,String airline,String departportcode,String arrivalportcode,String seatclass) {
		
		boolean flag = false;
		String name = null;
		String sql = "select name from users where phone="+phone;
  		DBconn.init();
  		ResultSet rs1 = DBconn.selectSql(sql);
  		try {
			while(rs1.next()) {
				name = rs1.getString(1);
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
  		DBconn.init();
  		//seatno
  		int maxSeat = 1;
  		try {
  		ResultSet rs = DBconn.selectSql("select seatno from reservations where flightno = '"+flightno+"' and seatclass = '"+seatclass+"' and status!= 'canceled' order by seatno desc" );
  			while(rs.next()) {
  				maxSeat = rs.getInt("seatno")+1;
  				break;
  			}
  		}catch (SQLException e) {
			e.printStackTrace();
		}
  		String departport_zh = null;
		try {
			departport_zh = new String(departport.getBytes("ISO8859-1"),"GBK");
		} catch (UnsupportedEncodingException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
  		String arrivalport_zh = null;
		try {
			arrivalport_zh = new String(arrivalport.getBytes("ISO8859-1"),"GBK");
		} catch (UnsupportedEncodingException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
  		//status
  		String status = "unpaid";
  		String reservationID = "null";
  		Random random = new Random();
		String tradeno = flightno+maxSeat;
		reservationID = tradeno+String.valueOf(random.nextInt(1000));
  		int i = DBconn.addUpdDel("insert into reservations(name,city,endcity,phone,flightno,departdate,departtime,arrivaldate,arrivaltime,departport,departterminal,arrivalport,arrivalterminal,minprice,reservationtime,status,seatno,reservationID,airline,departportcode,arrivalportcode,seatclass) " +
  				"values('"+name+"','"+city+"','"+endcity+"','"+phone+"','"+flightno+"','"+departdate+"','"+departtime+"','"+arrivaldate+"','"+arrivaltime+"','"+departport_zh+"','"+departterminal+"','"+arrivalport_zh+"','"+arrivalterminal+"','"+minprice+"','"+reservationtime+"','"+status+"','"+maxSeat+"','"+reservationID+"','"+airline+"','"+departportcode+"','"+arrivalportcode+"','"+seatclass+"');");
  		if(i>0){
  			flag = true;
  		}
  		System.out.println("reserve:flag="+flag);
//  		flag = true;
  		DBconn.closeConn();
  		return flag;
	}
	
	
	
	//将搜索出来的想要预订的航班信息添加到数据库flights表里 (未完成)
	public int insertflights(String flightno,String airline,String departportcode,String departport,String arrivalportcode,String arrivalport,String departterminal,String arrivalterminal,String departdate,String departtime,String arrivaldate,String arrivaltime,String costtime,String priceofeconomy,String seatsofeconomy,String priceofbusiness,String seatsofbusiness,String priceoffirst,String seatsoffirst) {
		int flag = 0;
		Connection  conn = null;
		//插入flights表的sql语句：：：：：
		String sql = "insert into reservations values('"+flightno+"','"+airline+"','"+departportcode+"','"+departport+"','"+arrivalportcode+"','"+arrivalport+"','"+departterminal+"','"+arrivalterminal+"',str_to_date('"+departdate+"','%Y-%m-%d'),str_to_date('"+departtime+"','%H:%i:%s'),str_to_date('"+arrivaldate+"','%Y-%m-%d'),str_to_date('"+arrivaltime+"','%H:%i:%s'),str_to_date('"+costtime+"','%k:%i:%s'),"+Integer.parseInt(priceofeconomy)+","+Integer.parseInt(seatsofeconomy)+","+Integer.parseInt(priceofbusiness)+","+Integer.parseInt(seatsofbusiness)+","+Integer.parseInt(priceoffirst)+","+Integer.parseInt(seatsoffirst)+");";
    	try {
		    DBconn.init();
		    PreparedStatement ps =  conn.prepareStatement(sql);
			flag =  ps.executeUpdate();
			DBconn.closeConn();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
}
