<%@page import="java.sql.*"%>
<%@ include file="myvariables.jsp"%>
<%
 
if(request.getParameter("catid12")!=null)
{
    String catid =request.getParameter("catid12");
    

  try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
 try
 {
 String myquery="select * from addcategory, addsubcategory, producttable "
 + "where producttable.catid=addcategory.catid and "
 + "producttable.subcatid=addsubcategory.subcategoryid and producttable.catid=?";

 PreparedStatement mystatement = myconnection.prepareStatement(myquery); 
 mystatement.setString(1, catid);
 ResultSet myresult=mystatement.executeQuery();

 if(myresult.next())
 {
 out.print("<table name='mytable' id='mytable' class='table table-hover'>" +
 "<thead><th>Product ID</th><th>Name</th><th>Price</th>"
 + "<th>Image</th><th>Image</th><th>Category</th><th>Sub Category</th><th>Update</th><th>Delete</th>"
 + "</thead>"
 + "<tbody>");
 do
 {
 out.print("<tr>"
 + "<td>" + myresult.getString("productid") + "</td>");
 out.print("<td>" + myresult.getString("productname") + "</td>");
 out.print("<td>" + myresult.getString("price") + "</td>");
 out.print("<td><a href='pics/" + myresult.getString("image1") + "'><img src='pics/" + myresult.getString("image1") + "' width='50px'></a></td>");
 out.print("<td><a href='pics/" + myresult.getString("image2") + "'><img src='pics/" + myresult.getString("image2") + "' width='50px'></a></td>");
 out.print("<td>" + myresult.getString("catname") + "</td>");
 out.print("<td>" + myresult.getString("subcatname") + "</td>");
 out.print("<td><a href=update_product.jsp?id=" 
 + myresult.getString("productid") + ">Update</td>");
 out.print("<td><a href='#' pid="+ myresult.getString("productid") +" class='deletelink'>Delete</td>");
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


 
 
 


}


else if(request.getParameterValues("checkeditems")!=null)
 { 
 String ids[]=request.getParameterValues("checkeditems[]");
 for(String id : ids)
 {
 try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
 try
 {
 String myquery="delete from producttable where productid=?";
 PreparedStatement mystatement = myconnection.prepareStatement(myquery);
 mystatement.setString(1, id); 
 if(mystatement.executeUpdate()>0) 
 {
 out.print("success"); 
 }
 else
 {
 out.print("unsuccessfulxdw");
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
 }
 }
 
 
 

if(request.getParameter("catid2")!=null)
{
   try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
 try
 {
 String myquery="select * from addcategory, addsubcategory, producttable "
 + "where producttable.catid=addcategory.catid and "
 + "producttable.subcatid=addsubcategory.subcategoryid";
 PreparedStatement mystatement = myconnection.prepareStatement(myquery); 
 ResultSet myresult=mystatement.executeQuery();

 if(myresult.next())
 {

 out.print("<table name='mytable' id='mytable' class='table table-hover'>" +
 "<thead><th>Product ID</th><th>Name</th><th>Price</th>"
 + "<th>Image</th><th>Image</th><th>Category</th><th>Sub Category</th><th>Update</th><th>Delete</th>"
 + "</thead>"
 + "<tbody>");
 do
 {
 out.print("<tr>"
 + "<td>" + myresult.getString("productid") + "</td>");
 out.print("<td>" + myresult.getString("productname") + "</td>");
 out.print("<td>" + myresult.getString("price") + "</td>");
 out.print("<td><a href='pics/" + myresult.getString("image1") + "'><img src='pics/" + myresult.getString("image1") + "' width='50px'></a></td>");
 out.print("<td><a href='pics/" + myresult.getString("image2") + "'><img src='pics/" + myresult.getString("image2") + "' width='50px'></a></td>");
 out.print("<td>" + myresult.getString("catname") + "</td>");
 out.print("<td>" + myresult.getString("subcatname") + "</td>");
 out.print("<td><a href=update_product.jsp?id=" 
 + myresult.getString("productid") + ">Update</td>");
 out.print("<td><a href='#' pid="+ myresult.getString("productid") +" class='deletelink'>Delete</td>");
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

}
 

else if(request.getParameter("subcatid12")!=null)
{
    String subcatid =request.getParameter("subcatid12");
    

  try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
 try
 {
 String myquery="select * from addcategory, addsubcategory, producttable "
 + "where producttable.catid=addcategory.catid and "
 + "producttable.subcatid=addsubcategory.subcategoryid and producttable.subcatid=?";

 PreparedStatement mystatement = myconnection.prepareStatement(myquery); 
 mystatement.setString(1, subcatid);
 ResultSet myresult=mystatement.executeQuery();

 if(myresult.next())
 {
 out.print("<table name='mytable' id='mytable' class='table table-hover'>" +
 "<thead><th>Product ID</th><th>Name</th><th>Price</th>"
 + "<th>Image</th><th>Image</th><th>Category</th><th>Sub Category</th><th>Update</th><th>Delete</th>"
 + "</thead>"
 + "<tbody>");
 do
 {
 out.print("<tr>"
 + "<td>" + myresult.getString("productid") + "</td>");
 out.print("<td>" + myresult.getString("productname") + "</td>");
 out.print("<td>" + myresult.getString("price") + "</td>");
 out.print("<td><a href='pics/" + myresult.getString("image1") + "'><img src='pics/" + myresult.getString("image1") + "' width='50px'></a></td>");
 out.print("<td><a href='pics/" + myresult.getString("image2") + "'><img src='pics/" + myresult.getString("image2") + "' width='50px'></a></td>");
 out.print("<td>" + myresult.getString("catname") + "</td>");
 out.print("<td>" + myresult.getString("subcatname") + "</td>");
 out.print("<td><a href=update_product.jsp?id=" 
 + myresult.getString("productid") + ">Update</td>");
 out.print("<td><a href='#' pid="+ myresult.getString("productid") +" class='deletelink'>Delete</td>");
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


 
 
 


}

 
 
%>

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
 data : {pid1 : id}
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
















