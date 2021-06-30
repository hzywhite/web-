<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
 <%@ page import="com.entity.*" %>
 <%@ page import="com.dao.*" %>
 <%@ page import="com.util.*" %>
 <%@ page import="java.util.*"%>
  <%@ page import="net.sf.json.JSONArray"%>
 <%@ page import="net.sf.json.JSONObject"%>
 <%@ page import="java.sql.ResultSet"%>
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
    <script type="text/javascript" language="javaScript">

	function del(url){
	if(confirm("Are you sure to delete this user information?")){//确定要删除该用户信息？
		
	window.location.href = "delselect.jsp?phone="+url;
	}
	
	document.form1.action("delselect.jsp?phone="+url);
	}
	function res(url){
	if(confirm("Are you sure to reset this user phone?")){//确定要重置该用户电话嘛？
			
	window.location.href = "reset.jsp?phone="+url;
	}
		
	document.form1.action("reset.jsp?phone="+url);
	}
	</script>
</head>

<body>
	
    <div class="topbar-warrper">
        <div class="topbar">
            <ul class="leftbar">
                <li><a class="logo" href="javascript:;">WeFly <i class="fas fa-plane"></i></a></li>
                <!-- <li><a href="javascript:;">Stays</a></li> -->
            </ul>
            <!-- <ul class="usersection">
                <li><a class="sign-in" href="./login.html"><i class="fas fa-user"></i>Sign in</a></li>
                <li><a class="sign-in" href="./register.html"><i class="fas fa-user"></i>Register</a></li>
                <li></i><a href="javascript:;"><i class="fas fa-flag"></i>CNï¿¥</a></li>
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
							     <li id="tab2" class="active"><a href="manager_userInfo.jsp">The user information</a></li>
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
	    							
	    							<div class="form-input flex-layout-js">
	    								<div class="menuflexitem-tr" style="display:none;">
	    								</div>
	    							</div>
	    							<div class="el-tabs el-tabs--card el-tabs--top">
	    								<div class="el-tabs__content">
	    									<div role="tabpanel" id="pane-first" aria-labelledby="tab-first" class="el-tab-pane">
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
	    														<col name="el-table_11_column_80" width="20%">
	    														<col name="el-table_11_column_81" width="20%">
	    														<col name="el-table_11_column_82" width="20%">
	    														<col name="el-table_11_column_83" width="20%">
																<col name="el-table_11_column_84" width="20%">
	    														<col name="gutter" width="0">
	    													</colgroup>
	    													<thead class="has-gutter">
	    														<tr class>
	    															<th colspan='1' rowspan="1" class="el-table_11_column_80 is-center is-leaf">
	    																<div class="cell">Name</div>
	    															</th>
	    															<th colspan='1' rowspan="1" class="el-table_11_column_81 is-center is-leaf">
	    																<div class="cell">IdNum</div>
	    															</th>
	    															<th colspan='1' rowspan="1" class="el-table_11_column_82 is-center is-leaf">
	    																<div class="cell">Phone</div>
	    															</th>
	    															<th colspan='1' rowspan="1" class="el-table_11_column_83 is-center is-leaf">
	    																<div class="cell">Password</div>
	    															</th>
	    															<th colspan='1' rowspan="1" class="el-table_11_column_84 is-center is-leaf">
	    																<div class="cell">operation</div>
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
	    														<col name="el-table_11_column_80" width="20%">
	    														<col name="el-table_11_column_81" width="20%">
	    														<col name="el-table_11_column_82" width="20%">
	    														<col name="el-table_11_column_83" width="20%">
																<col name="el-table_11_column_83" width="20%">
	    													</colgroup>
	    													<tbody>
	    												
		    												<%
		    												String sql = "select * from users;";
		    				                        		DBconn.init();
		    				                        		ResultSet rs = DBconn.selectSql(sql);
		    				                        		rs.last();
		    				                        		int rowCount = rs.getRow();
		    				                        		rs.beforeFirst();
		    				                        		if(rowCount==0){
		    				                        		%>
																<div class="el-table__empty-block" style="height:100%; width:100%;">
			    													<span class="el-table__empty-text">No Data</span>
			    												</div>
															<%}
															else{
																	while(rs.next()){ 
																	%>
																	
																	
																		<tr class="el-table-row">
																			<td rowspan="1" colspan="1" class="el-table_11_column_80 is-center">
																				<div class="cell"><%=rs.getString(1) %></div>
																			</td>
																			<td rowspan="1" colspan="1" class="el-table_11_column_81 is-center">
																				<div class="cell"><%=rs.getString(2) %></div>
																			</td>
																			<td rowspan="1" colspan="1" class="el-table_11_column_82 is-center">
																				<div class="cell"><%=rs.getString(3) %></div>
																			</td>
																			<td rowspan="1" colspan="1" class="el-table_11_column_83 is-center" style="font-size:25px;">
																			<%
																			String b = "";
																			for( int j=0;j < rs.getString(4).length();j++){
																				b=b+"*";
																			}
																			%>
																			
																				<div class="cell"><%=b %></div>
																			</td>
																			<td rowspan="1" colspan="1" class="el-table_11_column_84 is-center">
																				<form name="form1">
																					<input type="button" value="reset" Onclick="res(<%=rs.getString(3)%>)"/>
																					
																					<input type="button" value="delete" Onclick="del(<%=rs.getString(3)%>)"/> 
																				</form>
																			</td>																			
																		</tr>
																<%}
															} 
															%>
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