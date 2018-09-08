<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="index.html" %>
<%@page import="java.sql.*" %>
<%  
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=(Connection) DriverManager.getConnection(  
	"jdbc:mysql://localhost:3306/project","root","root");
	String name=request.getParameter("ID");
	session.setAttribute("id",name);
	String password=request.getParameter("Password");
	String x=request.getParameter("submit");
	String pass="select password from login where id='"+name+"'";
	String s=null;
	int i=0;
	Statement stmt=con.createStatement();
	 ResultSet rs;
	try{
	if("Submit".equals(x))
	{
		rs=stmt.executeQuery(pass);
		while(rs.next())
		s=rs.getString(1);
		 if((s).equals(password))
		{
			 out.print("Authentication succedeed!!");
			 %>
			 <jsp:forward page = "Menus.html" />
			 
			 <%
			 
		}
		 else
		 {
			 %>
			 <script type="text/javascript">

			 alert("Wrong Password");
			 </script>

			 <%
		 }
	}
	}
	catch(Exception e)
	{
		out.println(e);
	
		 %>
		 <script type="text/javascript">

		 alert("Try Again");
		 </script>

		 <%
	}
 %>