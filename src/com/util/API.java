package com.util;

import java.util.HashMap;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;

import com.dao.HttpUtils;

public class API {
		public static void main(String[] args) {
		    String host = "https://flight.market.alicloudapi.com";
		    String path = "/flight/query";
		    String method = "ANY";
		    String appcode = "dcd8952b286b4521a1db781007cd1825";
		    Map<String, String> headers = new HashMap<String, String>();
		    //�����header�еĸ�ʽ(�м���Ӣ�Ŀո�)ΪAuthorization:APPCODE 83359fd73fe94948385f570e3c139105
		    headers.put("Authorization", "APPCODE " + appcode);
		    //����API��Ҫ�󣬶������Ӧ��Content-Type
		    headers.put("Content-Type", "application/json; charset=UTF-8");
		    Map<String, String> querys = new HashMap<String, String>();
		    querys.put("city", "XIY");
		    //querys.put("date", "date");
		    querys.put("endcity", "PEK");
		    System.out.println("XIY"+"PEK");

		    try {
		    	/**
		    	* ��Ҫ��ʾ����:
		    	* HttpUtils���
		    	* https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/src/main/java/com/aliyun/api/gateway/demo/util/HttpUtils.java
		    	* ����
		    	*
		    	* ��Ӧ�����������
		    	* https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/pom.xml
		    	*/
		    	System.out.println(host+path+method);
		    	HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
		    	System.out.println(response.toString());
		    	//��ȡresponse��body
		    	System.out.println(EntityUtils.toString(response.getEntity(),"utf-8"));
		    	
		    } catch (Exception e) {
		    	e.printStackTrace();
		    }
		}
}
