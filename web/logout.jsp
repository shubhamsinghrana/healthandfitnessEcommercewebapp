<%
    
if(session.getAttribute("name")!=null)
{


session.removeAttribute("name");

}
else if(session.getAttribute("adminname")!=null)
{


session.removeAttribute("adminname");

}
session.invalidate();
response.sendRedirect("index.jsp");
%>