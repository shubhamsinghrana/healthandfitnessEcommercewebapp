<%@page import="java.sql.*"%>
<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>MY GYM</title>
<%@page import="java.sql.*"%>
<%@ include file="head.jsp"%>
<%@ include file="header.jsp"%>
<%@ include file="myvariables.jsp"%>
</head>

<body>
				<h1 align='center'>Blogs Avaliable</h1>
		
<% 

   try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
 try
 {
 String myquery="select * from addblog order by srno desc ";
  PreparedStatement mystatement = myconnection.prepareStatement(myquery); 
 ResultSet myresult=mystatement.executeQuery();

 if(myresult.next())
 {
     
 out.print("<table name='mytable' id='mytable' class='table table-hover'>" +
 "<thead><th>POST DATE</th><th>AUTHER NAME</th><th>IMAGE</th><th>ABOUT</th><th>SEE BLOG</th>"
 + "</thead>"
 + "<tbody>");
 do
 {
 out.print("<tr>"
 + "<td>" + myresult.getString("postdate") + "</td>");
 out.print("<td>" + myresult.getString("authername") + "</td>");
 out.print("<td><a href='pics/" + myresult.getString("image") + "'><img src='pics/" + myresult.getString("image") + "' width='50px' ></a></td>");
 out.print("<td>" + myresult.getString("about") + "</td>");
 out.print("<td><a href=seeblog.jsp?id=" 
 + myresult.getString("srno") + ">See Blog</td>");
 
 out.print("</tr>");
 
 
 }
 while(myresult.next());
 out.print("</tbody></table>");
 }

 else
 {
 out.print("<h2>No category added</h2>");
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
<br>

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
 data : {cid1 : id}
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