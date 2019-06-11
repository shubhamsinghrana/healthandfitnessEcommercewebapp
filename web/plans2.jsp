

<html>
<head>
<title>MY GYM</title>
<%@page import="java.sql.*"%>
<%@ include file="head.jsp"%>
<%@ include file="header.jsp"%>
<%@ include file="myvariables.jsp"%>
</head>

<body>
  <%  
 if(session.getAttribute("name")!=null)
 {
  
 }
 else
 {
 session.setAttribute("plan", "true");
 response.sendRedirect("login.jsp");
 }
 

  String name="", phone="", email="";



Class.forName("com.mysql.jdbc.Driver");
try
{
   
Connection myconn = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
try
{
String q = "select * from usertable where email=?";
PreparedStatement myst = myconn.prepareStatement(q);
 myst.setString(1,String.valueOf(session.getAttribute("name")));
ResultSet myres = myst.executeQuery();
if(myres.next())
{

  name=myres.getString("name");
  phone=myres.getString("phone");
  email=myres.getString("email");
  //out.print("done");
    
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










  %>
    <div>
<div class="login-form-grids">
				<h5 class="animated wow slideInUp" data-wow-delay=".5s">plans information</h5>
				<form class="animated wow slideInUp" data-wow-delay=".5s" method="post">
                                    
                                    <div>  <br> </div>
					 
                                    
                                    
                                                          
                                    <select name="type" id="type" required="">
                                        <option>choose category</option>
<%
Class.forName("com.mysql.jdbc.Driver");
try
{
Connection myconn = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
try
{
String q = "select typeid,typename from typetable";
PreparedStatement myst = myconn.prepareStatement(q);
ResultSet myres = myst.executeQuery();
if(myres.next())
{
do
{
out.print("<option value='" + myres.getString("typename") + "'>" + myres.getString("typename") + "</option>");
}
while(myres.next()); 
}
else
{
out.print("<option>No type exist</option>");
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

%>    
</select>
         
<br><br>
<div id="subcatbox">
 <select name="subcatid">
 <option>Choose Category first</option>
 </select>
 </div>
                                    
<!--                                     <select name="plan" required="">                     
                                                  <option> choose type first <option>
                                                 
                                    </select><br><br>-->
<!--                                    <select name="planyoga">                     
                                                  <option> 1. 1 Month plan  1000 RS  <option>
                                                  <option>2. 3 Month plan  2700 RS  <option>
                                                 <option> 3. 6 Month plan  5500 RS  <option>
                                                  <option>4. 12 Month plan 7800 RS  <option>
                                     </select>-->
                                    
                                    
                                    
                                    
                                        
					<input type="submit"  name="submit">
				</form>
</div>
<% 
 if(request.getParameter("submit")!=null)
 {
     try              
        {
            Class.forName("com.mysql.jdbc.Driver");
           Connection myconn=DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
            try
            {
                 String myquery2="insert into plantable(username,phone,name,type,plan,status) values(?,?,?,?,?,?)";
                
                   PreparedStatement myst = myconn.prepareStatement(myquery2);
                 
                          myst.setString(1, email);
                         myst.setString(2, phone);
                          myst.setString(3, name);
                            myst.setString(4,request.getParameter("type"));
                            myst.setString(5,request.getParameter("subcatid"));
                          myst.setString(6, "requested");
                int myres = myst.executeUpdate();
                if(myres>0)
                {
                    out.print("request send");
                    response.sendRedirect("plans.jsp");
                }
                else
                {
                    out.print("request not send ");
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
    </div><br>
<%@ include file="footer.jsp"%>
<script type="text/javascript">
 $(document).ready(function(){
 $("#type").change(function(){
 typeid = $(this).val()
 $.ajax({
 method : "post",
 url : "ajax.jsp",
 data : {type1 : typeid}
 })
 .done(function(rdata){
 $("#subcatbox").html(rdata)
 });
 
 })
 })
 
 
 
 </script>
</body>
</html>