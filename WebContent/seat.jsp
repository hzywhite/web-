<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
  <HTML>
  <HEAD>
  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="expires" content="0">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <TITLE> New Document </TITLE>
  <script>
     //定义了城市的二维数组，里面的顺序跟省份的顺序是相同的。通过selectedIndex获得省份的下标值来得到相应的城市数组
     var city=[
     ["北京","天津","上海","重庆"],
     ["南京","苏州","南通","常州"],
     ["福州","福安","龙岩","南平"],
     ];
 	 
     function getCity(){
         //获得省份下拉框的对象
         var sltProvince=document.form1.province;
         //获得城市下拉框的对象
         var sltCity=document.form1.city;
         
         //得到对应省份的城市数组
         var provinceCity=city[sltProvince.selectedIndex - 1];
 
         //清空城市下拉框，仅留提示选项
         sltCity.length=1;
 
         //将城市数组中的值填充到城市下拉框中
         for(var i=0;i<provinceCity.length;i++){
			 //Option(选项描述，选项值) 等价于 <option value="选项值" >选项描述</option>;
             sltCity[i+1]=new Option(provinceCity[i],provinceCity[i]);
         }
     }
 </script>
 </HEAD>
 
 <BODY>
 <FORM METHOD=POST ACTION="" name="form1">
         <SELECT NAME="province" onChange="getCity()">
             <OPTION VALUE="0">Choose Cabin </OPTION>
             <OPTION VALUE="Economy Class">Economy Class </OPTION>
             <OPTION VALUE="Business Class"> Business Class</OPTION>
             <OPTION VALUE="First Class">First Class</OPTION>
             <OPTION VALUE="Bargin Class">Bargin Class</OPTION>
         </SELECT>
         <SELECT NAME="city">
             <OPTION VALUE="0">Choose Price </OPTION>
         </SELECT>
     </FORM>
 </BODY>
 </HTML>