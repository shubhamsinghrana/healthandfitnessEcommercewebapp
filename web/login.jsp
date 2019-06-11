<%@page import="org.json.JSONObject"%>
<%@page import="java.nio.charset.Charset"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.InputStream"%>
<!DOCTYPE html>
<html>
<head>
<title>MY GYM</title>
<%@page import="java.sql.*"%>
<%@ include file="head.jsp"%>
<%@ include file="header.jsp"%>
<%@ include file="myvariables.jsp" %>
<script src='https://www.google.com/recaptcha/api.js'></script>
</head>
<body>
    
    <div class="login">
		<div class="container">
			<h3 class="animated wow zoomIn" data-wow-delay=".5s">Login Form</h3>
			<p class="est animated wow zoomIn" data-wow-delay=".5s"></p>
			<div class="login-form-grids animated wow slideInUp" data-wow-delay=".5s">
                            <form method="post">
					<input type="email" placeholder="Email Address" required=" "  name="email" >
					<input type="password" placeholder="Password" required=" " name="password" >
                                        <br>
				 <div class="g-recaptcha" data-sitekey="6Lf1i2YUAAAAAIE8BDEZKKiPWuOoNQ2Il4IqRFWr"></div>
					<input type="submit" value="Login" name="login">
				</form>
		
        <% 
 if(request.getParameter("login")!=null)
 {   
     try {
 String url =  "https://www.google.com/recaptcha/api/siteverify?"
 + "secret=****************yourkey*********************"
 + "&response=" + request.getParameter("g-recaptcha-response");
 InputStream res = new URL(url).openStream();
 BufferedReader rd = new BufferedReader(new InputStreamReader(res, Charset.forName("UTF-8")));

 StringBuilder sb = new StringBuilder();
 int cp;
 while ((cp = rd.read()) != -1) {
 sb.append((char) cp);
 }
 String jsonText = sb.toString();
 res.close();
 
 JSONObject json = new JSONObject(jsonText);
 if(json.getBoolean("success")==true)
 {
     String email12,password1;
     email12=request.getParameter("email");
     password1=request.getParameter("password");

 try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection=DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
 try
 {
 String query="select * from usertable where email=? and password=SHA(MD5(?))";
 PreparedStatement mystatement=myconnection.prepareStatement(query);
 mystatement.setString(1, email12);
 mystatement.setString(2, password1);
 ResultSet myresult=mystatement.executeQuery();
 
 String query2="select * from admintable where email=? and password=?";
 PreparedStatement mystatement2=myconnection.prepareStatement(query2);
  mystatement2.setString(1, email12);
 mystatement2.setString(2, password1);

 ResultSet myresult2=mystatement2.executeQuery();
   if(myresult.next())
 {
     session.setAttribute("name", myresult.getString("email"));
     session.setAttribute("usertype", "normal");
     if(session.getAttribute("shoppingcart")!=null)
     {
          response.sendRedirect("shippingdetails.jsp");
     }
     else if(session.getAttribute("plan")!=null)
     {
          response.sendRedirect("plans2.jsp");
     }
 response.sendRedirect("index.jsp");
 }
   if(myresult2.next())
 {
     session.setAttribute("adminname", "admin");
     session.setAttribute("usertype", "admin");
 response.sendRedirect("orderdetails.jsp");
 }
   else
   { 
       out.print("Wrong username/password");
       
   }
 }
 catch(Exception e)
 {
 out.print("Error in Query" + e.getMessage());
 }
 
 }
 catch(Exception e)
 {
 out.print("Error in Connection" + e.getMessage() );
 }
     }
  else
 {
 out.print("Confirm you are human");
 }
 } catch (Exception e) {
 out.print(e.getMessage());
 } 
 }
%>	</div>
			<h4 class="animated wow slideInUp" data-wow-delay=".5s">For New People</h4>
                        <p class="animated wow slideInUp" data-wow-delay=".5s"><a href="recoverpassword.jsp">Forget Password</a> 
			<p class="animated wow slideInUp" data-wow-delay=".5s"><a href="register.jsp">Register Here</a> (Or) go back to <a href="index.jsp">Home<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a></p>
		</div></div>
<%@ include file="footer.jsp"%>
</body>
</html>
