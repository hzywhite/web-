<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
 <%@ page import="com.entity.*" %>
 <%@ page import="com.dao.*" %>
 <%@ page import="com.util.*" %>
 <%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
  <%@ page import="net.sf.json.JSONArray"%>
 <%@ page import="net.sf.json.JSONObject"%>
 <%@ page import="java.sql.ResultSet"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Order</title>
    <link rel="stylesheet" href="./CSS/reset.css">
    <link rel="stylesheet" href="./CSS/base.css">
    <link rel="stylesheet" href="./CSS/wefly.css">
    <link rel="stylesheet" href="./../fontawesome/css/all.css">
    <link rel="stylesheet" href="./font/iconfont.css">
    <link rel="stylesheet" href="./CSS/order_inquiry.css">
    <link rel="shortcut icon" href="./img/icon.png" type="image/x-icon">
</head>
<script src="./JS/order.js"></script>
<body>
<%
	String phone = (String)request.getAttribute("wefly_Phone");
	if(phone == null || phone.length() == 0){
		phone = (String)session.getAttribute("wefly_Phone");
	}
	//String phone = (String)request.getAttribute("wefly_Phone");
	String flightno = request.getParameter("flightno");
	String departdate = request.getParameter("departdate");
	String departtime = request.getParameter("departtime");
	String arrivaldate = request.getParameter("arrivaldate");
	String arrivaltime = request.getParameter("arrivaltime");
	String departport = request.getParameter("departport");
	String departterminal = request.getParameter("departterminal");
	String arrivalport = request.getParameter("arrivalport");
	String arrivalterminal = request.getParameter("arrivalterminal");
	String minprice = request.getParameter("minprice");
	System.out.println("wefly_Phone:"+phone);
%>
    <div class="topbar-warrper">
        <div class="topbar w">
            <ul class="leftbar">
                <li><a class="logo" href="search.jsp">WeFly <i class="fas fa-plane"></i></a></li>
                <li><a class="flights" href="javascript:;">Flights</a></li>
                <!-- <li><a href="javascript:;">Stays</a></li> -->
            </ul>
            <ul class="usersection">
                <li><a class="sign-in" href="./login.html"><i class="fas fa-user"></i>Log out</a></li>
                <li><a href="javascript:;"><i class="fas fa-flag"></i>CN￥</a></li>
            </ul>
        </div>
    </div>
    <div class="main">
        <div class="root">
            <div class="home">
                <div class="accont-center">
                    <div class="accont-body">
                        <div class="sidebar">
                            <ul class="function-list">
                                <li class="function">
                                    <a href="order_zhxx.jsp?phone=<%=(String)session.getAttribute("wefly_Phone")%>"><i class="icon iconfont">&#xe75f;</i><span>Account information</span></a>
                                </li>
                                <li class="function">
                                    <a href="order_xgjcxx.jsp?phone=<%=phone%>"><i class="icon iconfont">&#xe629;</i><span>Modify the information</span></a>
                                </li>
                                <li class="function">
                                    <a href="order_xgmm.jsp?phone=<%=phone%>"><i class="icon iconfont">&#xe601;</i><span>Change the password</span></a>
                                </li>
                                <li class="function active">
                                    <a href="order_ddcx.jsp?phone=<%=phone%>"><i class="icon iconfont">&#xe601;</i><span>Order query</span></a>
                                </li>
                            </ul>
                        </div>
                        <div class="cx">
	                        <div class="cx-content">
	                        	<ul class="cx-list">
	                        		<%
	                        		String sql = "select * from reservations where phone='"+phone+"';";
	                        		System.out.println("sql----------:"+sql);
	                        		DBconn.init();
	                        		ResultSet rs = DBconn.selectSql(sql);
	                        		rs.last();
	                        		int rowCount = rs.getRow();
	                        		rs.beforeFirst();
	                        		System.out.println(rs); 
	                        		if(rowCount!=0){
	                        		while(rs.next()){
	                        			String f = null;
	                        			flightno = rs.getString(5);
	                        			String seatno = rs.getString(17);
	                        			System.out.println(rs.getString(18));
	                        			String price = rs.getString(14);
	                        			//String price="0.01";
	                        			String tradeno = rs.getString(18);
	                        			String refund_amount_show = rs.getString(22);
	                        			System.out.println("flightno: "+flightno+"seatno: "+seatno+"tradeno: "+tradeno);
	                        		%>
	                        		<li class="information">
	                        			<div class="ddxx">
	                        				<div class="reservation-top">
	                        					<span role="presentation" class="ilb mr20">
	                        					OrderID:
	                        						<span style="color:#06c"><%=tradeno %></span>
	                        					</span>
	                        					<span class="ilb mr20">Order Time：<%=rs.getString(15) %></span>
<!-- 	                        					<span role="presentation" class="order-btn">删除订单</span> -->
	                        					
	                        					<%
	                        						String status = rs.getString(16);
	                        						if(status.compareTo("unpaid")==0){
	                        					%>		
	                        							<form action="cancel" method = "post" style="display:inline;">
			                        					 	<input id="phone" name="phone"  style="display: none" value = "<%=phone %>">
						                                 	<input id="flightno" name="flightno"  style="display: none" value = "<%=flightno %>">
						                                 	<input id="seatno" name="seatno"  style="display: none" value = "<%=seatno %>">
					                        			 	<input id="tradeno" name="tradeno"  style="display: none" value ="<%=tradeno %>">
					                        			 	
															<a href="#"><button type="submit" class="order-btn">cancel</button></a>
						                                 </form>
						                       <%} %>
						                       
						                       <%
						                       		 if(status.compareTo("paid")==0){
						                       			double refund_amount = Double.parseDouble(price);
						                       			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
						                       			Date nowdate = new Date();   
						                       			String dbtime1 = format.format(nowdate); 
						                       			String dbtime2 = rs.getString(6);
						                       			Date date1 = format.parse(dbtime1);
						                       			Date date2 = format.parse(dbtime2);
						                       			int periodDays = (int) ((date2.getTime() - date1.getTime()) / (1000*3600*24));
						                       			System.out.println("PeriodDays: "+periodDays);
						                       			if(periodDays>=15 && refund_amount>50.0){
						                       				refund_amount=refund_amount-50.0;
						                       				
						                       			}
						                       			else if(periodDays>=7 && refund_amount>50.0){
						                       				double temp = refund_amount*(periodDays*1.0/15);
						                       				if(temp>50.0){
						                       					temp-=50.0;
						                       				}
						                       				refund_amount= temp;
						                       			}
						                       			else{
						                       				refund_amount= refund_amount*0.2;
						                       			}
						                       			
						                       			//测试用
						                       			//refund_amount=0.01;
						                       			
						                       			String refund_amount1 = String.format("%.2f",refund_amount);
						                       			System.out.println("refund_amount1: "+refund_amount1);
						                       			
						                       			//退款原因：最好新建个页面用来确认是否退款，顺便填写退款原因
						                       			String Rrefund_reason="to be done";
						                       			
						                       			 
	                        					%>		
	                        							<form name=traderefund action=alipay.trade.refund.jsp method=post target="_blank" style="display:inline;">
			                        					 	<input id="phone" name="phone"  style="display: none" value = "<%=phone %>">
						                                 	<input id="flightno" name="flightno"  style="display: none" value = "<%=flightno %>">
						                                 	<input id="seatno" name="seatno"  style="display: none" value = "<%=seatno %>">
						                                 	<input id="price" name="price"  style="display: none" value = "<%=price %>">
						                                 	<input id="WIDTRrefund_amount" name="WIDTRrefund_amount" style="display: none" value = "<%=refund_amount1 %>">
					                        			 	<input id="WIDTRrefund_reason" name="WIDTRrefund_reason" style="display: none" value = "<%=Rrefund_reason%>">
					                        			 	<input id="tradeno" name="tradeno"  style="display: none" value ="<%=tradeno %>">
					                        			 	
															<a href="#"><button type="submit" class="order-btn">refund</button></a>
						                                 </form>
						                       <%} %>
	                        				</div>
	                        				<div class="reservation-middle">
	                        					<div class="left">
	                        						<div class="order-item-title">
	                        							<span style="overflow:hidden; text-overflow:ellipsis; -webkit-box-orient:vertical; display:-webkit-box; -webkit-line-clamp:2;"><%=rs.getString(2) %>-<%=rs.getString(3) %></span>
	                        						</div>
	                        						<div class="order-item-txt">
	                        							<span>Datetime：<%=rs.getString(6) %> <%=rs.getString(7) %> to <%=rs.getString(8) %> <%=rs.getString(9) %> <%=rs.getString(5) %></span>
	                        						</div>
	                        						<div class="order-item-txt">
	                        							<span>Passenger Name：<%=rs.getString(1) %></span>
	                        						</div>
	                        						<div class="order-item-txt">
	                        							<span>SeatNO：<%=rs.getString(23)+" No."+seatno %></span>
	                        						</div>
	                        					</div>
	                        					<div class="right">
	                        						<div class="price-detail">
	                        							<div class="price-num">￥<%=price %></div>
	                        						</div>
	                        						<div class="price-status">
	                        							<div class="price-status-title">
	                        							<% 
	                        							if(status.compareTo("refunded")==0){
	                        							%>
	                        							<span>refunded：<%=refund_amount_show %></span>
	                        							<%} 
	                        							else{%>
	                        								<span><%=rs.getString(16) %></span>
	                        							</div>
	                        						</div>
	                        					</div>
	                        				</div>
	                        				<div class="reservation-button">
	                        					 <form action=alipay.trade.page.pay.jsp method = "post">
	                        					 	<input id="phone" name="phone"  style="display: none" value = "<%=phone %>">
				                                 	<input id="price" name="price"  style="display: none" value = "<%=price %>">
				                                 	<input id="flightno" name="flightno"  style="display: none" value = "<%=flightno %>">
				                                 	<input id="seatno" name="seatno"  style="display: none" value = "<%=seatno %>">
			                        			 	<input id="tradeno" name="tradeno"  style="display: none" value ="<%=tradeno %>">
			                        			 	<!-- 商品名称 -->
			                         			    <input id="WIDsubject" name="WIDsubject" style="display: none" value = "<%=phone %>"> 
													<!--商品描述 -->
			                         			 	<input id="WIDbody" name="WIDbody" style="display: none" value="customer:<%=phone %> bought <%=tradeno %> at <%=rs.getString(15)%>" >
			                         			 	<%}
			                         			 		if(status.compareTo("unpaid")==0){
			                         			 	%>
			                         			 	<a href="#"><button type="submit" class="">check</button></a>
			                         			 	<%} %>
				                                 </form>
<!-- 	                        					<button type="submit" class="">check</button> -->
	                        				</div>
			
	                        			</div>
	                        		<%}
	                        		}
	                        		else{
	                        		%> 
	                        			<span style="font-size:40px; text-align:center">No Reservations !</span>
	                        		<%}%>
	                        		</li>
	                        	</ul>
                        	</div>
                        </div>
                        
                        
                        
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>