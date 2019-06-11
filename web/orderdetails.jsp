<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>MY GYM</title>
<%@page import="java.sql.*"%>
<%@ include file="head.jsp"%>
<%@ include file="headeradmin.jsp"%>
<%@ include file="myvariables.jsp"%>
</head>

<body>
<h1>Admin Panel</h1>

                                <br>
<div class="key">
    <div id="subcatbox">
 
 </div>
    
    
    
		<%

 try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
 try
 {
 String myquery="select * from ordertable, usertable where ordertable.username = usertable.email";
 PreparedStatement mystatement = myconnection.prepareStatement(myquery); 
 ResultSet myresult=mystatement.executeQuery();

 if(myresult.next())
 {
 out.print("<h1 align='center'>List of Orders</h1>");
 out.print("<table class='table table-hover'>" +
 "<thead><th>Order No</th><th>Username</th><th>Order Date</th>"
 + "<th>Amount</th><th>Phone</th><th>Address</th><th>Payment Mode</th><th>Status</th>"
 + "</thead>"
 + "<tbody>");
 do
 {
 out.print("<tr>"
 + "<td><a href=showorderdetails.jsp?orderno=" + myresult.getString("orderno") + ">" + myresult.getString("orderno") + "</a></td>");
 out.print("<td>" + myresult.getString("username") + "</td>");
 out.print("<td>" + myresult.getString("saledate") + "</td>");
 
 out.print("<td>" + myresult.getString("amount") + "</td>");
 out.print("<td>" + myresult.getString("phone") + "</td>");
 out.print("<td>" + myresult.getString("address") + "</td>");
 out.print("<td>" + myresult.getString("paymentmode") + "</td>");
out.print("<td><a href='#' pid="+ myresult.getString("orderno") +" class='deletelink'>Order is Completed</td>");
 out.print("</tr>");
 
 out.print("</tr>");
 
 
 }
 while(myresult.next());
 out.print("</tbody></table>");
 }

 else
 {
 out.print("<h2>No Orders</h2>");
 }


 }
 catch(Exception e)
 {
 out.print("Error in Query due to " + e.getMessage());
 }
 finally
 {
 myconnection.close();
 }

 }
 catch(Exception e)
 {
 out.print("Error in Connection due to " + e.getMessage());
 } 

 
 
 
 
 
 
 %>

<%@ include file="footer.jsp"%>
 <script type="text/javascript">
 $(document).ready(function(){
 
 $(".deletelink").click(function(e){
 e.preventDefault()
 answer = confirm("Are you sure you really want to delete?")
 if(answer)
 {
 var id = $(this).attr("pid")
 var parent_td = $(this).parent()
 var parent_tr = $(this).parent().parent()

 $.ajax({
 method : "post",
 url : "ajax.jsp",
 data : {orderid1 : id}
 })
 .done(function(rdata){
 if($.trim(rdata)=="success")
 {
// parent_tr.css({'backgroundColor':'#fb6c6c'});
// parent_tr.fadeOut(400,function()
// {
// parent_tr.remove()
// })
 } 
 else
 {
  parent_tr.css({'backgroundColor':'#fb6c6c'});
 parent_tr.fadeOut(400,function()
 {
 parent_tr.remove()    
 }
 })
 }
 })
 })
 
 
 
 </script>
 
 <script type="text/javascript">
 $(document).ready(function(){
 $("#catid").change(function(){
 catid = $(this).val()
 if(catid!="seeall")
 {
     $.ajax({
 method : "post",
 url : "ajax1.jsp",
 data : {catid12 : catid}
 })
 .done(function(rdata){
 $("#mytable").html(rdata)
 });
 
 }
 else
 {
     
    $.ajax({
 method : "post",
 url : "ajax1.jsp",
 data : {catid2 : "seeall"}
 })
 .done(function(rdata){
 $("#mytable").html(rdata)
 });  
     
 }
 })
 })
 
 
 
 </script>
 <script type="text/javascript">
 $(document).ready(function(){
 $("#catid").change(function(){
 catid = $(this).val()
 if(catid!="seeall")
 {
 $.ajax({
 method : "post",
 url : "ajax.jsp",
 data : {catid1 : catid}
 })
 .done(function(rdata){
 $("#subcatbox").html(rdata)
 });
 }
 else
 {
     $.ajax({
 method : "post",
 url : "ajax.jsp",
 data : {catid11 : catid}
 })
 .done(function(rdata){
 $("#subcatbox").html(rdata)
 });
  
 }
 })
 })
 
 
 
 </script>
 <script type="text/javascript">
 $(document).ready(function(){
 $("#subcatbox").change(function(){
 subcatid =  $(this).val()
 if(subcatid!="seeall")
 {
     $.ajax({
 method : "post",
 url : "ajax1.jsp",
 data : {subcatid12 : subcatid}
 })
 .done(function(rdata){
 $("#mytable").html(rdata)
 });
 
 }
 else
 {
     
    $.ajax({
 method : "post",
 url : "ajax1.jsp",
 data : {subcatid2 : "seeall"}
 })
 .done(function(rdata){
 $("#mytable").html(rdata)
 });  
     
 }
 })
 })
 
 
 
 </script>
</body>
</html>