<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
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
    <%
 String  image1="", category="", title="" ,image2="";
 try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
 try
 {
 String myquery="select * from typetable where typeid=?";
 PreparedStatement mystatement = myconnection.prepareStatement(myquery); 
 mystatement.setString(1, request.getParameter("id"));
 ResultSet myresult=mystatement.executeQuery();
 if(myresult.next())
 { 
 
 image1=myresult.getString("typeimg");
 image2=myresult.getString("typeimg2");
  category=myresult.getString("typename");
  
  title=myresult.getString("title");
 }

 else
 {
 out.print("No Information exist");
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
<h1>Admin Panel</h1>
 <div class="login">
		<div class="container">
			<h3 class="animated wow zoomIn" data-wow-delay=".5s">Update  Service</h3>
			<p class="est animated wow zoomIn" data-wow-delay=".5s"></p>
			<div class="login-form-grids animated wow slideInUp" data-wow-delay=".5s">
                            <form method="post" enctype="multipart/form-data">
                                <div class="key">
                                   
                                </div><br>
 
 
 
 
 

 

				
                                                             <h2><%= category %></h2>
                                        <input type="text" placeholder="Title" value="<%= title%>" required=" "  name="title" >
                                        <br>
					 <img src='pics/<%=image1%>' width=100px>
					<input type="file" placeholder="Upload photo" value="Image 1" name="addimage" >
                                        <br>
<!--                                         <img src='pics/<%=image2%>' width=100px>
					<input type="file" placeholder="Upload photo" value="Image 2" name="addimage2" >
                                        <br>-->
					
                                        <input type="submit" value="Update Type" name="submit"><br>
				</form>
		
                             <%
                                 String subcname="", subimagename="",path="",catid="",title2="";
           boolean successful=true;
           boolean isMultipart = ServletFileUpload.isMultipartContent(request);
              
    if(isMultipart)
    {
   
    FileItemFactory factory = new DiskFileItemFactory();
  
    ServletFileUpload upload = new ServletFileUpload(factory);
    List<FileItem> items = null;
    
   try
   {
        items = upload.parseRequest(request);
   }
   catch (FileUploadException e)
   {
       e.printStackTrace();
   }
   
   
   
   for(FileItem myitem:items)
   {
       
     if (myitem.isFormField())
        {
            String itemName1 = myitem.getFieldName();//catsummary
            String value=myitem.getString();//
            
          
            if(itemName1.equals("catname")) //control's name - textbox name
            {
                subcname=value;//
            }
              else if(itemName1.equals("title")) //control's name - textbox name
            {
                title2=value;//
            }
        }
        else
        {
                String type=myitem.getContentType();
                long size=myitem.getSize()/1024; //kbytes
                
                if(size==0)
                {
                    subimagename= image1;
                }
                else if((type.equals("image/pjpeg") || type.equals("image/jpeg")
                        || type.equals("image/png") || type.equals("image/x-png")
                        || type.equals("image/gif")))
                    {
                subimagename=new java.util.Date().getTime()+myitem.getName();
                path=getServletContext().getRealPath("/") + "pics\\" + subimagename;
                
                File savefile=new File(path);
                myitem.write(savefile);    
                }
                else
                {
                    successful=false;
                    out.println("Only pictures are allowed");
                }  
                
        }
   
  }  
   
    if(successful==true)
   {
       
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
           Connection myconn=DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
            try
            {
                String q = "update typetable set "
     + "typename=?,typeimg=?,typeimg2=?,title=? where typeid=?";
                PreparedStatement myst = myconn.prepareStatement(q);
                
                myst.setString(1, category);
                myst.setString(2, subimagename);
                myst.setString(3, "default.jpg");
                 myst.setString(4, title2);
                    myst.setString(5, request.getParameter("id"));
                int myres = myst.executeUpdate();
                if(myres>0)
                {
                    out.print("Type updated successfully");
                }
                else
                {
                    out.print("category not updated successfully");
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
   }
}
   

        
        
        %>
                        </div>
                </div>
			
		</div></div>
 <%@include file="footer.jsp" %>
 <script type="text/javascript">
 
</body>
</html>