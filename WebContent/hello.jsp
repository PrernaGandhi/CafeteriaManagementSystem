<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="hello.html" %>
<%@page import="java.sql.*" %>
<%  
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=(Connection) DriverManager.getConnection(  
	"jdbc:mysql://localhost:3306/project","root","root");
	String name=request.getParameter("ID");
	String password=request.getParameter("Password");
	String x=request.getParameter("register");
	String query="insert into login(id,password)values(?,?)";
	
	int i=0;
	PreparedStatement stmt=null;
	try{
	if("Register".equals(x))
	{
		 stmt=(PreparedStatement) con.prepareStatement(query);  
		 stmt.setString(1,name);
		 stmt.setString(2,password);
		 i=stmt.executeUpdate();
		 %>
		 <jsp:forward page = "done.html" />
		 <%
		out.print("Successfully Registered!!!");
	}
	}
	catch(Exception e)
	{
		out.print("Already registered!!");
	}
	
 %>