<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>退款</title>
</head>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.alipay.*"%>
<%@ page import="com.alipay.api.*"%>
<%@ page import="com.util.DBconn"%>
<%@ page import="com.alipay.api.request.*"%>
<%
	//获得初始化的AlipayClient
	AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
	
	//设置请求参数
	AlipayTradeRefundRequest alipayRequest = new AlipayTradeRefundRequest();
	
	String phone = new String(request.getParameter("phone").getBytes("ISO-8859-1"),"UTF-8");
	String flightno = new String(request.getParameter("flightno").getBytes("ISO-8859-1"),"UTF-8");
	String seatno = new String(request.getParameter("seatno").getBytes("ISO-8859-1"),"UTF-8");
	String wefly_Phone = new String(phone);
	//商户订单号，商户网站订单系统中唯一订单号
	//String out_trade_no = new String(request.getParameter("WIDTRout_trade_no").getBytes("ISO-8859-1"),"UTF-8");
	String temp = phone+"_"+seatno+"_"+flightno;
	System.out.println("temp: "+temp);
	String out_trade_no = new String(temp.getBytes("ISO-8859-1"),"UTF-8");
	//支付宝交易号
	//String trade_no = new String(request.getParameter("WIDTRtrade_no").getBytes("ISO-8859-1"),"UTF-8");
	//请二选一设置
	//需要退款的金额，该金额不能大于订单金额，必填
	String refund_amount = new String(request.getParameter("WIDTRrefund_amount").getBytes("ISO-8859-1"),"UTF-8");
	
	System.out.println("refund_amount: "+refund_amount);
	//退款的原因说明
	String refund_reason = new String(request.getParameter("WIDTRrefund_reason").getBytes("ISO-8859-1"),"UTF-8");
	//标识一次退款请求，同一笔交易多次退款需要保证唯一，如需部分退款，则此参数必传
	String temp1 = phone+"_"+flightno+"_"+seatno;
	System.out.println("out_request_no: "+temp1);
	String out_request_no = new String(temp1.getBytes("ISO-8859-1"),"UTF-8");
	
	alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
			+ "\"refund_amount\":\""+ refund_amount +"\"," 
			+ "\"refund_reason\":\""+ refund_reason +"\","
			+ "\"out_request_no\":\""+ out_request_no +"\"}");
			
	//+ "\"trade_no\":\""+ trade_no +"\","
	
	
	//请求
	String result = alipayClient.execute(alipayRequest).getBody();
// 	responseNode = str_replace(".","_",alipayRequest->getApiMethodName()) . "_response";
// 	resultCode =result->responseNode->code;\
	String str1 = "\"code\":\"10000\"";
	String str2 = "\"msg\":\"Success\"";
	String str3 = "\"fund_change\":\"Y\"";
	int flag1 = result.indexOf(str1)	;
	int flag2 = result.indexOf(str2)	;
	int flag3 = result.indexOf(str3)	;
	if(flag1>=0&&flag2>=0&&flag3>=0){
		System.out.println("refund success");
		DBconn.init();
		int flag = DBconn.addUpdDel("update reservations set status = 'refunded' where status = 'paid' and phone ='"+phone+"' and flightno = '"+flightno+"' and seatno = '"+seatno+"'");
		int flag4 = DBconn.addUpdDel("update reservations set refundamount = '"+refund_amount+"' where status = 'refunded' and phone ='"+phone+"' and flightno = '"+flightno+"' and seatno = '"+seatno+"'");
		
		System.out.println("refund:flag="+flag);
   		DBconn.closeConn();
   		if(flag==1&&flag4==1) {
   			request.getRequestDispatcher("order_ddcx.jsp").forward(request, response);
   		}
   		else{
   			//out.println("trade_no:"+trade_no+"<br/>out_trade_no:"+out_trade_no+"<br/>total_amount:"+total_amount);
   			out.println("ERROR OCCURED! PLEASE TRY AGAIN！");
   		}
		
		
	}
	System.out.println(result);
	//输出
	out.println(result);
%>
<body>
</body>
</html>