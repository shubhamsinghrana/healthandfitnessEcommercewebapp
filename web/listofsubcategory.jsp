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
                                        <option value="seeall">See All</option>
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

 </div>
    
    
    
				<h1 align='center'>List of Subcategory</h1>
		
<% 

   try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
 try
 {
 String myquery="select * from addcategory, addsubcategory "
 + "where addsubcategory.categoryid=addcategory.catid  ";
 PreparedStatement mystatement = myconnection.prepareStatement(myquery); 
 ResultSet myresult=mystatement.executeQuery();

 if(myresult.next())
 {
     
 out.print("<table name='mytable' id='mytable' class='table table-hover'>" +
 "<thead><th>Category Name</th><th>Subcategory ID</th><th>Image</th><th>Subcategory Name</th>"
 + "<th>Update</th><th>Delete</th>"
 + "</thead>"
 + "<tbody>");
 do
 {
 out.print("<tr>"
 + "<td>" + myresult.getString("catname") + "</td>");
 out.print("<td>" + myresult.getString("subcategoryid") + "</td>");
 out.print("<td><a href='pics/" + myresult.getString("subcatimage") + "'><img src='pics/" + myresult.getString("subcatimage") + "' width='50px' ></a></td>");
 out.print("<td>" + myresult.getString("subcatname") + "</td>");
 out.print("<td><a href=update_subcategory.jsp?id=" 
 + myresult.getString("subcategoryid") + ">Update</td>");
 out.print("<td><a href='#' pid="+ myresult.getString("subcategoryid") +" class='deletelink'>Delete</td>");
 out.print("</tr>");
 
 
 }
 while(myresult.next());
 out.print("</tbody></table>");
 }

 else
 {
 out.print("<h2>No Subcategory added</h2>");
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

 
</body>
</html>