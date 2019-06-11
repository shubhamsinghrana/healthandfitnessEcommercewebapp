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
<div class="key">

    
    
    
				<h1 align='center'>List of Services</h1>
		
<% 

   try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
 try
 {
 String myquery="select * from typetable order by typeid";
 PreparedStatement mystatement = myconnection.prepareStatement(myquery); 
 ResultSet myresult=mystatement.executeQuery();

 if(myresult.next())
 {
     
 out.print("<table name='mytable' id='mytable' class='table table-hover'>" +
 "<thead><th>Type ID</th><th> Type Name</th>"
 + "<th>Image</th><th>Image</th><th>Title</th><th>Update</th><th>Delete</th>"
 + "</thead>"
 + "<tbody>");
 do
 {
  out.print("<tr>"
 + "<td>" + myresult.getString("typeid") + "</td>");
 out.print("<td>" + myresult.getString("typename") + "</td>");
 out.print("<td><a href='pics/" + myresult.getString("typeimg") + "'><img src='pics/" + myresult.getString("typeimg") + "' width='50px'></a></td>");
 out.print("<td><a href='pics/" + myresult.getString("typeimg2") + "'><img src='pics/" + myresult.getString("typeimg2") + "' width='50px'></a></td>");
 out.print("<td>" + myresult.getString("title") + "</td>");
 out.print("<td><a href=update_type.jsp?id=" 
 + myresult.getString("typeid") + ">Update</td>");
 out.print("<td><a href='#' pid="+ myresult.getString("typeid") +" class='deletelink'>Delete</td>");
 out.print("</tr>");
 
 
 }
 while(myresult.next());
  
 out.print("</tbody></table>");
 }

 else
 {
 out.print("<h2>No Plans added</h2>");
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
</div>
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
 data : {typeid1 : id}
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
 
</body>
</html>