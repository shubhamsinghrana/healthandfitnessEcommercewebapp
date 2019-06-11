<%@page import="java.io.File"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@page import="java.sql.*"%>
<%@ include file="head.jsp"%>
<%@ include file="header.jsp"%>
<%@ include file="myvariables.jsp"%>
    </head>
    <body>
    
	
<%
 String image="",auther="",postdate="",dis="",about="";
 int discount=0;
 try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
 try
 {
 String myquery="select * from addblog where srno=?";
 PreparedStatement mystatement = myconnection.prepareStatement(myquery); 
 mystatement.setString(1, request.getParameter("id"));
 ResultSet myresult=mystatement.executeQuery();

 if(myresult.next())
 {
 auther=myresult.getString("authername");
 postdate=myresult.getString("postdate");
 about=myresult.getString("about");
 dis=myresult.getString("dis");
 image=myresult.getString("image");

     
 
 
 }

 else
 {
 out.print("<h3>No Products found</h3>");
 }


 }
 catch(Exception e)
 {
 out.print("Error in Query1  due to " + e.getMessage());
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
 <div  align="center" ><h1 ><%= about%></h1></div>
			
				
                                    <div  align="center" > <img src="pics/<%=image%>" width='800px'  height="300px"></div>
				</div>
                                <div  align="center" ><h7>By-<%= auther%>  Date-<%= postdate%> </h7></div>
                            <br>
                                    	
                            <div>		
			
                              <h2>  <p align="center"><%= dis%> </p></h2>

    






 <div class="clearfix"> </div>
    </div>
    </div>
    
        
  
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    <%@include file="footer.jsp" %>    
        
    </body>
</html>
