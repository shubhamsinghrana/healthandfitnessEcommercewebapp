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
                                    <select name="catid" id="catid">
                                        
<%
Class.forName("com.mysql.jdbc.Driver");
try
{
Connection myconn = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
try
{
String q = "select catid,catname from addcategory";
PreparedStatement myst = myconn.prepareStatement(q);
ResultSet myres = myst.executeQuery();
if(myres.next())
{
    out.print("<option value=''seeall'>See all</option>");
  
do
{
out.print("<option value='" + myres.getString("catid") + "'>" + myres.getString("catname") + "</option>");
}
while(myres.next()); 
}
else
{
out.print("<option>No Categories exist</option>");
}

}
catch(Exception e)
{
out.print("Error in query" + e.getMessage());
}
finally
{
myconn.close();
}
} 
catch(Exception e)
{
out.print("Error in connection" + e.getMessage());
} 

%>    
</select>
                                </div><br>
<div class="key">
    <div id="subcatbox">
 <select name="subcatid">
     <optiopn> choose category</optiopn>
 </select>
 </div>
    
    
    
				<h1 align='center'>List of Products</h1>
		
<% 

   try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
 try
 {
 String myquery="select * from addcategory, addsubcategory, producttable "
 + "where producttable.catid=addcategory.catid and "
 + "producttable.subcatid=addsubcategory.subcategoryid order by productid";
 PreparedStatement mystatement = myconnection.prepareStatement(myquery); 
 ResultSet myresult=mystatement.executeQuery();

 if(myresult.next())
 {
     
 out.print("<table name='mytable' id='mytable' class='table table-hover'>" +
 "<thead><th>Delete</th><th>Product ID</th><th>Name</th><th>Price</th>"
 + "<th>Image</th><th>Image</th><th>Category</th><th>Sub Category</th><th>Update</th><th>Delete</th>"
 + "</thead>"
 + "<tbody>");
 do
 {
  out.print("<tr>"
 + "<td align=center><input type='checkbox' name='todelete' id='todelete' value=" + myresult.getString("productid") + "></td>"
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
  out.print("<tr><td colspan='10'><input type='button' name='delete' value='Delete' id='delete' class='btn-warning'></td></tr>");
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
 
 <script type="text/javascript">
     
     
     
   $(document).ready(function(){

 $("#delete").click(function(){
 var data = { 'user_ids[]' : []};
 $(":checked").each(
 function()
 {
 data['user_ids[]'].push($(this).val()); 
 }
 );
 $.ajax({
 method : "post",
 url : "ajax.jsp",
 
 data : {checkeditems : data['user_ids[]']}
 })
 .done(function(rdata)
 {
 if($.trim(rdata)=="unsuccess")
 {
     alert("Error occur")
 } 
 else
 {
   window.location="listofproducts.jsp" 
  
 }
 })
 })
 });  
     
     

     
     
     
     
     
     
     
     
     
     
     
     
   
 
 </script>
</body>
</html>