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
 String myquery="select * from plantable where status=?";
 PreparedStatement mystatement = myconnection.prepareStatement(myquery); 
 mystatement.setString(1, "requested");
 ResultSet myresult=mystatement.executeQuery();

 if(myresult.next())
 {
 out.print("<h1 align='center'>List of Request</h1>");
 out.print("<table class='table table-hover'>" +
 "<thead><th>Request no</th><th>Username</th><th>Phone no</th>"
 + "<th>Name</th><th>Type</th><th>Plan</th><th>Status</th><th>Delete</th>"
 + "</thead>"
 + "<tbody>");
 do
 {
 out.print("<tr>"
 + "<td>" + myresult.getString("srno") + "</a></td>");
 out.print("<td>" + myresult.getString("username") + "</td>");
 out.print("<td>" + myresult.getString("phone") + "</td>");
 out.print("<td>" + myresult.getString("name") + "</td>");
 
 out.print("<td>" + myresult.getString("type") + "</td>");
 out.print("<td>" + myresult.getString("plan") + "</td>");;
out.print("<td><a href='#' pid="+ myresult.getString("srno") +" class='deletelink'>Activate User</td>");
out.print("<td><a href='#' pid="+ myresult.getString("srno") +" class='deletelink'>Delete Request</td>");
 out.print("</tr>");
 
 out.print("</tr>");
 
 
 }
 while(myresult.next());
 out.print("</tbody></table>");
 }

 else
 {
 out.print("<h2>No Request</h2>");
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
 answer = confirm("Add user?")
 if(answer)
 {
 var id = $(this).attr("pid")
 var parent_td = $(this).parent()
 var parent_tr = $(this).parent().parent()

 $.ajax({
 method : "post",
 url : "ajax.jsp",
 data : {activatestatus : id}
 })
 .done(function(rdata){
 if($.trim(rdata)=="success")
 {
 parent_tr.css({'backgroundColor':'#fb6c6c'});
 parent_tr.fadeOut(400,function()
 {
 parent_tr.remove()
 })
 } 
 })
 }
 })
 })
 
 
 
 </script>
  <script type="text/javascript">
 $(document).ready(function(){
 
 $(".deletelink2").click(function(e){
 e.preventDefault()
 answer = confirm("Delete user?")
 if(answer)
 {
 var id = $(this).attr("pid")
 var parent_td = $(this).parent()
 var parent_tr = $(this).parent().parent()

 $.ajax({
 method : "post",
 url : "ajax.jsp",
 data : {deleteuser: id}
 })
 .done(function(rdata){
 if($.trim(rdata)=="success")
 {
 parent_tr.css({'backgroundColor':'#fb6c6c'});
 parent_tr.fadeOut(400,function()
 {
 parent_tr.remove()
 })
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