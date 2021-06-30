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
    <title>Manager</title>
    <link rel="stylesheet" href="./CSS/app.c697566d.css">
    <link rel="stylesheet" href="./CSS/chunk-vendors.419904a0.css">
    <link rel="stylesheet" href="./CSS/chunk-a973bb02.55a2ef7a.css">
    <link rel="stylesheet" href="./CSS/chunk-3a08e3aa.67c8ce51.css">
    <link rel="stylesheet" href="./CSS/reset.css">
    <link rel="stylesheet" href="./CSS/base.css">
    <link rel="stylesheet" href="./CSS/wefly.css">
    <link rel="stylesheet" href="./fontawesome/css/all.css">
    <link rel="stylesheet" href="./font/iconfont.css">
    <link rel="stylesheet" href="./CSS/modification.css">        
    <link rel="shortcut icon" href="./img/icon.png" type="image/x-icon">
    <link rel="stylesheet" href="./CSS/bootstrap.min.css">
    <script src="./js/jquery-3.6.0.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
</head>
<body>
<%

	//使用request.getAttribute从loginServlet传值到manager.jsp，传值成功
	User userOnLoginInsearch = (User)request.getAttribute("userOnLogin");
	
	System.out.println("manager.jsp--------------------------------------------------------------------------------------------------------------");
	/* System.out.println("got from userOnLoginsearch.jsp Name = "+userOnLoginInsearch.getName()); */
	
	//从login页面传递方式拿到标签内参数
	String username = request.getParameter("phoneNumber");
	String pwd = request.getParameter("password");
	session.setAttribute("wefly_Phone", username);
	session.setAttribute("wefly_pwd", pwd);
	
	/* System.out.println("search.jsp: username = "+username); */
	%>
    <div class="topbar-warrper">
        <div class="topbar">
            <ul class="leftbar">
                <li><a class="logo" href="javascript:;">WeFly <i class="fas fa-plane"></i></a></li>
                <!-- <li><a href="javascript:;">Stays</a></li> -->
            </ul>
            <!-- <ul class="usersection">
                <li><a class="sign-in" href="./login.html"><i class="fas fa-user"></i>Sign in</a></li>
                <li><a class="sign-in" href="./register.html"><i class="fas fa-user"></i>Register</a></li>
                <li></i><a href="javascript:;"><i class="fas fa-flag"></i>CNÃ¯Â¿Â¥</a></li>
            </ul> -->
        </div>
    </div>
    <div id="app">
	    <div data-v-d73c3eb8 class="wrapper">
	    	<section data-v-d73c3eb8 class="el-container">
	    		<aside data-v-d73c3eb8 class='el-aside' style="width:235px;">
		    		<div data-v-d73c3eb8 class="sidebar">
					    <div class="backstage">
					    	<div class="backstage_img pull-left">
					    		<a href="./login.html"><img src="./img/feiji.png" alt></a>
					    	</div>
					    </div>
					    
							<ul id="myTab" class="nav nav-pills nav-stacked" style="text-align:center; font-size:large;">
							     <li id="tab1" class="active"><a href="manager.jsp">The flight information</a></li>
							     <li id="tab2"><a href="manager_userInfo.jsp">The user information</a></li>
							     <li id="tab3"><a href="manager_ddcx.jsp">The reservations</a></li>
							     <!-- <li id="tab4"><a href="add_flights.jsp">XXXXXXX</a></li> -->
							     <!-- <li id="tab5"><a href="add_flights.jsp">XXXXXXX</a></li> -->
							</ul>
							

		        	</div>
	    		</aside>
	    		<section data-v-d73c3eb8 class="el-container is-vertical">
	    			<main data-v-d73c3eb8 class="el-main">
	    				<div data-v-d73c3eb8 class="main-content">
	    					<div data-v-d73c3eb8 class="content-wrapper">
	    						<div data-v-17a8d628 data-v-d73c3eb8 class="yl-member-list">
	    							<div class="select selectSearch">
	    								<div class="select-left">
	    									<div style="float:left; width:100%;">
	    										<form action="manager_cx.jsp" method = "post" autocomplete="off">
		    										
		    										<div class="el-input" style="width:200px; margin-right:10px;">
		    											<input type="text" name="manager_from" id="1" autocomplete="off" placeholder="From" class="el-input__inner">
		    										</div>
		    										<div class="el-input" style="width:200px; margin-right:10px;">
		    											<input type="text" name="manager_to" id="2" autocomplete="off" placeholder="To" class="el-input__inner">
		    										</div>
		    										<div class="el-input" style="width:200px; margin-right:10px;">
		    											<input type="date" name="manager_date" id="3" class="el-input__inner">
		    										</div>
		    										<a href="manager_cx.jsp?id=1&name=manager_from,id=2&name=manager_to,id=3&name=manager_date">
			    										<button type="submit" class="el-button el-button--primary">
			    											<span>Search</span>
			    										</button>
			    									</a>
			    								</form>
	    									</div>
	    								</div>
	    							</div>
	    							<div class="form-input flex-layout-js">
	    								<div class="menuflexitem-tr" style="display:none;">
	    								</div>
	    							</div>
	    							<div class="el-tabs el-tabs--card el-tabs--top">
	    								<div class="el-tabs__content">
	    									<div role="tabpanel" id="pane-first" aria-labelledby="tab-first" class="el-tab-pane" style="width:100%;">
	    										<div class="el-table el-table--fit el-table--enable-row-hover" style="width:100%;">
	    											<div class="hidden-columns">
	    												<div data-v-17a8d628></div>
	    												<div data-v-17a8d628></div>
	    												<div data-v-17a8d628></div>
	    												<div data-v-17a8d628></div>
	    												<div data-v-17a8d628></div>
	    												<div data-v-17a8d628></div>
	    												<div data-v-17a8d628></div>
	    												<div data-v-17a8d628></div>
	    												<div data-v-17a8d628></div>
	    												<div data-v-17a8d628></div>
	    												<div data-v-17a8d628></div>
	    												<div data-v-17a8d628></div>
	    											</div>
	    											<div class="el-table__header-wrapper">
	    												<table cellspacing="0" cellpadding="0" border="0" class="el-table__header" style="width:100%;">
	    													<colgroup>
	    														<col name="el-table_11_column_80" width="12%">
	    														<col name="el-table_11_column_81" width="12%">
	    														<col name="el-table_11_column_82" width="11%">
	    														<col name="el-table_11_column_83" width="11%">
	    														<col name="el-table_11_column_84" width="11%">
	    														<col name="el-table_11_column_85" width="11%">
	    														<col name="el-table_11_column_86" width="16%">
	    														<col name="el-table_11_column_87" width="16%">

	    														<col name="gutter" width="0">
	    													</colgroup>
	    													<thead class="has-gutter">
	    														<tr class>
	    															<th colspan='1' rowspan="1" class="el-table_11_column_80 is-center is-leaf">
	    																<div class="cell">flightno</div>
	    															</th>
	    															<th colspan='1' rowspan="1" class="el-table_11_column_81 is-center is-leaf">
	    																<div class="cell">airline</div>
	    															</th>
	    															<th colspan='1' rowspan="1" class="el-table_11_column_82 is-center is-leaf">
	    																<div class="cell">city</div>
	    															</th>
	    															<th colspan='1' rowspan="1" class="el-table_11_column_83 is-center is-leaf">
	    																<div class="cell">endcity</div>
	    															</th>
	    															<th colspan='1' rowspan="1" class="el-table_11_column_84 is-center is-leaf">
	    																<div class="cell">departportcode</div>
	    															</th>
	    															<th colspan='1' rowspan="1" class="el-table_11_column_85 is-center is-leaf">
	    																<div class="cell">arrivalportcode</div>
	    															</th>
	    															<th colspan='1' rowspan="1" class="el-table_11_column_86 is-center is-leaf">
	    																<div class="cell">departdatetime</div>
	    															</th>
	    															<th colspan='1' rowspan="1" class="el-table_11_column_87 is-center is-leaf">
	    																<div class="cell">arrivaldatetime</div>
	    															</th>
	    															
	    															<th class="gutter" style="width:0px; display:none;">
	    															</th>
	    														</tr>
	    													</thead>
	    												</table>
	    											</div>
	    											<div class="el-table__body-wrapper is-scrolling-left">
	    												<table cellspacing="0" cellpadding="0" border="0" class="el-table__body" style="width:100%;">
	    													<colgroup>
	    														<col name="el-table_11_column_80" width="12%">
	    														<col name="el-table_11_column_81" width="12%">
	    														<col name="el-table_11_column_82" width="11%">
	    														<col name="el-table_11_column_83" width="11%">
	    														<col name="el-table_11_column_84" width="11%">
	    														<col name="el-table_11_column_85" width="11%">
	    														<col name="el-table_11_column_86" width="16%">
	    														<col name="el-table_11_column_87" width="16%">

	    													</colgroup>
	    													<tbody></tbody>
	    												</table>
	    												
	    												
														<div class="el-table__empty-block" style="height:100%; width:100%;">
		    												<span class="el-table__empty-text">No Data</span>
		    											</div>
															
	    											</div>
	    										</div>
	    									</div>
	    								</div>
	    							</div>
	    						</div>
	    					</div>
	    				</div>
	    			</main>
	    		</section>
	    	</section>
	    </div>
	</div>
	<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
	<script src="./js/bootstrap.min.js"></script>

</body>

</html>