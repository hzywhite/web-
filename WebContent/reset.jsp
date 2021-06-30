
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@ page import="com.entity.*" %>
 <%@ page import="com.dao.*" %>
 <%@ page import="com.util.*" %>
 <%@ page import="java.util.*"%>
  <%@ page import="net.sf.json.JSONArray"%>
 <%@ page import="net.sf.json.JSONObject"%>
 <%@ page import="java.sql.ResultSet"%>
<html>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>reset</title>

</head>
<body>
	<%
		String phone = request.getParameter("phone");
		String sql = "update users set password=123456 where phone="+phone;
		DBconn.init();
		int flag = DBconn.addUpdDel(sql);
		if(flag == 1){
			request.getRequestDispatcher("manager_userInfo.jsp").forward(request, response);
		}else{
	%>
		   
	<%} %>
</body>
</html>