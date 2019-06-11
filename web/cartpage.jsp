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
      

        
        
       <div class="container">
 <div class="content">
 
 <br>
 <%
     if(request.getParameter("pid")!=null)
     {
     
    
     
 String image="", price="", pname="",pid="",image2="",pid2="",mrp="",qty="",dis="";
 int discount=0;
 try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
 try
 {
 String myquery="select * from producttable where productid=?";
 PreparedStatement mystatement = myconnection.prepareStatement(myquery); 
 mystatement.setString(1, request.getParameter("pid"));
 ResultSet myresult=mystatement.executeQuery();
 session.setAttribute("pid", request.getParameter("pid"));

 if(myresult.next())
 {
 
  mrp=myresult.getString("mrp");
  qty=myresult.getString("qty");
 dis=myresult.getString("dis");
 image=myresult.getString("image1");
 image2=myresult.getString("image2");
 price=myresult.getString("price");
 pname=myresult.getString("productname");
  session.setAttribute("pname", pname);
 session.setAttribute("price", price);
 session.setAttribute("image", image);
     
  discount = Integer.parseInt(mrp)-Integer.parseInt(price);   
 
 }

 else
 {
 out.print("<h3>No Products found</h3>");
 }


 }
 catch(Exception e)
 {
 out.print("Error in Query1  due to " + e.getMessage());
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





try              
        {
            Class.forName("com.mysql.jdbc.Driver");
           Connection myconn=DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
            try
            {
                 String myquery2="insert into carttable(pid,pname,price,qty,totalcost,sessionid,image) values(?,?,?,?,?,?,?)";
                
                   PreparedStatement myst = myconn.prepareStatement(myquery2);
                 
                         myst.setString(1, session.getAttribute("pid").toString());
                         myst.setString(2, session.getAttribute("pname").toString());
                          myst.setString(3, session.getAttribute("price").toString());
                           myst.setString(4,  "1");
                          myst.setInt(5, Integer.parseInt("1") * Integer.parseInt(session.getAttribute("price").toString()));
                          myst.setString(6, session.getId().toString());
                          myst.setString(7, session.getAttribute("image").toString());
                int myres = myst.executeUpdate();
                if(myres>0)
                {
                    response.sendRedirect("cartpage.jsp");
                }
                else
                {
                    out.print("Product not added ");
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
 
 
 <%

 try
 {
 Class.forName("com.mysql.jdbc.Driver");
 Connection myconnection = DriverManager.getConnection(PATH+PLACE, UNAME, PASSWORD);
 try
 {
 String myquery="select * from carttable where sessionid=?";
 PreparedStatement mystatement = myconnection.prepareStatement(myquery); 
 mystatement.setString(1, session.getId().toString());
 ResultSet myresult=mystatement.executeQuery();

 if(myresult.next())
 {
 out.print("<h1 align='center'>Shopping Cart</h1>");
 out.print("<form><table class='table table-hover'>" +
 "<thead><th>Image</th><th>Name</th><th>Price</th>"
 + "<th>Qty</th><th>Total Cost</th><th>Delete</th>"
 + "</thead>"
 + "<tbody>");
 do
 {
 out.print("<tr>");
 out.print("<td><a href='pics/" + myresult.getString("image") + "'><img src='pics/" + myresult.getString("image") + "' width='50px'></a></td>" 
 + "<td>" + myresult.getString("pname") + "</td>");
 out.print("<td>" + myresult.getString("price") + "</td>");
 
 out.print("<td>" + myresult.getString("qty") + "</td>");
 out.print("<td>" + myresult.getString("totalcost") + "</td>");
 
 out.print("<td><a href='#' srno="+ myresult.getString("srno") +" class='deletelink'>Delete</td>");
 out.print("</tr>");
 
 
 }
 while(myresult.next());
 

 //out.print("grand total");
 
 out.print("<tr><td colspan='2'> Grand total </td><td><div id='grandtotal'></div><input type='submit' name='continue' value='Continue Shopping'> <input type='submit' name='checkout' value='Checkout'></form></td></tr>");
 out.print("</tbody></table>"); 
 }

 else
 {
 out.print("<h2>No Products added</h2>");
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
 
 
 
 <%
     
if(request.getParameter("continue")!=null) 
 {
 response.sendRedirect("index.jsp");
 }
 if(request.getParameter("checkout")!=null) 
 {
 if(session.getAttribute("name")!=null)
 {
    // session.setAttribute("grandtotal", );
 response.sendRedirect("shippingdetails.jsp");
 }
 else
 {
 session.setAttribute("shoppingcart", "true");
 response.sendRedirect("login.jsp");
 }
 }
 
%>
 
 </div>
 </div>
 <%@include file="footer.jsp" %>
 <script type="text/javascript">
 $(document).ready(function(){
 
 $(".deletelink").click(function(e){
 e.preventDefault()
 answer = confirm("Are you sure you really want to delete?")
 if(answer)
 {
 var id = $(this).attr("srno")
 var parent_td = $(this).parent()
 var parent_tr = $(this).parent().parent()
 $.ajax({
 method : "post",
 url : "ajax.jsp",
 data : {srno : id}
 })
 .done(function(rdata){
 if($.trim(rdata)=="success")
 {
 parent_tr.css({'backgroundColor':'#fb6c6c'});
 parent_tr.fadeOut(600,function()
 {
 parent_tr.remove()
 showgrandtotal();
 })
 } 
 })
 }
 })
 
 showgrandtotal();
 
 function showgrandtotal()
 {
 $.ajax({
 method : "post",
 url : "ajax.jsp",
 data : {"grandtotal" : "yes"}
 })
 .done(function(rdata){
 $("#grandtotal").html(rdata)
 }) 
 }
 })
 
 </script> 
 
    </body>
</html>