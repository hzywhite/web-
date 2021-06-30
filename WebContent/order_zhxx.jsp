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
	
	System.out.println((String)session.getAttribute("wefly_Phone")); 
	String sql_1 = "select * from users where phone="+(String)session.getAttribute("wefly_Phone");
	DBconn.init();
	ResultSet rs_1 = DBconn.selectSql(sql_1);
	String name = null;
	String IDNum = null;
	String phone = null;
	String password = null;
	while(rs_1.next()){
		name = rs_1.getString(1);
		IDNum = rs_1.getString(2);
		phone = rs_1.getString(3);
		password = rs_1.getString(4);
	}
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
                <li></i><a href="javascript:;"><i class="fas fa-flag"></i>CN￥</a></li>
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
                                <li class="function active">
                                    <a href="order_zhxx.jsp?phone=<%=(String)session.getAttribute("wefly_Phone")%>"><i class="icon iconfont">&#xe75f;</i><span>Account information</span></a>
                                </li>
                                <li class="function">
                                    <a href="order_xgjcxx.jsp?phone=<%=(String)session.getAttribute("wefly_Phone")%>"><i class="icon iconfont">&#xe629;</i><span>Modify the information</span></a>
                                </li>
                                <li class="function">
                                    <a href="order_xgmm.jsp?phone=<%=(String)session.getAttribute("wefly_Phone")%>"><i class="icon iconfont">&#xe601;</i><span>Change the password</span></a>
                                </li>
                                <li class="function">
                                    <a href="order_ddcx.jsp?phone=<%=(String)session.getAttribute("wefly_Phone")%>"><i class="icon iconfont">&#xe601;</i><span>Order query</span></a>
                                </li>
                            </ul>
                        </div>
                        <div class="cx">
                        	<div class="cx-content">
								<div class="zhxx">
									<div class="x1">
										<img src="./img/icon.png" style="width:110px; height:110px; border-radius:50%;"/>
									</div>
									<div class="x2">
										<div class="kuang_1">
											<div class="kuang_1_content">
												<span>Name</span>
											</div>
											<div class="kuang_1_content">
												<span>IDNum</span>
											</div>
											<div class="kuang_1_content">
												<span>Phone</span>
											</div>
										</div>
										<div class="yh">
											<div class="yh_content">
												<span>:</span>
											</div>
											<div class="yh_content">
												<span>:</span>
											</div>
											<div class="yh_content">
												<span>:</span>
											</div>
										</div>
										<div class="kuang_2">
											<div class="kuang_2_content">
												<input type="text" value="<%=name %>" style="font-size:25px;" disabled>
											</div>
											<div class="kuang_2_content">
												<input type="text" value="<%=IDNum %>" style="font-size:25px;" disabled>
											</div>
											<div class="kuang_2_content">
												<input type="text" value="<%=phone %>" style="font-size:25px;" disabled>
											</div>
										</div>
									</div>
								</div>                  	
                        	</div>
                        </div>
                        
                        
                        
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>