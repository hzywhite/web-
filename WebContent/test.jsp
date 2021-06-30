<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%!int maxn = 0; %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
        <title>Document</title>
    </head>
   
    <body> 
        <%
     	  maxn = 3;  //全局变量
     	%>
        <div>
            <input id="w11" type="radio" name="cla1" checked="checked"
                value="price1">经济舱
            <input id="w12" type="radio" name="cla1" value="price2">商务舱
            <input id="w13" type="radio" name="cla1" value="price3">头等舱
            <!-- 后端先获取name=cla的value，根据price1price2price3再获取name等于price1price2price3的值就是相对应的价格 -->
            <!-- 依据价格改变100，200，300 -->
            <input id="price11" style="display: block;" name="price1"
                value="100">
            <input id="price12" style="display: none;" name="price3"
                value="300">
            <input id="price13" style="display: none;" name="price2"
                value="200">
        </div>
        <div>
            <input id="w21" type="radio" name="cla2" checked="checked"
                value="price1">经济舱
            <input id="w22" type="radio" name="cla2" value="price2">商务舱
            <input id="w23" type="radio" name="cla2" value="price3">头等舱
            <!-- 后端先获取name=cla的value，根据price1price2price3再获取name等于price1price2price3的值就是相对应的价格 -->
            <!-- 依据价格改变100，200，300 -->
            <input id="price21" style="display: block;" name="price1"
                value="1000">
            <input id="price22" style="display: none;" name="price2"
                value="3000">
            <input id="price23" style="display: none;" name="price3"
                value="2000">
        </div>
        <div>
            <input id="w31" type="radio" name="cla3" checked="checked"
                value="price1">经济舱
            <input id="w32" type="radio" name="cla3" value="price2">商务舱
            <input id="w33" type="radio" name="cla3" value="price3">头等舱
            <!-- 后端先获取name=cla的value，根据price1price2price3再获取name等于price1price2price3的值就是相对应的价格 -->
            <!-- 依据价格改变100，200，300 -->
            <input id="price31" style="display: block;" name="price1"
                value="10000">
            <input id="price32" style="display: none;" name="price2"
                value="30000">
            <input id="price33" style="display: none;" name="price3"
                value="20000">
        </div>
			<input id="test"  name="test"
                value="<%=maxn %>">
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