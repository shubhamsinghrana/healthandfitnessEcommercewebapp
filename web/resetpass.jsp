<%@page import="java.util.Random"%>
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
			<h3 class="animated wow zoomIn" data-wow-delay=".5s"> Recover </h3>
			<p class="est animated wow zoomIn" data-wow-delay=".5s"></p>
			<div class="login-form-grids animated wow slideInUp" data-wow-delay=".5s">
                            <form method="post">
                                        new pass word
                                         <input type="password" placeholder="new password" required=" "  name="p1" >
                                        <br>
                                        confirm password
					  <input type="password" placeholder="new password" required=" "  name="p2" >
                                        <br>
				 <div class="g-recaptcha" data-sitekey="6Lf1i2YUAAAAAIE8BDEZKKiPWuOoNQ2Il4IqRFWr"></div>
					<input type="submit" value="Reset " name="login">
				</form>
		
        <% 
            //out.print(session.getAttribute("emailreset"));
 if(request.getParameter("login")!=null)
 {   
     try {
 String url =  "https://www.google.com/recaptcha/api/siteverify?"
 + "secret=6Lf1i2YUAAAAAMN5apXN9GYxeb21BoWQqCmSl2OV"
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
     String email12,otp;
     email12=request.getParameter("email");
     otp=request.getParameter("p1");
 try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection=DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
 try
 {
 String query="update usertable set password=SHA(MD5(?)) where email=?";
 PreparedStatement mystatement=myconnection.prepareStatement(query);
 mystatement.setString(1,otp);
 mystatement.setString(2, String.valueOf(session.getAttribute("emailreset")));

 
 int myres = mystatement.executeUpdate();
                if(myres>0)
                {
                    
                    
                    
                      response.sendRedirect("login.jsp");
                    
                    
                    
                    
                    try
{
Connection myconn = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
try
{
    String q="delete from otp where  username=? " ;
PreparedStatement myst = myconn.prepareStatement(q);
  myst.setString(1,String.valueOf(session.getAttribute("emailreset")) );


if(myst.executeUpdate()>0)
{

}

else
{

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
                    
                    
                    
                    
                    
                    
                    
                   response.sendRedirect("login.jsp");
                   
                   
                   
                   
                   
                   
                }
                else
                {
                    out.print("category not updated successfully");
                }
//   if(myresult2.next())
// {
//     session.setAttribute("adminname", "admin");
//     session.setAttribute("usertype", "admin");
// response.sendRedirect("orderdetails.jsp");
// }
//   else
//   { 
//       out.print("Wrong username/password");
//       
//   }
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
			<p class="animated wow slideInUp" data-wow-delay=".5s"><a href="register.jsp">Register Here</a> (Or) go back to <a href="index.jsp">Home<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a></p>
		</div></div>
<%@ include file="footer.jsp"%>
</body>
</html>