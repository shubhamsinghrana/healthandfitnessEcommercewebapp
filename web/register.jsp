

<html>
<head>
<title>MY GYM</title>
<%@page import="java.sql.*"%>
<%@ include file="head.jsp"%>
<%@ include file="header.jsp"%>
<%@ include file="myvariables.jsp"%>
</head>

<body>
<div class="login-form-grids">
				<h5 class="animated wow slideInUp" data-wow-delay=".5s">profile information</h5>
				<form class="animated wow slideInUp" data-wow-delay=".5s" method="post">
                                    <input type="text" placeholder="Name" required=" " name="name"  >
                                    <div>  <br> </div>
					<div class="input-group input-group-sm animated wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="500ms">
				<span class="input-group-addon" id="sizing-addon3">Ph</span>
                                <input type="number" class="form-control" placeholder="Phone" name="phone"  required=" ">
			</div>
                                        <h6 class="animated wow slideInUp" data-wow-delay=".5s">Login information</h6>
					<input type="email" placeholder="Email Address" name="email" required=" " >
					<input type="password" placeholder="Password" name="password" required=" " >
					<input type="password" placeholder="Password Confirmation" name="password1" required=" " >
					<input type="submit"  name="submit">
				</form>
			
<% 
 if(request.getParameter("submit")!=null)
 {
     String name1,password1,password2,email1,phone1;
     name1=request.getParameter("name");
     password1=request.getParameter("password");
     password2=request.getParameter("password1");
     email1=request.getParameter("email");
     phone1=request.getParameter("phone");

 if(password1.equals(password2))
 {
 try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection=DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
 try
 {
 String query="insert into usertable values(?,SHA(MD5(?)),?,?)";
 PreparedStatement mystatement=myconnection.prepareStatement(query);
 mystatement.setString(1, name1);
 mystatement.setString(2, password1);
 mystatement.setString(3, email1);
 mystatement.setString(4, phone1);
   if(mystatement.executeUpdate()>0)
 {
 out.print("Signup Successful");
 }
 }
 catch(Exception e)
 {
  if(e.getMessage().equals("Duplicate entry '"+email1+"' for key 'PRIMARY'"))
 {
 out.print("email register already");
 }
 else
 {out.print("Error in Query" + e.getMessage());
 }
 }
 
 }
 catch(Exception e)
 {
 out.print("<p class='bg-danger'>Error in Connection" + e.getMessage() + "</p>");
 }
 
 }
 
 else{
 
 out.print("Password donot match");
 
 }
   

 }
%>
</div>

<br>
</div>
<%@ include file="footer.jsp"%>
</body>
</html>