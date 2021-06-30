<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
 <%@ page import="com.entity.*" %>
 <%@ page import="com.dao.*" %>
 <%@ page import="java.util.*"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wefly</title>
    <link rel="stylesheet" href="./CSS/reset.css">
    <link rel="stylesheet" href="./CSS/base.css">
    <link rel="stylesheet" href="./CSS/wefly.css">
	<link rel="stylesheet" href="./fontawesome/css/all.css">
    <link rel="shortcut icon" href="./img/icon.png" type="image/x-icon">
    
</head>
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
    width: 355px;
    position: relative;
    z-index: 999999;
  }
  .showtocity{
    transform: translateX(421px);
  }
  .showfromcity li,
  .showtocity li {
    height: 40px;
    line-height: 40px;
    border
    padding-left: 16px;
    font-size: 15px;
    color: rgb(25, 28, 36);
    font-weight: 600;
    font-family: Arial;
  }
</style>
<body>

<%
 	
	//使用request.getAttribute从loginServlet传值到search.jsp，传值成功
	User userOnLoginInsearch = (User)request.getAttribute("userOnLogin");
	
	System.out.println("search.jsp--------------------------------------------------------------------------------------------------------------");
	/* System.out.println("got from userOnLoginsearch.jsp Name = "+userOnLoginInsearch.getName()); */
	String phone = null;
	
	phone = request.getParameter("phoneNumber");
	if(phone == null){
		phone = (String)session.getAttribute("wefly_Phone");
	}
	else{
		session.setAttribute("wefly_Phone", phone);
	}
	//从login页面传递方式拿到标签内参数
	/* System.out.println("search.jsp: username = "+username); */
	%>
    <div class="all">
        <div class="topbar-warrper">
            <div class="topbar w">
                <ul class="leftbar">
                    <li><a class="logo" href="./search.jsp">WeFly <i class="fas fa-plane"></i></a></li>
                    <li><a class="flights" href="javascript:;">Flights</a></li>
                    <!-- <li><a href="javascript:;">Stays</a></li> -->
                </ul>
                <ul class="usersection">
                
                    <li><a class="sign-in" href="order_ddcx.jsp"><i class="fas fa-user"></i>My Order</a></li>
                    <li><a href="./login.html"><i class="fas fa-user"></i>Sign out </a></li>
                    <li></i><a href="javascript:;"><i class="fas fa-flag"></i>CN￥</a></li>
                </ul>
            </div>
        </div>
        <div class="main">
            <div class="biglogo w">
                <div class="logocontainer">
                        WeFly
                        <i class="fas fa-plane"></i>
                </div>
                <div class="slogn">Smart search. Made simple.</div>
            </div>
            <div class="UIcontainer">
                <div class="link">
                    <div class="linkflights">
                        <a href="javascript:;"><i class="fas fa-plane"></i>Search Flights</a>
                    </div>
                </div>
                <div class="formcontainer">
                    <div class="form-flights">
                        <form action="reserve.jsp" method = "post" class="flights" autocomplete="off" style="positon:relative; height:390px; width:776px; text-align:center; margin:0 auto;">
                            <input type="text" name="from" id="1" value="" placeholder="From">
                             <svg t="1617869883896" class="iconarrow" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1451" width="200" height="200"><path d="M272.725333 524.16a42.666667 42.666667 0 0 1 59.648 61.013333L232.661333 682.666667H896a42.666667 42.666667 0 1 1 0 85.333333H232.661333l99.712 97.493333a42.666667 42.666667 0 1 1-59.648 61.013334l-174.549333-170.666667a42.666667 42.666667 0 0 1 0-61.013333l174.506667-170.666667z m478.549334-426.666667a42.666667 42.666667 0 1 0-59.648 61.013334L791.338667 256H128a42.666667 42.666667 0 1 0 0 85.333333h663.338667l-99.712 97.493334a42.666667 42.666667 0 1 0 59.648 61.013333l174.549333-170.666667a42.666667 42.666667 0 0 0 0-61.013333l-174.506667-170.666667z" fill="#ffffff" p-id="1452"></path></svg>
                            <input type="text" name="to" id="2" value="" placeholder="To">
                            <div class="showfromcity">
				            <ul id="fromcitylist">
				            </ul>
				          </div>
				          <div class="showtocity">
				            <ul id="tocitylist">
				            </ul>
				          </div>
                            <BR></BR>
                            <input type="date" name="date" id = "3" value="" style="position:absolute; top:140px;">
                            
                            <BR>
                            
                            <a href="reserve.jsp?id=1&name=from,id=2&name=to,id=3&name=date" style="position:absolute; top:200px; left:0; right:0;"><button type="submit" class="submit">Find</button></a>
                        	
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="imglist-warpper">
            
        </div>
    </div>
</body>
</html>