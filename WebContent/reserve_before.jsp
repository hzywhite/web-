<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
 <%@ page import="com.entity.*" %>
 <%@ page import="com.dao.*" %>
 <%@ page import="com.util.*" %>
 <%@ page import="java.util.*"%>
  <%@ page import="net.sf.json.JSONArray"%>
 <%@ page import="net.sf.json.JSONObject"%>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Information</title>
    <link rel="stylesheet" href="./CSS/reset.css">
    <link rel="stylesheet" href="./CSS/base.css">
    <link rel="stylesheet" href="./CSS/reserve.css">
    <link rel="stylesheet" href="./fontawesome/css/all.css">
    <link rel="shortcut icon" href="./img/icon.png" type="image/x-icon">
    <link rel="stylesheet" href="./font/iconfont.css">
</head>

<body>
    <%
    System.out.println("reserve.jsp-----------------------------");
    String phone = (String)session.getAttribute("wefly_Phone");
    System.out.println(phone);

   	FlightsDaoImpl flightSQLResult = new FlightsDaoImpl();

   	String from = request.getParameter("from");
   	String to = request.getParameter("to");
   	String date = request.getParameter("date");
   
   	System.out.println(from);
   	System.out.println(to);
   	System.out.println(date);
   	session.setAttribute("wefly_date", date);
	
   	cityToCode code = new cityToCode();
   	String From = code.citytocode(from);
   	String To = code.citytocode(to);
   	
   	FlightsDaoImpl flightDaoImpl = new FlightsDaoImpl();
   	String json = null;
   	if(date.isEmpty()){
   		json = flightDaoImpl.api(From, To);
   	}
   	else{
   		json = flightDaoImpl.api_date(From, To, date);
   	}
	System.out.println(json);
	JSONObject obj = JSONObject.fromObject(json);

	String message = obj.getString("msg");

	
	JSONObject result = obj.getJSONObject("result");
	System.out.println(result.toString());
	
	JSONArray list = result.getJSONArray("list");
%>


     <div class="topbar-warrper">
         <div class="topbar w">
             <ul class="leftbar">
                 <li><a class="logo" href="./search.jsp">WeFly <i class="fas fa-plane"></i></a></li>
                 <li><a class="flights" href="javascript:;">Flights</a></li>
                 <!-- <li><a href="javascript:;">Stays</a></li> -->
             </ul>
             <ul class="usersection">
             	<%System.out.println(phone+"hello"); %>
             	 <li><a class="sign-in" href="order_inquiry.jsp?phone=<%=phone %>"><i class="fas fa-user"></i>My Order</a></li>
                 <li><a class="sign-in" href="./login.html   "><i class="fas fa-user"></i>Sign out</a></li>
                 <!-- <li><a class="sign-in" href="./register.html"><i class="fas fa-user"></i>Register</a></li> -->
                 <li><a href="javascript:;"><i class="fas fa-flag"></i>CN￥</a></li>
             </ul>
         </div>
     </div>
     <div class="main">
         <div class="searchline-warpper">
             <div class="searchline">
                 <form action="#" class="searchline" method="POST">
                 <!-- 上方的FROM 和 TO -->
                 <%
                 //拿到用户填入的信息
                 
                 %>
                 
                     <input type="text" name="from" id="1" value = "<%=from%>" placeholder="From" class="from">
                     <input type="text" name="to" id="2" value ="<%=to%>" placeholder="To" class="to">
                     <input type="date" name="date" id="3" value="<%= date%>">
                     <a href="reserve.jsp?id=1&name=from,id=2&name=to,id=3&name=date">
                         <button type="submit"
                                 class="submit">
                             <i class="icon iconfont">&#xe7fc;</i>
                         </button>
                     </a>
                 </form>
             </div>
         </div>
			<%if(list.length()==0){%>
			<div>No more flights!!!</div>
			<%}%>	
			
			
			
         <!-- 主容器 -->
         <div class="information-list-warpper">
             <!-- 航班信息列表容器 -->
             <div class="information-list-div w">
                 <!-- 航班信息列表 -->
                 <!-- 1111111111111--------------------------------------------------------------------------------------------------- -->
                 <ul class="information-list">
                     <!-- 单个航班信息 -->
                     <%for(int i = 1;i <= list.length();i++){ 
						JSONObject flight = list.getJSONObject(i-1);%>
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
	                                         <!-- 航空公司+航班号+机型-->
	                                         <div class="section-time">
	                                               <%
	                                               String departure = (String)session.getAttribute("wefly_date");
	                                           
	                                             %>
	                                             <div class="top"> 
	                                            	<%=flight.getString("airline")+"</br>" %>
	                                             	<%=flight.getString("flightno")+" "+flight.getString("craft")%>
	                                             </div>
	                                             
	                                         </div>
	                                         <!-- 时间+机场航站楼+总时间+中转次数 -->
	                                         <div class="section-stops">
	                                             <div class="top">
	                                             <%=flight.getString("costtime") %><br>
	                                             
	                                             <span class="bigfont">
	                                             <%=flight.getString("departtime")%>
	                                             </span>
	                                             
	                                             ——>
	                                             
	                                             <span class="bigfont">
	                                             <%=flight.getString("arrivaltime")%>
	                                             </span>
	                                             
	                                             <br>
	                                             <%=flight.getString("departport")+flight.getString("departterminal")+"       "+flight.getString("arrivalport")+flight.getString("departterminal") %>
	                                             </div>
	                                             <div class="bottom"></div>
	                                         </div>
	                                         <!-- 准点率 -->
	                                         <div class="section-duration">
	                                             <div class="top">
	                                             	 <%="Punctual Rate</br>"+flight.getString("punctualrate")+"%" %>
												 </div>
	                                             <div class="bottom"></div>
	                                         </div>
	                                     </div>
	                                 </li>                                 
	                             </ol>
	                             <!-- 右侧价格界面 -->
	                             <div class="price-warpper">
	                                 <!-- 钱包图标 -->
	                                 <i class="icon iconfont">&#xe60e;</i>
	                                 <!-- 详细价格 -->
	                                 <%String first_price = null;
	                                 String bussiness_price = null;
	                                 String economy_price = null;
	                                 JSONArray pricelist = flight.getJSONArray("pricelist");
	                                 String cabinnametosubmit =null;
                                	 for(int j = 1;j <= pricelist.length();j++) {
                                		 JSONObject cabin = pricelist.getJSONObject(j-1);
                                		 String cabinname = cabin.getString("cabinname");
                                		 cabinnametosubmit = cabinname;
                                		 if(cabinname.compareTo("头等舱") == 0)
                                			 first_price = cabin.getString("price");
                                		 if(cabinname.compareTo("公务舱") == 0)
	                                		 bussiness_price = cabin.getString("price");
                                		 if(cabinname.compareTo("经济舱") == 0)
                                			 economy_price = cabin.getString("price");
                                	 }
                                	 if(first_price == null && bussiness_price == null && economy_price == null){
	                                 %>
	                                 <div class="price">No Class￥<%=0%></div>
	                                 <% }else if(economy_price != null){ %>
	                                 <div class="price">Economy Class￥<%=economy_price%></div>
	                                 <% }else if(bussiness_price != null){ %>
	                                 <div class="price">Business Class￥<%=bussiness_price%></div>
	                                 <% }else if(first_price != null){ %>
	                                 <div class="price">First Class￥<%=first_price%></div>
	                                 <%} %>
	                                 <!-- 订购按钮 -->
	                                 <!-- 生成的数据传送到OrderServlet去进行存数据库 -->
	                                 <form action=alipay.trade.page.pay.jsp method = "post">
	                                 	<input id="phone" name="phone"  style="display: none" value = "<%=phone %>">
                        			 	<input id="flightno" name="flightno"  style="display: none" value ="<%=flight.getString("flightno") %>">
                        			 	<input id="airline" name="airline"  style="display: none" value ="<%=flight.getString("airline") %>">
                        			 	<input id="departportcode" name="departportcode"  style="display: none" value ="<%=flight.getString("departportcode") %>">
                        			 	<input name="departport" style="display: none" value = "<%=flight.getString("departport") %>">
                        			 	<input name="departterminal" style="display: none" value = "<%=flight.getString("departterminal") %>">
                        			 	<input name="arrivalportcode" style="display: none" value = "<%=flight.getString("arrivalportcode") %>">
                        			 	<input name="arrivalport" style="display: none" value = "<%=flight.getString("arrivalport") %>">
                        			 	<input name="arrivalterminal" style="display: none" value = "<%=flight.getString("arrivalterminal") %>">
                        			 	<input name="departdate" style="display: none" value = "<%=flight.getString("departdate") %>">
                         			 	<input name="departtime" style="display: none" value = "<%=flight.getString("departtime") %>">
                         			 	<input name="arrivaldate" style="display: none" value = "<%=flight.getString("arrivaldate") %>">
                         			 	<input name="arrivaltime" style="display: none" value = "<%=flight.getString("arrivaltime") %>">
                         			 	<input name="costtime" style="display: none" value = "<%=flight.getString("costtime") %>">
                         			 	<input name="seattype" style="display: none" value = "<%=cabinnametosubmit %>">
                         			 	<input id="minprice" name="minprice" style="display: none" value = "<%=flight.getString("minprice") %>">
										<!-- 商品名称 -->
                         			 	<!-- <input id="WIDsubject" name="WIDsubject" style="display: none" value = > -->
										<!--商品描述 -->
                         			 	<input id="WIDbody" name="WIDbody" style="display: none" value=" " >
                         			 	<a href="#"><button type="submit" class="view-button">Buy Now!</button></a>
	                                 </form>
	                             </div>
	                         </div>
	                       
	                     </li>
	                  <%} %>
                     
                 </ul>
             </div>
         </div>
         
     </div>
     
</body>

</html>