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
    <script type="text/javascript" language="javaScript">
	function hideShowPsw1(){
		var demoImg = document.getElementById("demo_img1");
		var demoInput = document.getElementById("demo_input1");
		if (demoInput.type == "password") {
			demoInput.type = "text";
			demo_img1.src = "./img/invisible.png";
		}else {
			demoInput.type = "password";
			demo_img1.src = "./img/visible.png";
		}
	}
	function hideShowPsw2(){
		var demoImg = document.getElementById("demo_img2");
		var demoInput = document.getElementById("demo_input2");
		if (demoInput.type == "password") {
			demoInput.type = "text";
			demo_img2.src = "./img/invisible.png";
		}else {
			demoInput.type = "password";
			demo_img2.src = "./img/visible.png";
		}
	}
	function upd_mm(url,phone){
		var OLDP = document.getElementById("oldp");
		var NEWP = document.getElementById("demo_input1");
		var RNEWP = document.getElementById("demo_input2");
	if(NEWP.value==RNEWP.value){
		if(OLDP.value==""){
			alert("Old password cannot be empty!")//旧密码不能为空！
			return;
		}
		else if(OLDP.value!=url){
			alert("Old password error!")//旧密码错误！
			return;
		}
		else if(OLDP.value==url){
			if(confirm("Are you sure to change your password?")){//确定要修改密码嘛？
				
				window.location.href = "upd_mm.jsp?phone="+phone+"&password="+url+"&newpassword="+NEWP.value;
				}
			document.form1.action("upd_mm.jsp?phone="+url);
		}
	}
	else if(NEWP.value!=RNEWP.value){
		if(OLDP.value==""){
			alert("The old password cannot be empty! And the new password does not match the repeated new password!")//旧密码不能为空且新密码与重复新密码不匹配！
			return;
		}
		else if(OLDP.value!=url){
			alert("The old password is wrong! And the new password does not match the repeated new password!")//旧密码错误且新密码与重复新密码不匹配！
			return;
		}
		else if(OLDP.value==url){
			alert("The new password does not match the repeated new password!")//新密码与重复新密码不匹配！
			return;
		}
	}

	}
	</script>
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
                                <li class="function">
                                    <a href="order_zhxx.jsp?phone=<%=(String)session.getAttribute("wefly_Phone")%>"><i class="icon iconfont">&#xe75f;</i><span>Account information</span></a>
                                </li>
                                <li class="function">
                                    <a href="order_xgjcxx.jsp?phone=<%=(String)session.getAttribute("wefly_Phone")%>"><i class="icon iconfont">&#xe629;</i><span>Modify the information</span></a>
                                </li>
                                <li class="function active">
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
										<div class="k_1">
											<div class="kuang_1_content">
												<span>old password</span>
											</div>
											<div class="kuang_1_content">
												<span>new password</span>
											</div>
											<div class="kuang_1_content">
												<span>repeat new password</span>
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
										<div class="k_2">
											<div class="kuang_2_content">
												<input type="text" id="oldp" value="" style="font-size:20px;">
											</div>
											<div class="kuang_2_content">
												
												<input type="password" style="font-size:20px;" id="demo_input1" value="" placeholder="Password"/>
												<img id="demo_img1" Onclick="hideShowPsw1()" src="./img/visible.png" style="max-width:20px">
											</div>
											<div class="kuang_2_content">
												
												<input type="password" style="font-size:20px;" id="demo_input2" value="" placeholder="Password"/>
												<img id="demo_img2" Onclick="hideShowPsw2()" src="./img/visible.png" style="max-width:20px">
											</div>
											
										</div>
									</div>
									<div class="x3">
									<%System.out.println("zywsb"+password); %>
										<input type="button" style="font-size:25px;" value="update" Onclick="upd_mm(<%=password%>,<%=phone%>)"/> 
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