<!DOCTYPE html>
<%@page import="org.json.JSONArray"%>
<%@page import="java.io.IOException"%>
<%@page import="java.net.MalformedURLException"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.BufferedReader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>MY GYM</title>

<%@ include file="head.jsp"%>
<%@ include file="header.jsp"%>
<%@ include file="myvariables.jsp"%>
</head>

<body>



<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">Mail Us</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->
<!-- mail -->
	<div class="mail animated wow zoomIn" data-wow-delay=".5s">
		<div class="container">
			<h3>Mail Us</h3>
			<div class="mail-grids">
				<div class="col-md-8 mail-grid-left animated wow slideInLeft" data-wow-delay=".5s">
					<form>
						<input type="text" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">
						<input type="email" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}" required="">
						<input type="text" value="Subject" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Subject';}" required="">
						<textarea type="text"  onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message...';}" required="">Message...</textarea>
						<input type="submit" value="Submit Now" >
					</form>
				</div>
				<div class="col-md-4 mail-grid-right animated wow slideInRight" data-wow-delay=".5s">
					<div class="mail-grid-right1">
						<img src="images/logo.jpg" alt=" " class="img-responsive" />
						<h4>FAT2FIT <span>My FitnessHub</span></h4>
						<ul class="phone-mail">
							<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>Phone: +1234 567 893</li>
							<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i>Email: <a href="mailto:info@example.com">fat2fit@gmail.com</a></li>
						</ul>
						
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			<iframe class="animated wow slideInLeft" data-wow-delay=".5s" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3098.7638135888296!2d-77.47669308468912!3d39.04350424592369!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89b63eb3bc8da92b%3A0x78c8e09ab1cabc90!2sShopping+Plaza%2C+Ashburn%2C+VA+20147%2C+USA!5e0!3m2!1sen!2sin!4v1457602090579" frameborder="0" style="border:0" allowfullscreen></iframe>
		</div>
	</div>
<!-- //mail -->








<%
 String temp,humidity,description;
 BufferedReader myreader=null;
 String data="";

 //String url="http://api.openweathermap.org/data/2.5/weather?q=Jalandhar"
 //+ "&units=metric&appid=866720bef22869924a5d38c76429af2c";
 
 String url="https://openweathermap.org/data/2.5/weather?id=1268782&appid=b6907d289e10d714a6e88b30761fae22";
 
 try {
 URL myurl=new URL(url);
 myreader=new BufferedReader(new InputStreamReader(myurl.openStream()));
 data= myreader.readLine();

 JSONObject jsonObject=new JSONObject(data);
 JSONArray mainarray=jsonObject.getJSONArray("weather");
 JSONObject weatherobj=mainarray.getJSONObject(0);
 
 
 JSONObject mainobj=jsonObject.getJSONObject("main");

 temp=mainobj.get("temp").toString();
 humidity=mainobj.get("humidity").toString();
 out.print("<div align='center'>");
 out.print("<h1>Jalandhar Temperature is " + temp + " Degree</h1>");
 out.print("<h1 align='center'>Weather " +weatherobj.get("main").toString()+"</h1>");
 out.print("<h1>Humidity "+humidity+"</h1>");
 out.print("</div>");
 


 } catch (MalformedURLException e) {

 e.printStackTrace();
 } catch (IOException e) {

 e.printStackTrace();
 } 
 %>

 <br>
 <br>

<!-- //banner-bottom -->
<%@ include file="footer.jsp"%>
</body>
</html>