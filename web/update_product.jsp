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
  String pname="", price="", image1="", image2="", category="", subcategory="",dis="",mrp="",qty="";
 try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
 try
 {
 String myquery="select * from producttable where productid=?";
 PreparedStatement mystatement = myconnection.prepareStatement(myquery); 
 mystatement.setString(1, request.getParameter("id"));
 ResultSet myresult=mystatement.executeQuery();
 session.setAttribute("pid", request.getParameter("id"));
 if(myresult.next())
 { 
 pname=myresult.getString("productname");
 price=myresult.getString("price");
 image1=myresult.getString("image1");
 image2=myresult.getString("image2");
 category=myresult.getString("catid");
 subcategory=myresult.getString("subcatid");
 dis=myresult.getString("dis");
 qty=myresult.getString("qty");
 mrp=myresult.getString("mrp");
 }

 else
 {
 out.print("No Product Information exist");
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
			<h3 class="animated wow zoomIn" data-wow-delay=".5s">Update  Product</h3>
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
<div class="key">								
								<div id="subcatbox">
 <select name="subcatid">
 <option>Choose Sub Category </option>
 <%
 try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
 try
 {
 String myquery="select * from addsubcategory where categoryid=?";
 PreparedStatement mystatement = myconnection.prepareStatement(myquery); 
 mystatement.setString(1, category);
 ResultSet myresult=mystatement.executeQuery();
 
 if(myresult.next())
 {
 do
 {
 if(myresult.getString("subcategoryid").equals(subcategory))
 {
 out.print("<option value=" + myresult.getString("subcategoryid") + " selected>" 
 + myresult.getString("subcatname") + "</option>");
 }
 else
 {
 out.print("<option value=" + myresult.getString("subcategoryid") + ">" 
 + myresult.getString("subcatname") + "</option>");
 }
 }
 while(myresult.next());
 
 }
 
 else
 {
 out.print("<option>No Sub Categories exist</option>");
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
 
 
 
 </select>
 </div>
					<input type="text" placeholder="Name of Product" value="<%=pname%>" required=" "  name="pname" >
                                       <br>
                                       MRP
                                       <br>
                                        <input type="text" placeholder="MRP" value="<%=mrp%>" required=" "  name="mrp" >
                                       
                                        <br>
                                        Price
                                        <br>
                                         <input type="text" placeholder="Price"  value="<%=price%>" required=" "  name="price" >
                                       
                                        <br>
                                        <textarea name="dis" cols="20" rows="10"    class="form-control" placeholder="Discription"><%=dis%></textarea>
                                        <br>
                                        <br>
                                        <input type="text" placeholder="Qauntity"  value="<%=qty%>" required=" "  name="qty" >
                                        <br>
                                        <img src='pics/<%=image1%>' width=100px>
					<input type="file" placeholder="Upload photo" value="Image 1" name="pimg1" >
                                        <br>
                                        <img src='pics/<%=image2%>' width=100px>
                                        <input type="file" placeholder="Upload photo" name="pimg2" >
                                        <br>
                                        <input type="submit" value="Update product" name="submit"><br>
				</form>
		
        <%
                                 String catid1="", subcatid1="", pname1="", pimg1="",pimg2="",price1="",path="",qty1="",dis1="",mrp1=""; 
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
                  catid1=value;
              }
          
            else  if(itemName1.equals("subcatid")) //control's name - textbox name
            {
                subcatid1=value;//
            }
             else  if(itemName1.equals("pname")) //control's name - textbox name
            {
                pname1=value;//
            }
             else  if(itemName1.equals("price")) //control's name - textbox name
            {
                price1=value;//
            }
             else  if(itemName1.equals("qty")) //control's name - textbox name
            {
                qty1=value;//
            }
             else  if(itemName1.equals("dis")) //control's name - textbox name
            {
                dis1=value;//
            }
             else  if(itemName1.equals("mrp")) //control's name - textbox name
            {
                 mrp1=value;//
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
 pimg1=image1;
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
 pimg2=image2;
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
                 String myquery="update producttable set catid=?, subcatid=?,"
 + "productname=?,price=?,image1=?,image2=?,mrp=?,qty=?,dis=? where productid=?";
                   PreparedStatement myst = myconn.prepareStatement(myquery);
                          myst.setString(1, catid1);
                          myst.setString(2, subcatid1);
                          myst.setString(3, pname1);
                           myst.setString(4, price1);
                          myst.setString(5, pimg1) ;
                          myst.setString(6, pimg2);
                          myst.setString(6, mrp1);
                          myst.setString(7, qty1);
                          myst.setString(8, dis1);
                          myst.setString(9, session.getAttribute("pid").toString());
                int myres = myst.executeUpdate();
                if(myres>0)
                {
                    out.print("Product  updated successfully");
                }
                else
                {
                    out.print("Product not updated added ");
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