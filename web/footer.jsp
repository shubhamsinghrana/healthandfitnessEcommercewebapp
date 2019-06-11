<%@page import="java.sql.*"%>

<%{%>
<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="footer-grids">
				<div class="col-md-3 footer-grid animated wow slideInLeft" data-wow-delay=".5s">
					<h3>About Us</h3>
					<p>we provide services in health and fitness .We have Trained profesional for Teaching.We also provide authentic supplements in India.</span></p>
				</div>
				<div class="col-md-3 footer-grid animated wow slideInLeft" data-wow-delay=".6s">
					<h3>Contact Info</h3>
					<ul>
						<li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>1234 , 4th block, <span>Jalandhar City.</span></li>
						<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a href="mailto:Fat2fut@gmail.com">fat2fit@gmail.com</a></li>
						<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>+1234 567 567</li>
					</ul>
				</div>
				<div class="col-md-3 footer-grid animated wow slideInLeft" data-wow-delay=".7s">
					<h3>Latest Products</h3>
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        <%
 String image4="",myquery5,pid5="";
 try
 {
     PreparedStatement mystatement;
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection = DriverManager.getConnection("jdbc:mysql://localhost/gym", "root", "");
 try
 {
     if(request.getParameter("cid")!=null)
   { myquery5="select * from producttable  where catid=? " ;
     mystatement = myconnection.prepareStatement(myquery5); 
   mystatement.setString(1, request.getParameter("cid"));}
     
     else
     {
  myquery5="select * from producttable order by productid limit 0,9" ;// desc limit 0,5";
    mystatement = myconnection.prepareStatement(myquery5); 
     }

  ResultSet myresult=mystatement.executeQuery();

 if(myresult.next())
 {
 out.print(""); do
 {
     pid5=myresult.getString("productid");
 out.print("<div class='footer-grid-left'><a href='single.jsp?pid="+ pid5 +"' class='product-image'><img src='pics/" + myresult.getString("image1") + "' width='40px' height='40px' ></a></div>");
 }
 while(myresult.next());
 out.print("<div class='clearfix'> </div>");
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
					
					<div class="clearfix"> </div>
				</div>
				<div class="col-md-3 footer-grid animated wow slideInLeft" data-wow-delay=".8s">
					<h3>Blog Posts</h3>
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        <% 

   try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection = DriverManager.getConnection("jdbc:mysql://localhost/gym", "root", "");
 try
 {
  String myquery1="select * from addblog order by srno desc limit 0,2 ";
  PreparedStatement mystatement = myconnection.prepareStatement(myquery1); 
 ResultSet myresult=mystatement.executeQuery();

 if(myresult.next())
 {
 do
 {
     
     
     
     out.print("<div class='footer-grid-sub-grids'><div class='footer-grid-sub-grid-left'><a href='pics/" + myresult.getString("image") + "'><img src='pics/" + myresult.getString("image") + "' width='50px' height='70px' ></a></div>");
						
     
     out.print("<div class='footer-grid-sub-grid-right'><a href=seeblog.jsp?id=" 
 + myresult.getString("srno") + "><p>"+  myresult.getString("about") +"</p></a></h4><p> Posted On "+ myresult.getString("postdate")  +"</p></div><div class='clearfix'></div></div> ");
     
     
     
     
     
     
     
     
     
//     
// out.print("<tr>"
// + "<td>" + myresult.getString("postdate") + "</td>");
// out.print("<td>" + myresult.getString("authername") + "</td>");
// out.print("<td><a href='pics/" + myresult.getString("image") + "'><img src='pics/" + myresult.getString("image") + "' width='50px' ></a></td>");
// out.print("<td>" + myresult.getString("about") + "</td>");
// out.print("<td><a href=seeblog.jsp?id=" 
// + myresult.getString("srno") + ">See Blog</td>");
// 
// out.print("</tr>");
// 
 
 }
 while(myresult.next());

 }

 else
 {
 out.print("<h2>No category added</h2>");
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
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                       
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="footer-logo animated wow slideInUp" data-wow-delay=".5s">
				<h2><a href="index.jsp">FAT2FIT <span>My FitnessHub</span></a></h2>
			</div>
			<div class="copy-right animated wow slideInUp" data-wow-delay=".5s">
				<p>&copy 2016 FAT2FIT. All rights reserved | Design by <a href="http://w3layouts.com/">W3layouts</a></p>
			</div>
		</div>
	</div>
<!-- //footer -->
<%}%>