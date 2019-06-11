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
			<h3 class="animated wow zoomIn" data-wow-delay=".5s">Add Product</h3>
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
<div class="key">								
								<div id="subcatbox">
 <select name="subcatid">
 <option>Choose Category first</option>
 </select>
 </div>
					<input type="text" placeholder="Name of Product" required=" "  name="pname" >
                                        <br>
                                        <input type="text" placeholder="MRP" required=" "  name="mrp" >
                                        <br>
                                        <br>
                                        <input type="text" placeholder="Price" required=" "  name="price" >
                                        <br>
                                        <textarea name="dis" cols="20" rows="10" class="form-control" placeholder="Discription"></textarea>
                                        <br>
                                        <input type="text" placeholder="Quantity" required=" " name="qty">
                                        <br>
					<input type="file" placeholder="Upload photo" name="pimg1" >
                                        <br>
                                        <input type="file" placeholder="Upload photo" name="pimg2" >
                                        <br>
                                        <input type="submit" value="Add Product" name="submit"><br>
				</form>
		
        <%
                                String catid="", subcatid="", pname="", pimg1="",pimg2="",price="",path="",qty="",dis="",mrp="";
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
          
            else  if(itemName1.equals("subcatid")) //control's name - textbox name
            {
                subcatid=value;//
            }
             else  if(itemName1.equals("pname")) //control's name - textbox name
            {
                pname=value;//
            }
             else  if(itemName1.equals("price")) //control's name - textbox name
            {
                price=value;//
            }
             else  if(itemName1.equals("qty")) //control's name - textbox name
            {
                qty=value;//
            }
             else  if(itemName1.equals("dis")) //control's name - textbox name
            {
                dis=value;//
            }
             else  if(itemName1.equals("mrp")) //control's name - textbox name
            {
                 mrp=value;//
            }
        }
        else
        {
                if(myitem.getFieldName().equals("pimg1"))
 {
 String type=myitem.getContentType();
 long size=myitem.getSize()/1024; //kbytes
 
 if(size==0)
 {
 pimg1="default.jpg";
 }
 else if((type.equals("image/pjpeg") || type.equals("image/jpeg")
 || type.equals("image/png") || type.equals("image/x-png")
 || type.equals("image/gif")))
 {
 
 
 pimg1=new java.util.Date().getTime()+myitem.getName();
 path=config.getServletContext().getRealPath("/") + "pics\\" + pimg1;
 File savefile=new File(path);
 myitem.write(savefile); 
 
 
 }
 else
 {
 successful=false;
 out.println("Sorry only pictures are allowed to upload");
 }
 }
                
                else
 {
 String type=myitem.getContentType();
 long size=myitem.getSize()/1024; //kbytes
 
 if(size==0)
 {
 pimg2="default.jpg";
 }
 else if((type.equals("image/pjpeg") || type.equals("image/jpeg")
 || type.equals("image/png") || type.equals("image/x-png")
 || type.equals("image/gif")) )
 {
 
 
 pimg2=new java.util.Date().getTime()+myitem.getName();
 path=config.getServletContext().getRealPath("/") + "pics\\" + pimg2;
 File savefile=new File(path);
 myitem.write(savefile); 
 
 
 }
 else
 {
 successful=false;
 out.println("Sorry only pictures  are allowed to upload");
 }
               
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
                 String myquery="insert into producttable(catid, subcatid,productname,price,image1,image2,mrp,qty,dis) values(?,?,?,?,?,?,?,?,?)";
                   PreparedStatement myst = myconn.prepareStatement(myquery);
                          myst.setString(1, catid);
                          myst.setString(2, subcatid);
                          myst.setString(3, pname);
                           myst.setString(4, price);
                          myst.setString(5, pimg1) ;
                          myst.setString(6, pimg2);
                          myst.setString(7, mrp);
                          myst.setString(8, qty);
                          myst.setString(9, dis);
                int myres = myst.executeUpdate();
                if(myres>0)
                {
                    out.print("Product  added successfully");
                }
                else
                {
                    out.print("Product not added ");
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
 <%@include file="footer.jsp" %>
 <script type="text/javascript">
 $(document).ready(function(){
 $("#catid").change(function(){
 catid = $(this).val()
 $.ajax({
 method : "post",
 url : "ajax.jsp",
 data : {catid1 : catid}
 })
 .done(function(rdata){
 $("#subcatbox").html(rdata)
 });
 
 })
 })
 
 
 
 </script>
</body>
</html>