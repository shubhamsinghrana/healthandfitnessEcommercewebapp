  <%@page import="java.util.Random"%> 
 
<%@page import="org.json.JSONObject"%>
<%@page import="java.nio.charset.Charset"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.InputStream"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
					<input type="email" placeholder="Email Address" required=" "  name="email" >
                                        <br>
				 <div class="g-recaptcha" data-sitekey="6Lf1i2YUAAAAAIE8BDEZKKiPWuOoNQ2Il4IqRFWr"></div>
					<input type="submit" value="send otp" name="login">
				</form>
		
        <% 
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
     String email12,password1;
     email12=request.getParameter("email");

 try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection=DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
 try
 {
 String query="select * from usertable where email=?";
 PreparedStatement mystatement=myconnection.prepareStatement(query);
 mystatement.setString(1, email12);

 ResultSet myresult=mystatement.executeQuery();
 
// String query2="select * from admintable where email=? and password=?";
// PreparedStatement mystatement2=myconnection.prepareStatement(query2);
//  mystatement2.setString(1, email12);
// mystatement2.setString(2, password1);
//
// ResultSet myresult2=mystatement2.executeQuery();
   if(myresult.next())
 {
     
     
  Random rand = new Random();
 int n = rand.nextInt(9999);
 out.print(n);
 Properties props = new Properties();
props.put("mail.smtp.host", "smtp.gmail.com");
props.put("mail.smtp.socketFactory.port", "465");
props.put("mail.smtp.socketFactory.class",
"javax.net.ssl.SSLSocketFactory");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.port", "465");

Session session2 = Session.getInstance(props,
new javax.mail.Authenticator() {
protected PasswordAuthentication getPasswordAuthentication() {
return new PasswordAuthentication("shubhamsinghrana5898@gmail.com","shubham9");
}
});
try {
Message message = new MimeMessage(session2);
message.addHeader("Content-type", "text/html; charset=UTF-8");
message.setFrom(new InternetAddress("shubhamsinghrana5898@gmail.com"));
message.setRecipients(Message.RecipientType.TO,	InternetAddress.parse(email12));
message.setSubject("Reset your password");

message.setText("your otp for password reeset is" + n);

 


Transport.send(message);

 

}
catch (MessagingException e)
{
throw new RuntimeException(e);
}



  try
        {
            Class.forName("com.mysql.jdbc.Driver");
           Connection myconn=DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
            try
            {
                String q = "insert into otp(username,otp) values(?,?)";
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1,  email12);
                 myst.setInt(2, n);
                int myres = myst.executeUpdate();
                if(myres>0)
                {
                    out.print("otp send successfully");
                     response.sendRedirect("reset.jsp");
                }
                else
                {
                    out.print("otp not send successfully");
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