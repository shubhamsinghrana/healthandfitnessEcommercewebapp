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
 <div class="login">
		<div class="container">
			<h3 class="animated wow zoomIn" data-wow-delay=".5s">Add Subcategory</h3>
			<p class="est animated wow zoomIn" data-wow-delay=".5s"></p>
			<div class="login-form-grids animated wow slideInUp" data-wow-delay=".5s">
                            <form method="post" enctype="multipart/form-data">
                                <div class="key">
                                    <select name="catid">
                                        <option>choose category</option>
                                
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
                                </div>
                                    
					<input type="text" placeholder="Name of subcategory..." required=" "  name="subcatname" >
                                        <br>
					<input type="file" placeholder="Upload photo" name="addimg" >
					
                                        <input type="submit" value="Add subcategory" name="submit"><br>
				</form>
		
        <%
                                String subcname="", subimagename="",path="",catid="";
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
            if(itemName1.equals("catid")) //control's name - textbox name
              {
                  catid=value;
              }
          
            else  if(itemName1.equals("subcatname")) //control's name - textbox name
            {
                subcname=value;//
            }
        }
        else
        {
                String type=myitem.getContentType();
                long size=myitem.getSize()/1024; //kbytes
                
                if(size==0)
                {
                    subimagename="default.jpg";
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
                String q = "insert into addsubcategory(categoryid,subcatname,subcatimage) values(?,?,?)";
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, catid);
                myst.setString(2, subcname);
                myst.setString(3, subimagename);
                int myres = myst.executeUpdate();
                if(myres>0)
                {
                    out.print("Subcategory added successfully");
                }
                else
                {
                    out.print("Subcategory not added successfully");
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
                </div>
			
		</div></div>
<%@ include file="footer.jsp"%>
</body>
</html>