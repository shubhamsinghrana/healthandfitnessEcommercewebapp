<%@page import="java.text.SimpleDateFormat"%>
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
        
     		
                                <div class="login">
		<div class="container">
                    <h3 class="animated wow zoomIn" data-wow-delay=".5s">Shipping Details</h3>
			<p class="est animated wow zoomIn" data-wow-delay=".5s">Excepeur sint occaecat cupidatat non proident, sunt in culpa qui officia 
				deserunt mollit anim id est laborum.</p>
			<div class="login-form-grids animated wow slideInUp" data-wow-delay=".5s">
										<h6>Please fill following details</h6>
						<form method="post">
							<div class="key">
								
 <textarea name="address" cols="20" rows="10" class="form-control" placeholder="Shipping Address"></textarea>
								<div class="clearfix"></div>
							</div>
							
 Payment Mode <br>
 <label><input type="radio" name="paymentmode" value="cod">Cash on Delivery</label>
 <label><input type="radio" name="paymentmode" value="paytm">Paytm on 9834983948</label>
 
								<div class="clearfix"></div>
 <br>
							<input type="submit" value="Pay Now" name="pay">
						</form>
					</div>
					<div class="forg">
					
					
					</div>
 <%
 if(request.getParameter("pay")!=null)
 {
 boolean flag=false;
 try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
 try
 {
 String myquery="insert into ordertable(username,saledate,amount, address, "
 + "paymentmode) values(?,?,?,?,?)";
 PreparedStatement mystatement = myconnection.prepareStatement(myquery, PreparedStatement.RETURN_GENERATED_KEYS);
 mystatement.setString(1, session.getAttribute("name").toString());
 java.util.Date obj=new java.util.Date();
 SimpleDateFormat myformat=new SimpleDateFormat("yyyy-MM-dd");
 mystatement.setString(2, myformat.format(obj));
 mystatement.setString(3, session.getAttribute("grandtotal").toString());
 mystatement.setString(4, request.getParameter("address"));
 mystatement.setString(5, request.getParameter("paymentmode"));
 if(mystatement.executeUpdate()>0)
 {
 ResultSet myresult=mystatement.getGeneratedKeys();
 
 if(myresult.next())
 {
     
 String orderno=String.valueOf(myresult.getInt(1));
 
 session.setAttribute("orderno", orderno);
 String myquery2="select * from carttable where sessionid=?";
 
 PreparedStatement mystatement2 = myconnection.prepareStatement(myquery2);
 mystatement2.setString(1, session.getId().toString());
 ResultSet myresult2=mystatement2.executeQuery();
 if(myresult2.next())
 {
     
 do
 {
 
 String myquery3="insert into order_detail values(?,?,?,?,?,?,?)";

 PreparedStatement mystatement3 = myconnection.prepareStatement(myquery3);
  
 mystatement3.setString(1, orderno);

 mystatement3.setString(2, myresult2.getString("pid"));
 mystatement3.setString(3, myresult2.getString("pname"));
 
 mystatement3.setString(4, myresult2.getString("price"));
  
 mystatement3.setString(5, myresult2.getString("qty"));

 mystatement3.setString(6, myresult2.getString("totalcost"));

 mystatement3.setString(7, myresult2.getString("image"));
   
 if(mystatement3.executeUpdate()>0)
 {
     out.print("gigik");
 String myquery5="update producttable set qty=qty-? where productid=?";
 PreparedStatement mystatement5 = myconnection.prepareStatement(myquery5);
 mystatement5.setString(1, myresult2.getString("qty"));
 mystatement5.setString(2, myresult2.getString("pid"));
if(mystatement5.executeUpdate()>0)
 {
   flag=true;
 } 

 }
 }
 while(myresult2.next());
 String myquery4="delete from carttable where sessionid=?";
 PreparedStatement mystatement4 = myconnection.prepareStatement(myquery4);
 mystatement4.setString(1, session.getId().toString());
 if(mystatement4.executeUpdate()>0)
 {
 flag=true;
 }
 else
 {
 flag=false;
 }
 if(flag)
 {
 response.sendRedirect("thanks.jsp");
 }
 }
 }
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
		
	</div>
			<h4 class="animated wow slideInUp" data-wow-delay=".5s">For New People</h4>
			<p class="animated wow slideInUp" data-wow-delay=".5s"><a href="register.jsp">Register Here</a> (Or) go back to <a href="index.jsp">Home<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a></p>
		</div></div>
         <%@include file="footer.jsp" %>
           </body>
</html>