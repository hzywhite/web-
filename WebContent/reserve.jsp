<!DOCTYPE html>
<%!int maxn = 0;//记录list.length() %>
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
    <title>Flight Information</title>
    <link rel="stylesheet" href="./CSS/reset.css">
    <link rel="stylesheet" href="./CSS/base.css">
    <link rel="stylesheet" href="./CSS/reserve.css">
    <link rel="stylesheet" href="./fontawesome/css/all.css">
    <link rel="shortcut icon" href="./img/icon.png" type="image/x-icon">
    <link rel="stylesheet" href="./font/iconfont.css">
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
</head>
<%
	int maxn=0; 
%>
<script type="text/javascript" language="javaScript">
  window.onload = () => {
    // var input = document.getElementById('1');
    var inputlist = document.getElementsByTagName('input');
    var showcitylist = document.getElementById('showcitylist');
    var tocitylist = document.getElementById('tocitylist');
    var frominput = inputlist[0];
    var toinput = inputlist[1];
    var val = null;
    var clearIT = null;
    var citystr =
      '北京首都国际机场 PEK Beijing  上海浦东国际机场 PVG Shanghai  广州白云国际机场 CAN Guangzhou  上海虹桥国际机场 SHA Shanghai  深圳宝安国际机场 SZX Shenzhen  成都双流国际机场 CTU Chengdu  昆明巫家坝国际机场 KMG Kunming  海口美兰机场 HAK Haikou  西安咸阳国际机场 XIY Xian  杭州萧山国际机场 HGH Hangzhou  厦门高崎国际机场 XMN Xiamen  重庆江北国际机场 CKG Chongqing  青岛流亭机场 TAO Qingdao  大连周水子国际机场 DLC Dalian  南京禄口国际机场 NKG Nanjing  武汉天河机场 WUH Wuhan  沈阳桃仙国际机场 SHE Shenyang  乌鲁木齐地窝堡国际机场 URC Urumqi  长沙黄花国际机场 CSX Changsha  福州长乐国际机场 FOC Fuzhou  桂林两江机场 KWL Guilin  哈尔滨太平国际机场 HRB Harbin  贵阳龙洞堡机场 KWE Guiyang  郑州新郑国际机场 CGO Zhengzhou  三亚凤凰机场 SYX Sanya  温州永强机场 WNZ Wenzhou  济南遥墙机场 TNA Jinan  宁波栎社机场 NGB Ningbo  天津滨海国际机场 TSN Tianjin  太原武宿机场 TYN Taiyuan  南宁吴圩机场 NNG Nanning  南昌昌北机场 KHN Nanchang  长春大房身机场 CGQ Changchun  张家界荷花机场 DYG Zhangjiajie  合肥骆岗机场 HFE Hefei  西双版纳嘎洒机场 JHG Xishuangbanna  泉州晋江机场 JJN Jinjiang  兰州中川机场 LHW Lanzhou  烟台莱山机场 YNT Yantai  九寨黄龙机场 JZH Jiuzhaigou  丽江三义机场 LJG Lijiang  汕头外砂机场 SWA Shantou  呼和浩特据白塔机场 HET Hohhot  拉萨贡嘎机场 LXA Lhasa  珠海三灶机场 ZUH Zhuhai  银川河东机场 INC Yinchuan  延吉朝阳川机场 YNJ Yanji  武夷山机场 WUS Wuyishan  西宁曹家堡机场 XNN Xining  湛江机场 ZHA Zhanjiang  舟山机场 HSN Zhoushan  黄山屯溪机场 TXN Huangshan  宜昌三峡机场 YIH Yichang  喀什机场 KHG Kashgar  包头二里半机场 BAV Baotou  伊宁机场 YIN Yining  大理机场 DLU Dali  北海福成机场 BHY Beihai  石家庄正定机场 SJW Shijiazhuang  常州奔牛机场 CZX Changzhou  库尔勒机场 KRL Korla  黄岩路桥机场 HYN Huangyan  义乌机场 YIW Yiwu  攀枝花保安营机场 PZI Panzhihua  敦煌机场 DNH Dunhuang  阿勒泰机场 AAT Altay  绵阳南郊机场 MIG Mianyang  牡丹江海浪机场 MDG Mudanjiang  徐州观音机场 XUZ Xuzhou  宜宾莱坝机场 YBP Yibin  威海机场 WEH Weihai  西昌青山机场 XIC Xichang  柳州白莲机场 LZH Liuzhou  海拉尔东山机场 HLD Hulunbuir  阿克苏机场 AKU Aksu  景德镇机场 JDZ Jingdezhen  连云港白塔埠机场 LYG Lianyungang  南通兴东机场 NTG Nantong  泸州蓝田机场 LZO Luzhou  和田机场 HTN Hetian  榆林西沙机场 UYN Yulin  洛阳北郊机场 LYA Luoyang  临沧机场 LNJ Lincang  铜仁大兴机场 TEN Tongren  常德桃花源机场 CGD Changde  保山机场 BSD Baoshan  临沂机场 LYI Linyi  佳木斯东郊机场 JMU Jiamusi  长治王村机场 CIH Changzhi  梅县机场 MXZ Meizhou  齐齐哈尔三家子机场 NDG Qiqihar  汉中机场 HZG Hanzhong  赣州黄金机场 KOW Ganzhou  塔城机场 TCG Tacheng  延安二十里堡机场 ENY Yanan  潍坊机场 WEF Weifang  库车机场 KCA Kuqa  丹东浪头机场 DDG Dandong  赤峰机场 CIF Chifeng  吉林二台子机场 JIL Jilin  南阳姜营机场 NNY Nanyang  盐城机场 YNZ Yancheng  嘉峪关机场 JGN Jiayuguan  思茅机场 SYM Puer  秦皇岛山海关机场 SHP Qinhuangdao  锡林浩特机场 XIL Xilinhot  锦州小领子机场 JNZ Jinzhou  乌兰浩特机场 HLH Ulanhot  通辽机场 TGO Tongliao  东营机场 DOY Dongying  乌海机场 WUA Wuhai  衢州机场 JUZ Quzhou  连城机场 LCX Liancheng  阜阳机场 FIG Fuyang  安庆机场 AQG Anqing  且末机场 IQM Qiemo  香港国际机场 HKG HongKong  台北松山机场 TSA Taipei  台湾桃园国际机场 TPE Taiwan'
    var i = 0;
    var cityarr = [];
    while (citystr.match(/\s/g)) {
      citystr = citystr.replace(' ', ',');
      citystr = citystr.replace(' ', ',');
      citystr = citystr.replace('  ', ',');
    }
    citystr = citystr.split(',');
    for (let i = 0; i < citystr.length / 3; i++) {
      cityarr[i] = {
        airport: citystr[3 * i],
        TW: citystr[3 * i + 1],
        city: citystr[3 * i + 2],
        show: false
      }
    }
    frominput.onfocus = function(){inputfous(frominput);} 
    frominput.onblur = function(){inputblur(frominput);}
    toinput.onfocus = function(){inputfous(toinput);}
    toinput.onblur = function(){inputblur(toinput);}
    //  模糊搜索函数
    function searchinput(info, event) {
      var id = event.id;

      if(id == 1){showcitylist = document.getElementById('fromcitylist');} else if(id == '2'){showcitylist = document.getElementById('tocitylist');}
      
      if (info) {
        var meg = new RegExp(info);
        var cityinfo = {};
        for (let i = 0; i < cityarr.length; i++) {
          cityinfo = cityarr[i];
          if (cityinfo.city.match(meg) && cityinfo.show !== true) {
            var node = document.createElement('li');
            node.id = cityinfo.city;
            var nid = node.id;
            (function(nid){node.onmousedown = function () {lifous(nid,id);}})(nid,id);
            // node.onmousedown = function () {lifous(node.id);}
            node.textContent = cityinfo.city;
            showcitylist.appendChild(node);
            cityinfo.show = true;
          }
          if(cityinfo.show == true && !cityinfo.city.match(meg)) {
            cityinfo.show = false;
            for(let i=0; i<showcitylist.childNodes.length ;i++){
              if(cityinfo.city == showcitylist.childNodes[i].innerHTML){
                showcitylist.removeChild(showcitylist.childNodes[i]);
              }
            }
          } 
        }
      } else {
        clearinput(event);
      }
    }

    function clearinput(event) {
      var id = event.id;

      if(id == '1'){fromcitylist.innerHTML = '';} else if(id == '2'){tocitylist.innerHTML = '';}
      
      for (let i = 0; i < cityarr.length; i++) {
        cityarr[i].show = false;
      }
    }

    function inputfous(event) {
      clearIT = setInterval(() => {
      val = event.value;
      searchinput(val,event);
      }, 10);
    }

    function inputblur(event) {
      clearInterval(clearIT);
      clearinput(event);
    }

    function lifous (node,id) {
      var input = null;
      
      if(id == 1){input = document.getElementById('1');} else if(id == '2'){input = document.getElementById('2');}

      input.value = node;
    }
  }
</script>
<style>
  .showfromcity,
  .showtocity {
    display: block;
    background: #fff;
    width: 269px;
    position: relative;
    z-index: 999999;
  }
  .showtocity{
    transform: translateX(274px);
  }
  .showfromcity li,
  .showtocity li {
    height: 40px;
    line-height: 40px;
    padding-left: 16px;
    font-size: 15px;
    color: rgb(25, 28, 36);
    font-weight: 600;
    font-family: Arial;
  }
</style>
<body>
    <%
    System.out.println("reserve.jsp-----------------------------");
    String phone = (String)session.getAttribute("wefly_Phone");
    System.out.println(phone);

   	FlightsDaoImpl flightSQLResult = new FlightsDaoImpl();

   	String from = request.getParameter("from");
   	String to = request.getParameter("to");
   	String date = request.getParameter("date");
   
   	System.out.println(from);
   	System.out.println(to);
   	System.out.println(date);
   	session.setAttribute("wefly_date", date);
	
   	
%>


     <div class="topbar-warrper">
         <div class="topbar w">
             <ul class="leftbar">
                 <li><a class="logo" href="./search.jsp">WeFly <i class="fas fa-plane"></i></a></li>
                 <li><a class="flights" href="javascript:;">Flights</a></li>
                 <!-- <li><a href="javascript:;">Stays</a></li> -->
             </ul>
             <ul class="usersection">
             	<%System.out.println(phone+"hello"); %>
             	 <li><a class="sign-in" href="order_zhxx.jsp?phone=<%=phone%>"><i class="fas fa-user"></i>My Order</a></li>
                 <li><a class="sign-in" href="./login.html   "><i class="fas fa-user"></i>Sign out</a></li>
                 <!-- <li><a class="sign-in" href="./register.html"><i class="fas fa-user"></i>Register</a></li> -->
                 <li><a href="javascript:;"><i class="fas fa-flag"></i>CN￥</a></li>
             </ul>
         </div>
     </div>
     <div class="main">
         <div class="searchline-warpper">
             <div class="searchline">
                 <form action="#" class="searchline" method="POST">
                 <!-- 上方的FROM 和 TO -->
                 <%
                 //拿到用户填入的信息
                 
                 %>
                 
                     <input type="text" name="from" id="1" value = "<%=from%>" placeholder="From" class="from">
                     <input type="text" name="to" id="2" value ="<%=to%>" placeholder="To" class="to">
                     <input type="date" name="date" id="3" value="<%=date%>">
                     <a href="reserve.jsp?id=1&name=from,id=2&name=to,id=3&name=date">
                         <button type="submit"
                                 class="submit">
                             <i class="icon iconfont">&#xe7fc;</i>
                         </button>
                     </a>
                     <div class="showfromcity">
			            <ul id="fromcitylist">
			            </ul>
			          </div>
			          <div class="showtocity">
			            <ul id="tocitylist">
			            </ul>
			          </div>
                 </form>
             </div>
         </div>
         
         <%if("".equals(from) || "".equals(to)){%>
			<div style="text-align:center;margin-top:120px;font-size:50px;">Null input!</div>
		 <%}else
		 	{
         	cityToCode code = new cityToCode();
        	String From = code.citytocode(from);
        	String To = code.citytocode(to);
        	
        	FlightsDaoImpl flightDaoImpl = new FlightsDaoImpl();
        	String json = null;
        	if("".equals(date)){
        		json = flightDaoImpl.api(From, To);
        	}
        	else{
        		json = flightDaoImpl.api_date(From, To, date);
        	}
        	
	     	System.out.println(json);
	     	JSONObject obj = JSONObject.fromObject(json);
	     	System.out.println("josn obj!!");
	     	String message = obj.getString("msg");
	     	System.out.println(message);
	     	String errorCode = obj.getString("status");
	     	System.out.println(errorCode);
	     	
	     	if(errorCode.equals("210")||errorCode.equals("201")||errorCode.equals("209")){%>
			<div style="text-align:center;margin-top:120px;font-size:50px;">No Flights!</div>
			<%}else{
	     	
	     	JSONObject result = obj.getJSONObject("result");
	     	System.out.println(result.toString());
	     	
	     	JSONArray list = result.getJSONArray("list");
	     	maxn = list.length();%>
         	
         <!-- 主容器 -->
         <div class="information-list-warpper">
             <!-- 航班信息列表容器 -->
             <div class="information-list-div w">
                 <!-- 航班信息列表 -->
                 <!-- 1111111111111--------------------------------------------------------------------------------------------------- -->
                 <ul class="information-list">
                     <!-- 单个航班信息 -->
                     <%for(int i = 1;i <= list.length();i++){ 
						JSONObject flight = list.getJSONObject(i-1);%>
                     	<li class="informations">
                     	 
	                         <!-- 航班详细信息 -->
	                         <div class="flightsall">
	                             <!-- 左侧航班信息 -->
	                             <ol class="flights-list">
	                                 <!-- 前往航班信息 -->
	                                 <li class="from-flights-information-warpper">
	                                     <div class="from-flights-information">
	                                         <!-- 前往航空公司图标 -->
	                                         <div class="from-icon i"><i class="icon iconfont">&#xe62c;</i></div>
	                                         <!-- 航空公司+航班号+机型-->
	                                         <div class="section-time">
	                                               <%
	                                               String departure = (String)session.getAttribute("wefly_date");
	                                           
	                                             %>
	                                             <div class="top"> 
	                                            	<%=flight.getString("airline")+"</br>" %>
	                                             	<%=flight.getString("flightno")+" "+flight.getString("craft")%>
	                                             </div>
	                                             
	                                         </div>
	                                         <!-- 时间+机场航站楼+总时间+中转次数 -->
	                                         <div class="section-stops">
	                                             <div class="top">
	                                             <%=flight.getString("costtime") %><br>
	                                             
	                                             <span class="bigfont">
	                                             <%=flight.getString("departtime")%>
	                                             </span>
	                                             
	                                             <span class="bigarrow">———</span>
	                                             
	                                             <span class="bigfont">
	                                             <%=flight.getString("arrivaltime")%>
	                                             </span>
	                                             <br><br>
	                                             <span style="float:left;"><%=flight.getString("departport")+flight.getString("departterminal")%></span>
												 <span style="float:right;"><%=flight.getString("arrivalport")+flight.getString("arrivalterminal")%></span>
	                                             
	                                             </div>
	                                             <div class="bottom"></div>
	                                         </div>
	                                         <!-- 准点率 -->
	                                         <div class="section-duration">
	                                             <div class="top">
	                                             	 <%="Punctual Rate</br>"+flight.getString("punctualrate")+"%" %>
												 </div>
	                                             <div class="bottom"></div>
	                                         </div>
	                                     </div>
	                                 </li>                                 
	                             </ol>
	                             <!-- 右侧价格界面 -->
	                             <div class="price-warpper">
	                                 <!-- 钱包图标 -->
	                                 <i class="icon iconfont">&#xe60e;</i>
	                                 <!-- 详细价格 -->
	                                 <%String first_price = "0";
	                                 String bussiness_price = "0";
	                                 String economy_price = "0";
	                                 String orderPrice="0";
	                                 JSONArray pricelist = flight.getJSONArray("pricelist");
	                                 //int [][]price = new int[3][];
// 	                                 List<List<Integer>> price=new ArrayList<List<Integer>>();
// 	                                 List<Integer> FirstRow=new ArrayList<Integer>();
// 	                                 List<Integer> SecRow=new ArrayList<Integer>();
// 	                                 List<Integer> ThirdRow=new ArrayList<Integer>();
	                                 
                                	 for(int j = 1;j <= pricelist.length();j++) {
                                		 JSONObject cabin = pricelist.getJSONObject(j-1);
                                		 String cabinname = cabin.getString("cabinname");
                                		 if(cabinname.compareTo("头等舱") == 0)
                                			 first_price = cabin.getString("price");
                                			 
                                		 if(cabinname.compareTo("公务舱") == 0)
	                                		 bussiness_price = cabin.getString("price");
                                		 	 
                                		 if(cabinname.compareTo("经济舱") == 0)
                                			 economy_price = cabin.getString("price");
                                		     
                                	 }
                                	 System.out.println("first_price:"+first_price+" bussiness_price:"+bussiness_price+" economy_price:"+economy_price);
                                	 
                                	 if(first_price == null && bussiness_price == null && economy_price == null){
                                		 first_price="0";
                                		 bussiness_price="0";
                                		 economy_price="0";
	                                 %>
	                                 
	                                 
	                                 <div class="price">No Seats ￥<%=0%></div>
	                                 <% }else{
	                                	 System.out.println("i:"+i);
	                                	 /*if (first_price == null){
	                                		 first_price="0";
	                                	 }
	                                	 if (bussiness_price == null){
	                                		 bussiness_price="0";
	                                	 }
	                                	 if (economy_price == null){
	                                		 economy_price="0";
	                                	 }*/
	                                 %>
	                                 ￥
										     <input name="price1" id="price<%=i %>1"  style="display: block;background-color:transparent;border:0;width:50px;height:17px;float:right;margin-right:46px;"  value="<%=economy_price%>" readonly="true">
										     <input name="price2" id="price<%=i %>2"  style="display: none;background-color:transparent;border:0;width:50px;height:17px;float:right;margin-right:46px;"  value="<%=bussiness_price%>" readonly="true">
										     <input name="price3" id="price<%=i %>3"  style="display: none;background-color:transparent;border:0;width:50px;height:17px;float:right;margin-right:46px;" value="<%=first_price%>" readonly="true">
	                                 <form action="order?orderid=<%=i %>" method = "post"> 
	                                 	<div class="price">
										     <table>
										     <tr><td><input id="w<%=i %>1" type="radio" name="cla<%=i %>" checked="checked" value="price1"></td><td>Economy</td></tr>
	        								 <tr><td><input id="w<%=i %>2" type="radio" name="cla<%=i %>" value="price2"></td><td>Business</td></tr>
	        								 <tr><td><input id="w<%=i %>3" type="radio" name="cla<%=i %>" value="price3"></td><td>First</td></tr>
										     </table>
										     <!-- 后端先获取name=cla的value，根据price1price2price3再获取name等于price1price2price3的值就是相对应的价格 -->
										     <input name="price1" id="price<%=i %>1"  style="display: none;background-color:transparent;border:0;width:50px;height:17px;float:right;margin-right:46px;"  value="<%=economy_price%>" readonly="true">
										     <input name="price2" id="price<%=i %>2"  style="display: none;background-color:transparent;border:0;width:50px;height:17px;float:right;margin-right:46px;"  value="<%=bussiness_price%>" readonly="true">
										     <input name="price3" id="price<%=i %>3"  style="display: none;background-color:transparent;border:0;width:50px;height:17px;float:right;margin-right:46px;" value="<%=first_price%>" readonly="true">
										     
	                                 	</div>   
	                                 <%} %>
	                                  
	                                 <!-- 订购按钮 -->
	                                 <!-- 生成的数据传送到OrderServlet去进行存数据库 -->
	                                 <% String reservationtime = null;%>
	                                	
	                                 	<input name="phone" style="display: none" value = "<%=phone %>">
	                                 	<input name="city" style="display: none" value ="<%=From %>">
	                                 	<input name="endcity" style="display: none" value ="<%=To %>">
	                             		
	                                 	<input name="airline" style="display: none" value ="<%=flight.getString("airline") %>">
                        			 	<input name="flightno" style="display: none" value ="<%=flight.getString("flightno") %>">
                        			 	<input name="departdate" style="display: none" value = "<%=flight.getString("departdate") %>">
                         			 	<input name="departtime" style="display: none" value = "<%=flight.getString("departtime") %>">
                         			 	<input name="arrivaldate" style="display: none" value = "<%=flight.getString("arrivaldate") %>">
                         			 	<input name="arrivaltime" style="display: none" value = "<%=flight.getString("arrivaltime") %>">
                         			 	<input name="departport" style="display: none" value = "<%=flight.getString("departport") %>">
                         			 	<input name="departportcode" style="display: none" value = "<%=flight.getString("departportcode") %>">
                         			 	<input name="departterminal" style="display: none" value = "<%=flight.getString("departterminal") %>">
                         			 	<input name="arrivalport" style="display: none" value = "<%=flight.getString("arrivalport") %>">
                         			 	<input name="arrivalportcode" style="display: none" value = "<%=flight.getString("arrivalportcode") %>">
                         			 	<input name="arrivalterminal" style="display: none" value = "<%=flight.getString("arrivalterminal") %>">
										<%-- <input name="minprice" style="display: none" value = "<%=orderPrice %>"> --%>
                         			 	<input name="reservationtime" style="display: none" value = "<%=reservationtime%>">
                         			 	<a href="order_ddcx.jsp?name=city,name=endcity,name=phone,name=flightno,name=departdate,name=departtime,name=arrivaldate,name=arrivaltime,name=departport,name=departterminal,name=arrivalport,name=arrivalterminal,name=minprice,name=reservationtime"><button type="submit" class="view-button" style="margin-bottom: 10px;margin-top: 10px;position: absolute;bottom: 0;">Buy Now!</button></a>
	                                 </form>
	                             </div>
	                         </div>
	                       
	                     </li>
	                  <%}}}%>
                     
                 </ul>
             </div>
         </div>
         
     </div>
     
</body>
<script>
$().ready(function(){
    //用的jquery，第7行的外包需要引入
    for(var i=1;i<=<%=maxn%>;i++){
        change(i)
    }
    function change(i){
        $("#w"+i+"1").click(function(){
            $("#price"+i+"1").css("display","block");
            $("#price"+i+"2").css("display","none");
            $("#price"+i+"3").css("display","none");
        })
        $("#w"+i+"2").click(function(){
            $("#price"+i+"1").css("display","none");
            $("#price"+i+"2").css("display","block");
            $("#price"+i+"3").css("display","none");
        })
        $("#w"+i+"3").click(function(){
            $("#price"+i+"3").css("display","block");
            $("#price"+i+"2").css("display","none");
            $("#price"+i+"1").css("display","none");
        })
    }
})
    
</script>
</html>