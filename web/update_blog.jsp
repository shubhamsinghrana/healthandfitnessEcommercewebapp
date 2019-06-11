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
<h1>Admin Panel</h1>
 <%
 String  authername1="",postdate1="",about1="",dis1="", image1="";
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
 authername1=myresult.getString("authername");
 postdate1=myresult.getString("postdate");
 image1=myresult.getString("image");
 about1=myresult.getString("about");
 dis1=myresult.getString("dis");
 }

 else
 {
 out.print("No category Information exist");
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
 <div class="login">
		<div class="container">
			<h3 class="animated wow zoomIn" data-wow-delay=".5s">Add Blog</h3>
			<p class="est animated wow zoomIn" data-wow-delay=".5s"></p>
			<div class="login-form-grids animated wow slideInUp" data-wow-delay=".5s">
                            <form method="post" enctype="multipart/form-data">
                                <input type="text" placeholder="About" required=" " value="<%=about1%>" name="about" >
                                        <br>

                                        <input type="text" placeholder="Name of Auther" value="<%=authername1%>" required=" "  name="authername" >
                                        <br>
                                        <input type="text" placeholder="Post Date" value="<%=postdate1%>" required=" "  name="postdate" >
                                        <br>
                                                                     
                                        <textarea name="dis" cols="10" rows="30"   value="<%=dis1%>" class="form-control" placeholder="Content" required=" "></textarea>
								<div class="clearfix"></div>
                                        <br>
                                        <img src='pics/<%=image1%>' width=100px>
					<input type="file" placeholder="Upload photo" name="addimg" >
					
					<input type="submit" value="Add Blog" name="submit">
				</form>
		
        <%
                                String authername="", postdate="", imagename="",path="",dis="",about="";
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
          
            if(itemName1.equals("authername")) //control's name - textbox name
            {
                authername=value;//
            }
            else  if(itemName1.equals("postdate")) //control's name - textbox name
            {
                postdate=value;//
            }
            else  if(itemName1.equals("dis")) //control's name - textbox name
            {
               dis=value;//
            }
            else  if(itemName1.equals("about")) //control's name - textbox name
            {
               about=value;//
            }
        }
        else
        {
                String type=myitem.getContentType();
                long size=myitem.getSize()/1024; //kbytes
                
                if(size==0)
                {
                     imagename=image1;
                }
                else if((type.equals("image/pjpeg") || type.equals("image/jpeg")
                        || type.equals("image/png") || type.equals("image/x-png")
                        || type.equals("image/gif")))
                    {
                imagename=new java.util.Date().getTime()+myitem.getName();
                path=getServletContext().getRealPath("/") + "pics\\" + imagename;
                
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
                String q = "update addblog set "
     + "authername=?,about=?,postdate=?,dis=?,image=? where srno=?";;
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, authername);
                myst.setString(2, about);
                myst.setString(3, postdate);
                myst.setString(4, dis);
                myst.setString(5, imagename);
                 myst.setString(6, request.getParameter("id"));
                int myres = myst.executeUpdate();
                if(myres>0)
                {
                    out.print("blog added successfully");
                }
                else
                {
                    out.print("blog not added successfully");
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
   

        
        
        %></div>
			
		</div></div>
<%@ include file="footer.jsp"%>
</body>
</html>