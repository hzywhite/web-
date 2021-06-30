
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
<title>update</title>

</head>
<body>
	<%
		String phone = request.getParameter("phone");
		String newp = request.getParameter("newpassword");
		System.out.println(phone);
		System.out.println(newp);
		String sql = "update users set password="+newp+" where phone="+phone;
		DBconn.init();
		int flag = DBconn.addUpdDel(sql);
		if(flag == 1){
			request.getRequestDispatcher("login.html").forward(request, response);
		}else{
	%>
		   
	<%} %>
</body>
</html>