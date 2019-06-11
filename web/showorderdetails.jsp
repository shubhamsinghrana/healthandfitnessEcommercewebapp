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

<%

 try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
 try
 {
 String myquery="select * from order_detail where orderno=?";
 PreparedStatement mystatement = myconnection.prepareStatement(myquery); 
 mystatement.setString(1, request.getParameter("orderno"));
 ResultSet myresult=mystatement.executeQuery();

 if(myresult.next())
 {
 out.print("<h1 align='center'>Order Details</h1>");
 out.print("<table class='table table-hover'>" +
 "<thead><th>Image</th><th>Product ID</th><th>Name</th><th>Price</th>"
 + "<th>Qty</th><th>Total Cost</th>"
 + "</thead>"
 + "<tbody>");
 do
 {
 out.print("<tr><td><a href='pics/" + myresult.getString("image") + "'><img src='pics/" + myresult.getString("image") + "' width='50px'></a></td>");
 out.print("<td>" + myresult.getString("productid") + "</td>");
 out.print("<td>" + myresult.getString("productname") + "</td>");
 out.print("<td>" + myresult.getString("price") + "</td>");
 
 out.print("<td>" + myresult.getString("qty") + "</td>");
 out.print("<td>" + myresult.getString("totalcost") + "</td>");
 
 out.print("</tr>");
 
 
 }
 while(myresult.next());
 out.print("</tbody></table>");
 }

 else
 {
 out.print("<h2>No Products added</h2>");
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
</body>
</html>