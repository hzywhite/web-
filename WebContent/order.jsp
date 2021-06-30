<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
 <%@ page import="com.entity.*" %>
 <%@ page import="com.dao.*" %>
 <%@ page import="java.util.*"%>
 <%@ page import="com.util.*"%>
 <%@ page import="java.sql.ResultSet"%>
 <%@ page import="java.sql.SQLException"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight-Information</title>
    <link rel="stylesheet" href="./CSS/reset.css">
    <link rel="stylesheet" href="./CSS/base.css">
    <link rel="stylesheet" href="./CSS/reserve.css">
    <link rel="stylesheet" href="./fontawesome/css/all.css">
    <link rel="shortcut icon" href="./img/icon.png" type="image/x-icon">
    <link rel="stylesheet" href="./font/iconfont.css">
</head>

<body>
	
	<% try {
			//String phonenumber = (String)request.getParameter("phone");
			String phonenumber = (String)session.getAttribute("wefly_Phone");
			System.out.println("userphone="+phonenumber);
		    DBconn.init();
			ResultSet rs = DBconn.selectSql("select * from reservations where phone='" + phonenumber + "' ");
			System.out.println(rs.getRow());
			String from="";
			String to = "";
			int id=0;
			String phone = "";
			while(rs.next()){
				Order order = new Order();
				order.setphone(rs.getString("phone"));
				order.setFlightnumber(rs.getString("flightNum"));
				order.setPayState(rs.getString("payState"));
				order.setSeatNum(rs.getString("seatNum"));
				order.setDeparture(rs.getString("departure"));
				id = rs.getInt("id");
				phone = rs.getString("phone");
				/* DBconn.init(); */
				
				ResultSet flightsRs = DBconn.selectSql("select FromCity, ArivCity from flights where flightNum= '"+order.getFlightnumber()+"'");
				while(flightsRs.next()){
					from = flightsRs.getString("FromCity");
					to = flightsRs.getString("ArivCity");  
				}
				%>
				
				
			<div class="information-list-warpper">
             <!-- 航班信息列表容器 -->
             
                 <!-- 航班信息列表 -->
                 <!-- 1111111111111--------------------------------------------------------------------------------------------------- -->
                 <ul class="information-list">
                     <!-- 单个航班信息 -->
                     	<li class="informations">
	                         <!-- 航班详细信息 -->
	                         <div class="flightsall">
	                             <!-- 左侧航班信息 -->
	                             <ol class="flights-list">
	                                 <!-- 前往航班信息 -->
	                                 <li class="from-flights-information-warpper">
	                                     <div class="from-flights-information">
	                                         <!-- 前往航空公司图标 -->
	                                         <div class="from-icon i"><i class="icon iconfont">&#xe62c;</i></div>
	                                         <!-- 前往时间 城市-->
	                                         <div class="section-time">
	                                               Departure Time
	                                            <div class="top"> 
	                                               <%= order.getDeparture() %>
	                                             </div>
	                                             <div class="bottom"><%=from %> - <%=to%></div>
	                                             <!-- <div class="bottom">from - to</div> -->
	                                         </div>
	                                         <!-- 经过几站 -->
	                                         <div class="section-stops">
	                                             <div class="top">Seat No.<i class="icon iconfont" style="color: rgb(232,56,27);">&#xe600;</i></div>
	                                             <div class="top"> 
	                                                
	                                             </div>
	                                             <div class="bottom"><%= order.getSeatNum() %> </div>
	                                         </div>
	                                         
	                                     </div>
	                                 </li>                                 
	                             </ol>
	                             <!-- 右侧价格界面 -->
	                             <div class="price-warpper">
	                                 <!-- 钱包图标 -->
	                                 <i class="icon iconfont">&#xe60e;</i>
	                                
	                                 <!-- 取消按钮 -->
	                                 <form action="CancelServlet" method = "post">
	                                 	<input name="id"  style="display: none" value = "<%=id %>">
	                                 	<input name="phone" style="display: none"  value = "<%=phone %>">
	                                	<a href="#"><button type="submit" class="view-button">Cancel</button></a>
	                                 </form>
	                             </div>
	                         </div>
	                       
	                     </li>
	                     </ul>
	                     </div>
	                     
	                     
			<%}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBconn.closeConn();
		}
		%>
		
		
</body>

</html>