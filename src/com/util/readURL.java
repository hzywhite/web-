package com.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class readURL {

	public String loadJson(String url) {
        StringBuilder json = new StringBuilder();
        try {
            URL urlObject = new URL(url);
            URLConnection uc = urlObject.openConnection();
            BufferedReader in = new BufferedReader(new InputStreamReader(uc.getInputStream(), "utf-8"));
            String inputLine = null;
            while ( (inputLine = in.readLine()) != null) {
                json.append(inputLine);
            }
            in.close();
        } catch (MalformedURLException e) {
        	e.printStackTrace();
        } catch (IOException e) {
        	e.printStackTrace();
        }
        return json.toString();
    }
	
	public static void parseJson(String json) {
	   //json是调用接口之后返回的String类型的json串
		try {
			System.out.println(json);
			JSONObject obj = JSONObject.fromObject(json);
			System.out.println(obj);
			
			String message = obj.getString("msg");
			System.out.println("msg:"+message);
			
			JSONObject result = obj.getJSONObject("result");
			System.out.println(result.toString());
			
			String city = result.getString("city");
			String endcity = result.getString("endcity");
			String date = result.getString("date");
			System.out.println("city:" + city);
			System.out.println("endcity:"+endcity);
			System.out.println("date:"+date);
			
			JSONArray list = result.getJSONArray("list");
			System.out.println(list.toString());
			
			for(int i = 1;i <= list.length();i++) {
				JSONObject flight = list.getJSONObject(i-1);
				System.out.println("第"+i+"组数据:");
				String flightno = flight.getString("flightno");
				System.out.println("flightno:"+flightno);
				String airline = flight.getString("airline");
				System.out.println("airline:"+airline);
				String departport = flight.getString("departport");
				System.out.println("departport:"+departport);
				String departterminal = flight.getString("departterminal");
				System.out.println("departterminal:"+departterminal);
				String arrivalport = flight.getString("arrivalport");
				System.out.println("arrivalport:"+arrivalport);
				String arrivalterminal = flight.getString("arrivalterminal");
				System.out.println("arrivalterminal:"+arrivalterminal);
				String departdate = flight.getString("departdate");
				System.out.println("departdate:"+departdate);
				String departtime = flight.getString("departtime");
				System.out.println("departtime:"+departtime);
				String arrivaldate = flight.getString("arrivaldate");
				System.out.println("arrivaldate:"+arrivaldate);
				String arrivaltime = flight.getString("arrivaltime");
				System.out.println("arrivaltime:"+arrivaltime);
				String stopnum = flight.getString("stopnum");
				System.out.println("stopnum:"+stopnum);
				String costtime = flight.getString("costtime");
				System.out.println("costtime:"+costtime);
				String punctualrate = flight.getString("punctualrate");
				System.out.println("punctualrate:"+punctualrate);

				JSONArray pricelist = flight.getJSONArray("pricelist");
				System.out.println(pricelist.toString());
				for(int j = 1;j <= pricelist.length();j++) {
					JSONObject cabin = pricelist.getJSONObject(j-1);
					System.out.println("第"+j+"个舱位:");
					String cabinname = cabin.getString("cabinname");
					System.out.println("cabinname:"+cabinname);
					String cabincode = cabin.getString("cabincode");
					System.out.println("cabincode:"+cabincode);
					String price = cabin.getString("price");
					System.out.println("price:"+price);
				}
			}
		} catch (Exception e) {
        	e.printStackTrace();
        }
	}
	
	
}
