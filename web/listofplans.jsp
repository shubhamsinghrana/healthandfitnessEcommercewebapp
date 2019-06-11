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

    
    
    
				<h1 align='center'>List of Plans</h1>
		
<% 

   try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
 try
 {
 String myquery="select * from plan2table order by planid";
 PreparedStatement mystatement = myconnection.prepareStatement(myquery); 
 ResultSet myresult=mystatement.executeQuery();

 if(myresult.next())
 {
     
 out.print("<table name='mytable' id='mytable' class='table table-hover'>" +
 "<thead><th>Plan  ID</th><th>Name</th><th>Price</th>"
 + "<th>Image</th><th>Image</th><th>Category</th><th>Update</th><th>Delete</th>"
 + "</thead>"
 + "<tbody>");
 do
 {
  out.print("<tr>"
 + "<td>" + myresult.getString("planid") + "</td>");
 out.print("<td>" + myresult.getString("planname") + "</td>");
 out.print("<td>" + myresult.getString("price") + "</td>");
 out.print("<td><a href='pics/" + myresult.getString("image1") + "'><img src='pics/" + myresult.getString("image1") + "' width='50px'></a></td>");
 out.print("<td><a href='pics/" + myresult.getString("image2") + "'><img src='pics/" + myresult.getString("image2") + "' width='50px'></a></td>");
 out.print("<td>" + myresult.getString("typeid") + "</td>");
 out.print("<td><a href=update_plan.jsp?id=" 
 + myresult.getString("planid") + ">Update</td>");
 out.print("<td><a href='#' pid="+ myresult.getString("planid") +" class='deletelink'>Delete</td>");
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
 data : {planid1 : id}
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