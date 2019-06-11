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
 String image="", price="", pname="",pid="",image2="",pid2="",mrp="",qty="",dis="";
 int discount=0;
 try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
 try
 {
 String myquery="select * from producttable where productid=?";
 PreparedStatement mystatement = myconnection.prepareStatement(myquery); 
 mystatement.setString(1, request.getParameter("pid"));
 ResultSet myresult=mystatement.executeQuery();
 session.setAttribute("pid", request.getParameter("pid"));

 if(myresult.next())
 {
 
 mrp=myresult.getString("mrp");
 qty=myresult.getString("qty");
 dis=myresult.getString("dis");
 image=myresult.getString("image1");
 image2=myresult.getString("image2");
 price=myresult.getString("price");
 pname=myresult.getString("productname");
  session.setAttribute("pname", pname);
 session.setAttribute("price", price);
 session.setAttribute("image", image);
     
  discount = Integer.parseInt(mrp)-Integer.parseInt(price);   
 
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
        
       
        
        
        
        
    <div class="single">
		<div class="container">
			
			<div class="col-md-8 single-right">
				<div class="col-md-5 single-right-left animated wow slideInUp" data-wow-delay=".5s">
					<div class="flexslider">
						<ul class="slides">
							<li data-thumb="pics/<%=image %>">
                                                            <div class="thumb-image"> <img src="pics/<%=image %>"  data-imagezoom="true" class="img-responsive"> </div>
							</li>
							<li data-thumb="pics/<%=image2 %>">
								 <div class="thumb-image"> <img src="pics/<%=image2 %>"  data-imagezoom="true" class="img-responsive"> </div>
							</li>
							
						</ul>
					</div>
					<!-- flixslider -->
						<script defer src="js/jquery.flexslider.js"></script>
						<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
						<script>
						// Can also be used with $(document).ready()
						$(window).load(function() {
						  $('.flexslider').flexslider({
							animation: "slide",
							controlNav: "thumbnails"
						  });
						});
						</script>
					<!-- flixslider -->
				</div>
                                                        <form name="form3" method="post"><div class="col-md-7 single-right-left simpleCart_shelfItem animated wow slideInRight" data-wow-delay=".5s">
					<h3><%= pname %></h3>
                                        
                                        <h4><div class='simpleCart_shelfItem products-right-grid1-add-cart'><p><i>Mrp Rs<%=mrp%></i></p></div></h4>
                                        
					<h4><span class="item_price">Rs-<%= price%> /</h4>
					 
                                        <p> Buy now & Get Rs <%=  discount%> /- Discount</p>
                                    
					<div class="description">
						<h5><i>Description</i></h5>
						<p><%= dis %></p>
					</div>
					<div class="color-quality">
						
						<div class="color-quality-left">
							<h5>Quantity :</h5>
             <select name="quantity2">                          
                 <% 
 if(request.getParameter("pid")!=null)
 {
  for(int x=1;x<=Integer.parseInt(qty);x++)
 {
 out.print("<option>" + x + "</option>");
 } 
 } 
 %>
         </select>                                               <br>
						</div>
						<div class="clearfix"> </div>
					</div>
                                        <br>
					<div class="occasion-cart">
                                            
                                                <button name="addtocart" type="submit" class="my-cart-b item_add">Add to Cart</button>
                                    
                                          
					
					
				</div>
                                        
				<div class="clearfix"> </div>
                       
				
			</div></form>
				
                                                        </form>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //single -->
<!-- single-related-products -->      
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
        
    </div>
    <%@include file="footer.jsp" %>    
        
    </body>
</html>
