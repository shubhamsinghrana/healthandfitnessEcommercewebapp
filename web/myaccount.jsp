<!DOCTYPE html><%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.sql.*"%>
<html>
<head>
<title>MY GYM</title>

<%@ include file="head.jsp"%>
<%@ include file="header.jsp"%>
<%@ include file="myvariables.jsp"%>
</head>

<body>





 <%     
       int i=0;
       
            if(session.getAttribute("name")!=null)
 {
  
     try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
  try
 {
 String myquery="select * from plantable where username=?";
 PreparedStatement mystatement = myconnection.prepareStatement(myquery); 
 mystatement.setString(1, String.valueOf(session.getAttribute("name")));
 ResultSet myresult=mystatement.executeQuery();

 if(myresult.next())
 {
   do{ 
     
 if(myresult.getString("status").equals("requested"))
 {
     i=2;
 out.print( " <h4 align='center'>Hi " + myresult.getString("name") + "Your Request Id is  " + myresult.getString("srno")+"  for"+myresult.getString("type")+" Time period "+myresult.getString("plan")+"  you can go to our center to activate your account and pay your fees<a href='#' pid="+ myresult.getString("srno") +" class='deletelink'>Delete</a></h2>");
 }
 else if(myresult.getString("status").equals("activated"))
 {
     i=2;
 out.print( " <h4 align='center'> Hi " + myresult.getString("name") + "Your Request Id  " + myresult.getString("srno")+" for " +myresult.getString("type")+" Time period " +myresult.getString("plan") + " is Activated </h2>");

 }
 out.print("<br><br>");
 
 
   }
 while(myresult.next());
 out.print("</tbody></table>");
 }

 else
 {
 //out.print("<h2>No Requestt</h2>");
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
 
 
 
 
 <h1>my account</h1>
<%@ include file="footer.jsp"%>
 <script type="text/javascript">
 $(document).ready(function(){
 
 $(".deletelink").click(function(e){
 e.preventDefault()
 answer = confirm("Delete request?")
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
 window.location.assign("myaccount.jsp")
 } 
 })
 }
 })
 })
 
 
 
 </script>
</body>
</html>