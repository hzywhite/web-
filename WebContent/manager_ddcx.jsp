<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
 <%@ page import="com.entity.*" %>
 <%@ page import="com.dao.*" %>
 <%@ page import="com.util.*" %>
 <%@ page import="java.util.*"%>
 <%@ page import="java.sql.*"%>
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
<%  System.out.println("manager_ddcx.jsp-----------------------------");
	String phone = request.getParameter("phone");
	System.out.println(phone);
	
	cityToCode code = new cityToCode();
	//String manager_From = code.citytocode(manager_from);
	//String manager_To = code.citytocode(manager_to);
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
							     <li id="tab1"><a href="manager.jsp">The flight information</a></li>
							     <li id="tab2"><a href="manager_userInfo.jsp">The user information</a></li>
							     <li id="tab3" class="active"><a href="manager_ddcx.jsp">The reservations</a></li>
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
		    									
		    									<form action="manager_ddcx.jsp" method = "post" autocomplete="off">
		    										<div class="el-input" style="width:200px; margin-right:10px;">
		    											<%if(phone==null) {%>
		    											<input type="text" name="phone" id="1" value="" autocomplete="on" placeholder="phone" class="el-input__inner">
		    											<%}else{ %>
		    											<input type="text" name="phone" id="1" value="<%=request.getParameter("phone")%>" autocomplete="on" placeholder="phone" class="el-input__inner">
		    											<%} %>
		    										</div>
		    										<a href="manager_ddcx.jsp?id=1&phone=<%=request.getParameter("phone")%>">
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
	    														<col name="el-table_11_column_80" width="7.2%">
	    														<col name="el-table_11_column_81" width="7%">
	    														<col name="el-table_11_column_82" width="7.2%">
	    														<col name="el-table_11_column_83" width="8.8%">
	    														<col name="el-table_11_column_84" width="7.2%">
	    														<col name="el-table_11_column_85" width="6.2%">
	    														<col name="el-table_11_column_86" width="7.2%">
	    														<col name="el-table_11_column_87" width="7.2%">
	    														<col name="el-table_11_column_88" width="7.2%">
	    														<col name="el-table_11_column_89" width="7.2%">
	    														<col name="el-table_11_column_90" width="7.2%">
	    														<col name="el-table_11_column_91" width="7.2%">
	    														<col name="el-table_11_column_92" width="6.4%">
	    														<col name="el-table_11_column_93" width="6.8%">
	    														

	    														<col name="gutter" width="0">
	    													</colgroup>
	    													<thead class="has-gutter">
	    														<tr clas="">
	    															<th colspan='1' rowspan="1" class="el-table_11_column_80 is-center is-leaf">
	    																<div class="cell">reservationID</div>
	    															</th>
	    															<th colspan='1' rowspan="1" class="el-table_11_column_81 is-center is-leaf">
	    																<div class="cell">Name</div>
	    															</th>
	    															<th colspan='1' rowspan="1" class="el-table_11_column_82 is-center is-leaf">
	    																<div class="cell">Phone</div>
	    															</th>
	    															<th colspan='1' rowspan="1" class="el-table_11_column_83 is-center is-leaf">
	    																<div class="cell">reserveDateTime</div>
	    															</th>
	    															<th colspan='1' rowspan="1" class="el-table_11_column_84 is-center is-leaf">
	    																<div class="cell">flightNo</div>
	    															</th>
	    															<th colspan='1' rowspan="1" class="el-table_11_column_85 is-center is-leaf">
	    																<div class="cell">seatNo</div>
	    															</th>
	    															<th colspan='1' rowspan="1" class="el-table_11_column_86 is-center is-leaf">
	    																<div class="cell">departPort</div>
	    															</th>
	    															<th colspan='1' rowspan="1" class="el-table_11_column_87 is-center is-leaf">
	    																<div class="cell">arrivalPort</div>
	    															</th>
	    															<th colspan='1' rowspan="1" class="el-table_11_column_88 is-center is-leaf">
	    																<div class="cell">departDate</div>
	    															</th>
	    															<th colspan='1' rowspan="1" class="el-table_11_column_89 is-center is-leaf">
	    																<div class="cell">departTime</div>
	    															</th>
	    															<th colspan='1' rowspan="1" class="el-table_11_column_90 is-center is-leaf">
	    																<div class="cell">arrivalDate</div>
	    															</th>
	    															<th colspan='1' rowspan="1" class="el-table_11_column_91 is-center is-leaf">
	    																<div class="cell">arrivalTime</div>
	    															</th>
	    															<th colspan='1' rowspan="1" class="el-table_11_column_92 is-center is-leaf">
	    																<div class="cell">Price</div>
	    															</th>
	    															<th colspan='1' rowspan="1" class="el-table_11_column_93 is-center is-leaf">
	    																<div class="cell">Status</div>
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
	    														<col name="el-table_11_column_80" width="7.2%">
	    														<col name="el-table_11_column_81" width="7%">
	    														<col name="el-table_11_column_82" width="7.2%">
	    														<col name="el-table_11_column_83" width="8.8%">
	    														<col name="el-table_11_column_84" width="7.2%">
	    														<col name="el-table_11_column_85" width="6.2%">
	    														<col name="el-table_11_column_86" width="7.2%">
	    														<col name="el-table_11_column_87" width="7.2%">
	    														<col name="el-table_11_column_88" width="7.2%">
	    														<col name="el-table_11_column_89" width="7.2%">
	    														<col name="el-table_11_column_90" width="7.2%">
	    														<col name="el-table_11_column_91" width="7.2%">
	    														<col name="el-table_11_column_92" width="6.4%">
	    														<col name="el-table_11_column_93" width="6.8%">
	    												

	    													</colgroup>
	    													<tbody>
	    													<%
	    													String sql = "";
	    													if(phone==null||"".equals(phone)){
	    														sql = "select * from reservations;";
	    													}
	    													else{
	    														sql = "select * from reservations where phone = '"+phone+"';";
	    													}
		    				                        		DBconn.init();
		    				                        		ResultSet rs = DBconn.selectSql(sql);
		    				                        		rs.last();
		    				                        		int rowCount = rs.getRow();
		    				                        		rs.beforeFirst();
		    				                        		if(rowCount==0){
		    				                        		%>
																<div class="el-table__empty-block" style="height:100%;">
			    													<span class="el-table__empty-text">No Data</span>
			    												</div>
															<%}
															else{
																	while(rs.next()){ 
															%>

																		<tr class="el-table-row">
																			<td rowspan="1" colspan="1" class="el-table_11_column_80 is-center">
																				<div class="cell"><%=rs.getString(18)%></div>
																			</td>
																			<td rowspan="1" colspan="1" class="el-table_11_column_81 is-center">
																				<div class="cell"><%=rs.getString(1)%></div>
																			</td>
																			<td rowspan="1" colspan="1" class="el-table_11_column_82 is-center">
																				<div class="cell"><%=rs.getString(4)%></div>
																			</td>
																			<td rowspan="1" colspan="1" class="el-table_11_column_83 is-center">
																				<div class="cell"><%=rs.getString(15)%></div>
																			</td>
																			<td rowspan="1" colspan="1" class="el-table_11_column_84 is-center">
																				<div class="cell"><%=rs.getString(5)%></div>
																			</td>
																			<td rowspan="1" colspan="1" class="el-table_11_column_85 is-center">
																				<div class="cell"><%=rs.getString(23)+"<br>No."+rs.getString(17)%></div>
																			</td>
																			<td rowspan="1" colspan="1" class="el-table_11_column_86 is-center">
																				<div class="cell"><%=rs.getString(20)+" "+rs.getString(11)%></div>
																			</td>
																			<td rowspan="1" colspan="1" class="el-table_11_column_87 is-center">
																				<div class="cell"><%=rs.getString(21)+" "+rs.getString(13)%></div>
																			</td>
																			<td rowspan="1" colspan="1" class="el-table_11_column_88 is-center">
																				<div class="cell"><%=rs.getString(6)%></div>
																			</td>
																			<td rowspan="1" colspan="1" class="el-table_11_column_89 is-center">
																				<div class="cell"><%=rs.getString(7)%></div>
																			</td>
																			<td rowspan="1" colspan="1" class="el-table_11_column_90 is-center">
																				<div class="cell"><%=rs.getString(8)%></div>
																			</td>
																			<td rowspan="1" colspan="1" class="el-table_11_column_91 is-center">
																				<div class="cell"><%=rs.getString(9)%></div>
																			</td>
																			<td rowspan="1" colspan="1" class="el-table_11_column_92 is-center">
																				<div class="cell"><%=rs.getString(14)%></div>
																			</td>
																			<td rowspan="1" colspan="1" class="el-table_11_column_93 is-center">
																				<div class="cell"><%=rs.getString(16)%></div>
																			</td>

																		</tr>
																<%}
																}%>
															</tbody>
														</table>
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