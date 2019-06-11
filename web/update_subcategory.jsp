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
 String  image1="", category="", subcategory="";
 try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
 try
 {
 String myquery="select * from addsubcategory where subcategoryid=?";
 PreparedStatement mystatement = myconnection.prepareStatement(myquery); 
 mystatement.setString(1, request.getParameter("id"));
 ResultSet myresult=mystatement.executeQuery();
 session.setAttribute("sid", request.getParameter("id"));
 if(myresult.next())
 { 
 
 image1=myresult.getString("subcatimage");
 category=myresult.getString("categoryid");
 subcategory=myresult.getString("subcatname");
 }

 else
 {
 out.print("No subcategory Information exist");
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
			<h3 class="animated wow zoomIn" data-wow-delay=".5s">Update  Category</h3>
			<p class="est animated wow zoomIn" data-wow-delay=".5s"></p>
			<div class="login-form-grids animated wow slideInUp" data-wow-delay=".5s">
                            <form method="post" enctype="multipart/form-data">
                                <div class="key">
                                    <select name="catid" id="catid">
                                        <option>choose category</option>
<%
Class.forName("com.mysql.jdbc.Driver");
try
{
Connection myconn = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD );
try
{
String q = "select * from addcategory";
PreparedStatement myst = myconn.prepareStatement(q);
ResultSet myres = myst.executeQuery();
if(myres.next())
{
do
{
if(myres.getString("catid").equals(category))
 {
 out.print("<option value=" + myres.getString("catid") + " selected>" 
 + myres.getString("catname") + "</option>");
 }
 else
 {
 out.print("<option value=" + myres.getString("catid") + ">" 
 + myres.getString("catname") + "</option>");
 }
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
 
 
 
 
 
 </select>
 
				
                                        <input type="text" placeholder="Name of subcategory..." value="<%= subcategory%>" required=" "  name="subcatname" >
                                        <br>
					 <img src='pics/<%=image1%>' width=100px>
					<input type="file" placeholder="Upload photo" value="Image 1" name="addimage" >
                                        <br>
					
                                        <input type="submit" value="Update subcategory" name="submit"><br>
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
                String q = "update addsubcategory set categoryid=?,"
     + "subcatname=?,subcatimage=? where subcategoryid=?";;
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, catid);
                myst.setString(2, subcname);
                myst.setString(3, subimagename);
                myst.setString(4, session.getAttribute("sid").toString());
                int myres = myst.executeUpdate();
                if(myres>0)
                {
                    out.print("Subcategory updated successfully");
                }
                else
                {
                    out.print("Subcategory not updated successfully");
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