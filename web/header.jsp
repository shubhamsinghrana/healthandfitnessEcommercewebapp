<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>


<%{%>
 <!-- header -->
	<div class="header">
		<div class="container">
			<div class="header-grid">
				<div class="header-grid-left animated wow slideInLeft" data-wow-delay=".5s">
					<ul>
						<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a href="mailto:fat2fit@gmail.com">fat2fit@gmail.com</a></li>
						<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>+1234 567 892</li>
						<% if(session.getAttribute("name")!=null)
                                                {
                                                  out.print("<li><i class='glyphicon glyphicon-log-in' aria-hidden='true'></i>Welcome "+session.getAttribute("name")+"</a></li>");
                                                out.print("<li><i class='glyphicon glyphicon-book' aria-hidden='true'></i><a href='logout.jsp'>Logout</a></li>");
                                                
                                                
                                                }
                                                else
                                                                                               
                                                { 
						out.print("<li><i class='glyphicon glyphicon-log-in' aria-hidden='true'></i><a href='login.jsp'>Login</a></li>");
							out.print("<li><i class='glyphicon glyphicon-book' aria-hidden='true'></i><a href='register.jsp'>Register</a></li>");
                                                }%>
					</ul>
				</div>
				
				<div class="clearfix"> </div>
			</div>
			<div class="logo-nav">
				<div class="logo-nav-left animated wow zoomIn" data-wow-delay=".5s">
					<h1><a href="index.jsp"> FAT 2FIT <span>MyFitnessHub</span></a></h1>
				</div>
				<div class="logo-nav-left1">
					<nav class="navbar navbar-default">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header nav_2">
						<button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
					</div> 
					<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
						<ul class="nav navbar-nav">
							<li class="active"><a href="index.jsp" class="act">Home</a></li>	
							<!-- Mega Menu -->
							<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Products <b class="caret"></b></a>
								<ul class="dropdown-menu multi-column columns-1">
									<div class="row1">
										<div class="col-sm-3">
											<ul class="multi-column-dropdown">
												<li><h6><a href="productdisplay.jsp">See All</a></h6></li>
                                                                                                
                                                                                                
                                                                                                <%
 String  image1="", category="", catid="",q="";
 try
 {
 Class.forName("com.mysql.jdbc.Driver");
Connection myconnection = DriverManager.getConnection("jdbc:mysql://localhost/gym", "root", "");
 try
 {
 String myquery="select * from addcategory ";
 PreparedStatement mystatement = myconnection.prepareStatement(myquery); 
 ResultSet myresult=mystatement.executeQuery();
 if(myresult.next())
 { 
 do{
 image1=myresult.getString("catimage");
 
 category=myresult.getString("catname");
 catid=myresult.getString("catid");
  out.print("<li><a href='productdisplay.jsp?cid="+catid+"'>"+category+"</a></li>");
 }
  
while(myresult.next());
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
												
												
												
											</ul>
										
										
										</div>
										<div class="clearfix"></div>
									</div>
								</ul>
							</li>
                                                        
							
                                                           <li><a href="plans.jsp">Plans</a></li>
							<li><a href="listofblogs.jsp">Blog</a></li>
							<li><a href="contactus.jsp">Contact Us</a></li>
						</ul>
					</div>
					</nav>
				</div>
				<div class="logo-nav-right">
					
						
						<!-- //search-scripts -->
				</div>
				<div class="header-right">
                                                                                                                                    <%
  int qty0=0,p1=0;
  //string q=""; 
 try
 {
 Class.forName("com.mysql.jdbc.Driver");
Connection myconnection = DriverManager.getConnection("jdbc:mysql://localhost/gym", "root", "");
 try
 {
 String myquery="select * from carttable where sessionid=? ";
 PreparedStatement mystatement = myconnection.prepareStatement(myquery); 
  mystatement.setString(1, String.valueOf(session.getId()));
 ResultSet myresult=mystatement.executeQuery();
 if(myresult.next())
 { 
 do{
 qty0=Integer.parseInt(myresult.getString("qty"))+qty0;
 p1=p1+Integer.parseInt(myresult.getString("price"));
 }
  
while(myresult.next());
 
 
      q="Total "+String.valueOf(qty0)+" item/items<br>"+" Value "+String.valueOf(p1)+"/-Rs";
 
     
    }
 else
 {
q="Empty cart";
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
					<div class="cart box_1">
						<a href="cartpage.jsp">
							<h3> <div class="total">
								<span ></span> </div>
								
							</h3>
						
						<p><img src="images/bag.png" alt="" /><%= q%></a></p>
						<div class="clearfix"> </div>
					</div>	</a>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!-- //header -->
<%}%>