<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@ include file="myvariables.jsp"%>
<%
 if(request.getParameter("catid11")!=null)
 {
     out.print("<select name='subcatid'>");
     out.print("<option>Choose category first</option>");
     out.print("</select>");
 }
if(request.getParameter("catid1")!=null)
{
    String id=request.getParameter("catid1");
Class.forName("com.mysql.jdbc.Driver");
try
{
Connection myconn = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
try
{
    String q="select subcategoryid,subcatname from addsubcategory where categoryid=? " ;
   
    
PreparedStatement myst = myconn.prepareStatement(q);
 myst.setString(1, id);
ResultSet myres = myst.executeQuery();
out.print("<select name='subcatid'>");

if(myres.next())
{
   out.print("<option> Choose subcategory now</option>");
do
{
out.print("<option value='" + myres.getString("subcategoryid") + "'>" + myres.getString("subcatname") + "</option>");
}
while(myres.next()); 
}
else
{
out.print("<option>No Categories exist</option>");
}
out.print("</select>");
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


if(request.getParameter("catid11")!=null)
 {
     out.print("<select name='subcatid'>");
     out.print("<option>Choose category first</option>");
     out.print("</select>");
 }
else if(request.getParameter("type1")!=null)
{
    String id=request.getParameter("type1");
Class.forName("com.mysql.jdbc.Driver");
try
{
Connection myconn = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
try
{
    String q="select planname from plan2table where typeid=? " ;
   
    
PreparedStatement myst = myconn.prepareStatement(q);
 myst.setString(1, id);
ResultSet myres = myst.executeQuery();
out.print("<select name='subcatid'>");

if(myres.next())
{
   out.print("<option> Choose Plan now</option>");
do
{
out.print("<option value='" + myres.getString("planname") + "'>" + myres.getString("planname") + "</option>");
}
while(myres.next()); 
}
else
{
out.print("<option>No plan exist</option>");
}
out.print("</select>");
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

else if(request.getParameterValues("checkeditems[]")!=null)
 { 
 String ids[]=request.getParameterValues("checkeditems[]");
 for(String id : ids)
 {
 try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
 try
 {
 String myquery="delete from producttable where productid=?";
 PreparedStatement mystatement = myconnection.prepareStatement(myquery);
 mystatement.setString(1, id); 
 if(mystatement.executeUpdate()>0) 
 {
 out.print("success"); 
 }
 else
 {
 out.print("unsuccess");
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
 }
 
 
 
 
 
 
 
 
 
 
 
 
 else if(request.getParameter("pid1")!=null)
{
    String pid=request.getParameter("pid1");
Class.forName("com.mysql.jdbc.Driver");
try
{
Connection myconn = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
try
{
    String q="delete from producttable where  productid=? " ;
PreparedStatement myst = myconn.prepareStatement(q);
 myst.setString(1, pid);


if(myst.executeUpdate()>0)
{
out.print("success");
}

else
{
out.print("unsuccessful");
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



else if(request.getParameter("planid1")!=null)
{
    String pid=request.getParameter("planid1");
Class.forName("com.mysql.jdbc.Driver");
try
{
Connection myconn = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
try
{
    String q="delete from plan2table where  planid=? " ;
PreparedStatement myst = myconn.prepareStatement(q);
 myst.setString(1, pid);


if(myst.executeUpdate()>0)
{
out.print("success");
}

else
{
out.print("unsuccessful");
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

else if(request.getParameter("typeid1")!=null)
{
    String pid=request.getParameter("typeid1");
Class.forName("com.mysql.jdbc.Driver");
try
{
Connection myconn = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
try
{
    String q="delete from typetable where  typeid=? " ;
PreparedStatement myst = myconn.prepareStatement(q);
 myst.setString(1, pid);


if(myst.executeUpdate()>0)
{
out.print("success");
}

else
{
out.print("unsuccessful");
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









else if(request.getParameter("deleteuser")!=null)
{
    String pid=request.getParameter("deleteuser");
Class.forName("com.mysql.jdbc.Driver");
try
{
Connection myconn = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
try
{
    String q="delete from plantable where  srno=? " ;
PreparedStatement myst = myconn.prepareStatement(q);
 myst.setString(1, pid);


if(myst.executeUpdate()>0)
{
out.print("success");
}

else
{
out.print("unsuccessful");
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













else if(request.getParameter("activatestatus")!=null)
{
    String pid=request.getParameter("activatestatus");
Class.forName("com.mysql.jdbc.Driver");
try
{
Connection myconn = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
try
{
    String q="update plantable set status=? where srno=?"; ;
PreparedStatement myst = myconn.prepareStatement(q);
 myst.setString(1, "activated");
 myst.setString(2, pid);


if(myst.executeUpdate()>0)
{
out.print("success");
}

else
{
out.print("unsuccessful");
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








else if(request.getParameter("sid1")!=null)
{
    String sid=request.getParameter("sid1");
Class.forName("com.mysql.jdbc.Driver");
try
{
Connection myconn = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
try
{
    String q="delete from addsubcategory where  subcategoryid=? " ;
PreparedStatement myst = myconn.prepareStatement(q);
 myst.setString(1, sid);


if(myst.executeUpdate()>0)
{
out.print("success");
}

else
{
out.print("unsuccessful");
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
else if(request.getParameter("cid1")!=null)
{
    String cid=request.getParameter("cid1");
Class.forName("com.mysql.jdbc.Driver");
try
{
Connection myconn = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
try
{
    String q="delete from addcategory where  catid=? " ;
PreparedStatement myst = myconn.prepareStatement(q);
 myst.setString(1, cid);


if(myst.executeUpdate()>0)
{
out.print("success");
}

else
{
out.print("unsuccessful");
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

else if(request.getParameter("blogid1")!=null)
{
    String cid=request.getParameter("blogid1");
Class.forName("com.mysql.jdbc.Driver");
try
{
Connection myconn = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
try
{
    String q="delete from addblog where  srno=? " ;
PreparedStatement myst = myconn.prepareStatement(q);
 myst.setString(1, cid);


if(myst.executeUpdate()>0)
{
out.print("success");
}

else
{
out.print("unsuccessful");
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



else if(request.getParameter("srno")!=null)
{
      
    String id=request.getParameter("srno");
    
     
    
    
 
  
Class.forName("com.mysql.jdbc.Driver");
try
{
Connection myconn = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
try
{
   String q="delete from carttable where srno=? " ;
PreparedStatement myst = myconn.prepareStatement(q);
 myst.setString(1, id);


if(myst.executeUpdate()>0)
{
out.print("success");
}

else
{
out.print("unsuccessful");
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






if(request.getParameter("grandtotal")!=null)
 {
 String sessionid;
 sessionid=session.getId();
 
 try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
 try
 {
 String myquery="select sum(totalcost) from carttable where sessionid=?";
 PreparedStatement mystatement = myconnection.prepareStatement(myquery);
 mystatement.setString(1, sessionid); 
 ResultSet myresult=mystatement.executeQuery();
 
 if(myresult.next())
 {
  session.setAttribute("grandtotal", myresult.getInt(1));
 out.print(myresult.getInt(1));
 ;
 }
 else
 {
 out.print("noresult");
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






else if(request.getParameter("orderid1")!=null)
{
    
    
    
String id=request.getParameter("orderid1");










   
    
    
    
    try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
 try
 {
 String myquery="select * from ordertable where orderno=?";
 PreparedStatement mystatement = myconnection.prepareStatement(myquery); 
  mystatement.setString(1, id);
 ResultSet myresult=mystatement.executeQuery();

 if(myresult.next())
 {
    
     String username1=myresult.getString("username");
     String username2=myresult.getString("saledate");
     String username3=myresult.getString("amount");
    //out.print(username1);
     String username4=myresult.getString("address");
     String username5=myresult.getString("paymentmode");
 String myquery1="insert into ordertable2";
  PreparedStatement mystatement1 = myconnection.prepareStatement(myquery1);
 mystatement1.setString(1, id);
 mystatement1.setString(2, username1);
 mystatement1.setString(3, username2);
 mystatement1.setString(4, username3);
 mystatement1.setString(5,username4);
 mystatement1.setString(6, username5);
  
 }
 }

 catch(Exception e)
 {
 out.print("Error in Query due to " + e.getMessage());
 }
 }
 catch(Exception e)
 {
 out.print("Error in Connection due to " + e.getMessage());
 } 












Class.forName("com.mysql.jdbc.Driver");
try
{
Connection myconn = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
try
{
   String q="delete from ordertable where orderno=? " ;
PreparedStatement myst = myconn.prepareStatement(q);
 myst.setString(1, id);


if(myst.executeUpdate()>0)
{
out.print("success");
}

else
{
out.print("unsuccessful");
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
%>