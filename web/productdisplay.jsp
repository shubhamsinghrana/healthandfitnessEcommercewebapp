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
    
<!-- breadcrumbs -->
<div>
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">Products</li>
			</ol>
		</div>
	</div>
	
					
								
				
						
							
					
				
			
			
				<div class="products-right-grid">
					<div class="products-right-grids animated wow slideInRight" data-wow-delay=".5s">
						
						<div class="clearfix"> </div>
					</div>
					<div class="products-right-grids-position animated wow slideInRight" data-wow-delay=".5s">
						<img src="images/281.jpg" alt=" " class="img-responsive" />
						<div class="products-right-grids-position1">
							<h4>latest products</h4>
							<p>we have all kind of products required by you.</p>
						</div>
					</div>
				</div>
                            <br>
                                    	
                            <div>		
			
<%
 String image="", price="", pname="",pid="",mrp="",myquery;
 try
 {
     PreparedStatement mystatement;
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
 try
 {
     if(request.getParameter("cid")!=null)
   { myquery="select * from producttable  where catid=? " ;
     mystatement = myconnection.prepareStatement(myquery); 
   mystatement.setString(1, request.getParameter("cid"));}
     
     else
     {
  myquery="select * from producttable order by productid " ;// desc limit 0,5";
    mystatement = myconnection.prepareStatement(myquery); 
     }

  ResultSet myresult=mystatement.executeQuery();

 if(myresult.next())
 {
 out.print(""); do
 {
     mrp=myresult.getString("mrp");
     pid=myresult.getString("productid");
 image=myresult.getString("image1");
 price=myresult.getString("price");
 pname=myresult.getString("productname");
  int discount = Integer.parseInt(mrp)-Integer.parseInt(price);
 out.print("<div class='col-md-4 products-right-grids-bottom-grid'><div class='new-collections-grid1 products-right-grid1 animated wow slideInUp' data-wow-delay='.5s'><div class='new-collections-grid1-image'>"
         +"<a href='single.jsp?pid="+ pid +"' class='product-image'>"
 + "<img src='pics/" + image + "'  height='150px'  width='100px' alt=''></div>"
 + "</a>"
 +"<div class='new-collections-grid1-image-pos products-right-grids-pos'><a href='single.jsp?pid=" + pid + "'>Quick View</a></div></div>"
 
 + "<h4><a href='single.jsp?pid=" +pid + "'>" + pname + "</a></h4><p> Buy now & Get Rs " + discount +" /- Discount</p>"
 + "<div class='simpleCart_shelfItem products-right-grid1-add-cart'><p><i>" + mrp + " </i> <span class='item_price'>Rs "+ price +"/-</span><a class='item_add'  href='cartpage.jsp?pid=" + pid + "'>add to cart </a></p></div>"    
 
 +"</div></div>"
 );
 }
 while(myresult.next());
 out.print("</div></div></div><div class='clearfix'></div>");
 }

 else
 {
 out.print("<h3>No Products found</h3>");
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
        
       <%if(request.getParameter("addtocart")!=null)
{
try              
        {
            Class.forName("com.mysql.jdbc.Driver");
           Connection myconn=DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
            try
            {
                 String myquery2="insert into carttable(pid,pname,price,qty,totalcost,sessionid,image) values(?,?,?,?,?,?,?)";
                
                   PreparedStatement myst = myconn.prepareStatement(myquery2);
                 
                         myst.setString(1, session.getAttribute("pid").toString());
                         myst.setString(2, session.getAttribute("pname").toString());
                          myst.setString(3, session.getAttribute("price").toString());
                           myst.setString(4, request.getParameter("quantity2"));
                          myst.setInt(5, Integer.parseInt(request.getParameter("quantity2")) * Integer.parseInt(session.getAttribute("price").toString()));
                          myst.setString(6, session.getId().toString());
                          myst.setString(7, session.getAttribute("image").toString());
                int myres = myst.executeUpdate();
                if(myres>0)
                {
                    response.sendRedirect("cartpage.jsp");
                }
                else
                {
                    out.print("Product not added ");
                }
            }
            catch(Exception e)
            {
                out.print("Error in query2" + e.getMessage());
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
        
        
        %>



 <br>




 <div class="clearfix"> </div>
    </div>
    </div>
    
        
  
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    <%@include file="footer.jsp" %>    
        
    </body>
</html>
