<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>电脑网站支付return_url</title>
</head>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.alipay.*"%>
<%@ page import="com.alipay.api.*"%>
<%@ page import="com.util.DBconn"%>
<%@ page import="com.alipay.api.internal.util.*"%>
<%
/* *
 * 功能：支付宝服务器同步通知页面
 * 日期：2017-03-30
 * 说明：
 * 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 * 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。


 *************************页面功能说明*************************
 * 该页面仅做页面展示，业务逻辑处理请勿在该页面执行
 */
 
	//获取支付宝GET过来反馈信息
	Map<String,String> params = new HashMap<String,String>();
	Map<String,String[]> requestParams = request.getParameterMap();
	for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
		String name = (String) iter.next();
		String[] values = (String[]) requestParams.get(name);
		String valueStr = "";
		for (int i = 0; i < values.length; i++) {
			valueStr = (i == values.length - 1) ? valueStr + values[i]
					: valueStr + values[i] + ",";
		}
		//乱码解决，这段代码在出现乱码时使用
		valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
		params.put(name, valueStr);
	}
	
	boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名

	//——请在这里编写您的程序（以下代码仅作参考）——
	if(signVerified) {
		//商户订单号
		String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
	
		//支付宝交易号
		String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
	
		//付款金额
		String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");
		
		System.out.println("out_trade_no"+out_trade_no+"trade_no"+trade_no+"total_amount"+trade_no);
		
		//DBconn.init();
  		//把out_trade_no划分为phone,flightno和seatno
  		
  		String[] str=out_trade_no.split("_");
  		String phone1 = str[0];
  		String seatno1 = str[1];
  		String flightno1 = str[2];
  		System.out.println("phone: "+phone1+"flightno: "+flightno1+"seatno: "+seatno1);
  		
  		
  		String phone = new String(phone1.getBytes("ISO-8859-1"),"UTF-8");
  		String flightno = new String(flightno1.getBytes("ISO-8859-1"),"UTF-8");
  		String seatno = new String(seatno1.getBytes("ISO-8859-1"),"UTF-8");
  		String wefly_Phone = new String(phone);
  		System.out.println("wefly_Phone: "+wefly_Phone+"flightno: "+flightno+"seatno: "+seatno);
   		
  		request.setAttribute("wefly_Phone",wefly_Phone);
  		
  		//更新数据库该条订单为paid
//   		int flag = DBconn.addUpdDel("update reservations set status = 'paid' where phone ='"+phone+"' and flightno = '"+flightno+"' and seatno = '"+seatno+"'");
//    		System.out.println("reserve:flag="+flag);
//    		DBconn.closeConn();
//    		if(flag==1) {
//    			request.getRequestDispatcher("order_ddcx.jsp").forward(request, response);
//    		}
//    		else{
//    			//out.println("trade_no:"+trade_no+"<br/>out_trade_no:"+out_trade_no+"<br/>total_amount:"+total_amount);
//    			out.println("ERROR OCCURED! PLEASE TRY AGAIN！");
//    		}
		request.getRequestDispatcher("order_ddcx.jsp").forward(request, response);
		System.out.println("return_url: success");
		
	}else {
		out.println("验签失败");
	}
	//——请在这里编写您的程序（以上代码仅作参考）——
%>
<body>
</body>
</html>