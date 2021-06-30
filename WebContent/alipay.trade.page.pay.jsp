<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>付款</title>
</head>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.alipay.*"%>
<%@ page import="com.alipay.api.*"%>
<%@ page import="com.alipay.api.request.*"%>
<%
	//获得初始化的AlipayClient
	AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
	
	//设置请求参数
	AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
	alipayRequest.setReturnUrl(AlipayConfig.return_url);//需要更改OrderServelet
	System.out.println(AlipayConfig.return_url);
	alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
	
	String phone = new String(request.getParameter("phone").getBytes("ISO-8859-1"),"UTF-8");
	String flightno = new String(request.getParameter("flightno").getBytes("ISO-8859-1"),"UTF-8");
	String seatno = new String(request.getParameter("seatno").getBytes("ISO-8859-1"),"UTF-8");
	
	//商户订单号，商户网站订单系统中唯一订单号，必填
	//String out_trade_no = new String(request.getParameter("tradeno").getBytes("ISO-8859-1"),"UTF-8");
	
	String temp = phone+"_"+seatno+"_"+flightno;
	System.out.println("temp: "+temp);
	String out_trade_no = new String(temp.getBytes("ISO-8859-1"),"UTF-8");
	
	//付款金额，必填
	String total_amount = new String(request.getParameter("price").getBytes("ISO-8859-1"),"UTF-8");
	//订单名称，必填
	String subject = new String(request.getParameter("WIDsubject").getBytes("ISO-8859-1"),"UTF-8");
	//String subject = total_amount;
	//商品描述，可空
	String body = new String(request.getParameter("WIDbody").getBytes("ISO-8859-1"),"UTF-8");
	
	
	alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
			+ "\"total_amount\":\""+ total_amount +"\"," 
			+ "\"subject\":\""+ subject +"\"," 
			+ "\"body\":\""+ body +"\"," 
			
			+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
	//+ "\"passback_params\":\""+ passback_params2 +"\","
	//	    + "\"passback_params\":\""+ passback_params3 +"\","
	//若想给BizContent增加其他可选请求参数，以增加自定义超时时间参数timeout_express来举例说明
	//alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
	//		+ "\"total_amount\":\""+ total_amount +"\"," 
	//		+ "\"subject\":\""+ subject +"\"," 
	//		+ "\"body\":\""+ body +"\"," 
	//		+ "\"timeout_express\":\"10m\"," 
	//		+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
	//请求参数可查阅【电脑网站支付的API文档-alipay.trade.page.pay-请求参数】章节
	//+ "\"return_url\":\""+AlipayConfig.return_url+"\","
	//请求
	System.out.println(4);
	String result = alipayClient.pageExecute(alipayRequest).getBody();
	System.out.println(5);
	//System.out.println("alipay_trade.jsp	"+result);
	//输出
	out.println(result);
%>
<body>
</body>
</html>