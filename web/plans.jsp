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

 out.print( "<h2 align='center'> Hi " + myresult.getString("name") + "  <br> Click to open your panel<form><input type='submit' value='Go to panel' name='submit'></form></h2>");


 
 
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
     
        
       
        
        
        
        
    
<!--					<div class="flexslider">
						<ul class="slides">
							<li data-thumb="images/gym1.jpg">
                                                            <div class="thumb-image"> <img src="images/gym1.jpg"  height="1500px"> </div>
							</li>
							<li data-thumb="images/gym2.jpg">
								 <div class="thumb-image"> <img src="images/gym2.jpg"  data-imagezoom="true" class="img-responsive"> </div>
							</li>
							
						</ul>
					</div>-->
<!--					 flixslider 
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
					 flixslider -->
				
                            <%     
      
       
           
 
  String typeid="";
     try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
  try
 {
 String myquery="select * from typetable ";
 PreparedStatement mystatement = myconnection.prepareStatement(myquery); 
 ResultSet myresult=mystatement.executeQuery();

 if(myresult.next())
 {
      out.print("<br><br><br><div class='container'>"); 
 do{
   String img="";
     out.print("<br>");
     out.print("<br>");
    typeid=myresult.getString("typename");
    img=myresult.getString("typeimg");
    //out.print(img);
 out.print("<div class='col-md-12 single-right'><div class='col-md-5 single-right-left animated wow slideInUp' data-wow-delay='.5s'><img src='pics/"+ img+ " 'height='500px' width='250px'><br></div><form name='form3' method='post'><div class='col-md-7 single-right-left simpleCart_shelfItem animated wow slideInRight' data-wow-delay='.5s'><h3>"+myresult.getString("typename")+"</h3> <h4><div class='simpleCart_shelfItem products-right-grid1-add-cart'><p><i></i></p></div></h4><h4><span class='item_price'></h4><div class='description'><h3><i>"+myresult.getString("title") +" </i></h3> ");

 try
 {
// Class.forName("com.mysql.jdbc.Driver");
 try
 {
   out.print(typeid);
  String myquery2="select * from plan2table where typeid=?";

 PreparedStatement mystatement1 = myconnection.prepareStatement(myquery2); 
  
 mystatement1.setString(1, typeid);
  
 ResultSet myresult1=mystatement1.executeQuery();

 if(myresult1.next())
 {   
     
     out.print( "we have Following plans<br>");
do{
    

 out.print("# " + myresult1.getString("planname") + " " +myresult1.getString("price")+" Rs<br>");

}
  
 
 while(myresult1.next());
out.print("<br><br><div class='occasion-cart'><div id='request'><a href='plans2.jsp'> Request Membership</a></div></div><br><br><br>");

 }

  else
 {
 //out.print("<h2>No Requestt</h2>");
 }


 }
  catch(Exception e)
 {
 out.print("Error  2 in Query due to " + e.getMessage());
 }
  finally
 {
 //myconnection.close();
 }

 }
 catch(Exception e)
 {
 out.print("Error in Connection due to " + e.getMessage());
 }
 
 
 
 
 
 
 
 out.print( "</div><div class='color-quality'><div class='color-quality-left'></div><div class='clearfix'> </div></div><div class='occasion-cart'><div id='request'> </div></div><div class='clearfix'> </div></div></form><div class='clearfix'> </div></div>");
 
 
 out.print("<br><br>");
 
 }
 while(myresult.next());

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

 
 
     
     
     
 
      
 
 
 
 
 %>
                                                        
					
                                        
                                       
                                        
					
					 
                                        
                                    
				
						
<!--                                                <p><h5>We have 4 plans</h5>
                                                1. 1 Month plan  1500 RS<br>
                                                2. 3 Month plan  4000 RS<br>
                                                3. 6 Month plan  7500 RS<br>
                                                4. 12 Month plan 1000 RS<br>
                                                <br>
                                                -->
                                               
                                                
                                                
                                                <!--</p>-->
					
					
						
						
						
					
                                          
                                    
                                            <%
                                                
                                                if(request.getParameter("submit")!=null) 
  {
 
 response.sendRedirect("myaccount.jsp");
 }
                                                %>
                                                       
					
					
				
                                        
				
                       
				
			
				
                                                        
			
		
                    
                    <br>
                    <br>
<!--                    
                    <div class="col-md-8 single-left">
				<div class="col-md-5 single-right-left animated wow slideInUp" data-wow-delay=".5s">
					<div class="flexslider">
						<ul class="slides">
							<li data-thumb="images/yoga1.jpg">
                                                            <div class="thumb-image"> <img src="images/yoga1.jpg"  height="1500px"> </div>
							</li>
							<li data-thumb="images/yoga2.jpg">
								 <div class="thumb-image"> <img src="images/yoga2.jpg"  data-imagezoom="true" class="img-responsive"> </div>
							</li>
							
						</ul>
					</div>
					 flixslider 
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
					 flixslider 
				</div>
                                                        <form name="form3" method="post"><div class="col-md-7 single-right-left simpleCart_shelfItem animated wow slideInRight" data-wow-delay=".5s">
					<h3>YOGA STUDIO</h3>
                                        
                                        <h4><div class='simpleCart_shelfItem products-right-grid1-add-cart'><p><i></i></p></div></h4>
                                        
					<h4><span class="item_price"></h4>
					 
                                        
                                    
					<div class="description">
						<h3><i>Morning Yoga classes from 6-8 am </i></h3>
                                                <p><h5>We have 4 plans</h5>
                                                1. 1 Month plan  1000 RS<br>
                                                2. 3 Month plan  2700 RS<br>
                                                3. 6 Month plan  5000 RS<br>
                                                4. 12 Month plan 7800 RS<br>
                                                <br>
                                                
                                                
                                                
                                                
                                                </p>
					</div>
					<div class="color-quality">
						
						<div class="color-quality-left">
					</div>
						<div class="clearfix"> </div>
					</div>
                                        <br>
					<div class="occasion-cart">
                                            
                                                <div id="request"> </div>
                                            <%
                                                  // if(i==0)
                                                   {
                                                       
                                                      out.print("<div id='request'><a href='plans2.jsp'> Request Membership</a></div>");  
                                                    
                                                   }
                                                   

                                            %>
                                    
                                          
					
					
				</div>
                                        
				<div class="clearfix"> </div>
                       
				
			</div></form>
				
                                                        
			<div class="clearfix"> </div>
		</div>-->
                    
                    

<!-- //single -->
<!-- single-related-products -->          </div>
    </div>
    </div>
    </div>
    </div>

        
    </div>
    <br>
                    <br>s
    <%@include file="footer.jsp" %>    
        
    </body>
</html>
