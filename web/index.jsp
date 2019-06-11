<!DOCTYPE html>
<html>
<head>
<title>MY GYM</title>

<%@ include file="head.jsp"%>
<%@ include file="header.jsp"%>
<%@ include file="myvariables.jsp"%>
</head>

<body>
<div class="banner">
		<div class="container">
			<div class="banner-info animated wow zoomIn" data-wow-delay=".5s">
				<h3 >MY FITNESS HUB</h3>
				<div class="wmuSlider example1">
                                    
					<div class="wmuSliderWrapper">
						<article  style="position: absolute; width: 100%; opacity: 100;"> 
							<div class="banner-wrap">
								<div class="banner-info1">
                                                                    <div align="center"><p color="black" align="center">Health Supplements</p></div>
								</div>
							</div>
						</article>
						<article style="position: absolute; width: 100%; opacity: 0;"> 
							<div class="banner-wrap">
								<div class="banner-info1">
                                                                    <div align="center"><p>GYM & Yoga plans</p></div>
								</div>
							</div>
						</article>
						<article style="position: absolute; width: 100%; opacity: 0;"> 
							<div class="banner-wrap">
								<div class="banner-info1">
                                                                    <div align="center"><p align="center">Health Blogs</p></div>
								</div>
							</div>
						</article>
					</div>
				</div>
					<script src="js/jquery.wmuSlider.js"></script> 
					<script>
						$('.example1').wmuSlider();         
					</script> 
			</div>
		</div>
	</div>
<!-- //banner -->
<!-- banner-bottom -->
	<div class="banner-bottom">
		<div class="container"> 
			<div class="banner-bottom-grids">
				<div class="banner-bottom-grid-left animated wow slideInLeft" data-wow-delay=".5s">
					<div class="grid">
						<figure class="effect-julia">
                                                    <a href="productdisplay.jsp"><img src="images/41.jpg" alt=" " class="img-responsive" />
							<figcaption>
								<h3>MYFITNESS<span>HUB</span><i> Supplement Store</i></h3>
								<div>
									<p>On Whey protien</p>
									<p>Myprotien Whey Protien</p>
									<p>Accesseries</p>
								</div>
							</figcaption>	</a>		
						</figure>
					</div>
				</div>
				<div class="banner-bottom-grid-left1 animated wow slideInUp" data-wow-delay=".5s">
					<div class="banner-bottom-grid-left-grid left1-grid grid-left-grid1">
						<div class="banner-bottom-grid-left-grid1">
							<a href="plans.jsp"><img src="images/111.jpg" alt=" " class="img-responsive" />
						</div>
						<div class="banner-bottom-grid-left1-pos">
							<p>Browse Plans</p>
                                                </div></a>
					</div>
					<div class="banner-bottom-grid-left-grid left1-grid grid-left-grid1">
						<div class="banner-bottom-grid-left-grid1">
							<a href="listofblogs.jsp"><img src="images/222.jpg" alt=" " class="img-responsive" />
						</div>
						<div class="banner-bottom-grid-left1-position">
							<div class="banner-bottom-grid-left1-pos1">
								<p>FITNESS BLOGS</p>
							</div>
                                                </div></a>
					</div>
				</div>
				<div class="banner-bottom-grid-right animated wow slideInRight" data-wow-delay=".5s">
					<div class="banner-bottom-grid-left-grid grid-left-grid1">
						<div class="banner-bottom-grid-left-grid1">
							<a href="contactus.jsp"><img src="images/311.jpg" alt=" " class="img-responsive" />
						</div>
						<div class="grid-left-grid1-pos">
							<p>Contact Us <span></span></p>
                                                </div></a>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<div>       
    <div align="center"><h1>LATEST PRODUCTS</h1></div>
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
  myquery="select * from producttable order by productid limit 0,6" ;// desc limit 0,5";
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

</div>
 <br>
 <br>
 <div><div align="center"><h1>LATEST BlOGS</h1></div>
 
 
 
 
 <% 

   try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
 try
 {
  String myquery1="select * from addblog order by srno desc limit 0,2 ";
  PreparedStatement mystatement = myconnection.prepareStatement(myquery1); 
 ResultSet myresult=mystatement.executeQuery();

 if(myresult.next())
 {
     
 out.print("<table name='mytable' id='mytable' class='table table-hover'>" +
 "<thead><th>POST DATE</th><th>AUTHER NAME</th><th>IMAGE</th><th>ABOUT</th><th>SEE BLOG</th>"
 + "</thead>"
 + "<tbody>");
 do
 {
 out.print("<tr>"
 + "<td>" + myresult.getString("postdate") + "</td>");
 out.print("<td>" + myresult.getString("authername") + "</td>");
 out.print("<td><a href='pics/" + myresult.getString("image") + "'><img src='pics/" + myresult.getString("image") + "' width='50px' ></a></td>");
 out.print("<td>" + myresult.getString("about") + "</td>");
 out.print("<td><a href=seeblog.jsp?id=" 
 + myresult.getString("srno") + ">See Blog</td>");
 
 out.print("</tr>");
 
 
 }
 while(myresult.next());
 out.print("</tbody></table>");
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



















<!-- //banner-bottom -->
<%@ include file="footer.jsp"%>
</body>
</html>