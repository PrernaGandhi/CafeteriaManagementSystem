<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">

	<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="css/animate1.css">
	<!-- Custom Stylesheet -->
	<link rel="stylesheet" href="css/style1.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Calculate Price</title>
</head>
<body>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<% 

String rajmachawal=request.getParameter("rajmachawal");
String rajmachawal_p=request.getParameter("rajmachawal_p");
String cholebhature=request.getParameter("cholebhature");
String cholebhature_p=request.getParameter("cholebhature_p");
String dosa=request.getParameter("dosa"); 
String dosa_p=request.getParameter("dosa_p");
String pavbhaji=request.getParameter("pavbhaji");
String pavbhaji_p=request.getParameter("pavbhaji_p");

String sandwich=request.getParameter("sandwich");
String sandwich_p=request.getParameter("sandwich_p");
String burger=request.getParameter("burger");
String burger_p=request.getParameter("burger_p");
String samosa=request.getParameter("samosa");
String samosa_p=request.getParameter("samosa_p");
String pasta=request.getParameter("pasta");
String pasta_p=request.getParameter("pasta_p");
String noodles=request.getParameter("noodles");
String noodles_p=request.getParameter("noodles_p");

String tea=request.getParameter("tea");
String tea_p=request.getParameter("tea_p");
String coffee=request.getParameter("coffee");
String coffee_p=request.getParameter("coffee_p");
String juice=request.getParameter("juice");
String juice_p=request.getParameter("juice_p");
String frappy=request.getParameter("frappy");
String frappy_p=request.getParameter("frappy_p");
String colddrink=request.getParameter("colddrink");
String colddrink_p=request.getParameter("colddrink_p");

int total=0; 

if(rajmachawal!=null){ 
int rajmachawalprice=Integer.parseInt(rajmachawal);
int rajmachawal_quantity=Integer.parseInt(rajmachawal_p);
total+=rajmachawalprice*rajmachawal_quantity; 
} 
if(cholebhature!=null){ 
int cholebhatureprice=Integer.parseInt(cholebhature);
int cholebhature_quantity=Integer.parseInt(cholebhature_p);
total+=cholebhatureprice*cholebhature_quantity; 
} 
if(dosa!=null){ 
int dosaprice=Integer.parseInt(dosa);
int dosa_quantity=Integer.parseInt(dosa_p);
total+=dosaprice*dosa_quantity; 
} 
if(pavbhaji!=null){ 
int pavbhajiprice=Integer.parseInt(pavbhaji);
int pavbhaji_quantity=Integer.parseInt(pavbhaji_p);
total+=pavbhajiprice*pavbhaji_quantity; 
} 
if(sandwich!=null){ 
int sandwichprice=Integer.parseInt(sandwich);
int sandwich_quantity=Integer.parseInt(sandwich_p);
total+=sandwichprice*sandwich_quantity; 
} 
if(burger!=null){ 
int burgerprice=Integer.parseInt(burger);
int burger_quantity=Integer.parseInt(burger_p);
total+=burgerprice*burger_quantity; 
} 
if(samosa!=null){ 
int samosaprice=Integer.parseInt(samosa);
int samosa_quantity=Integer.parseInt(samosa_p);
total+=samosaprice*samosa_quantity; 
} 
if(pasta!=null){ 
int pastaprice=Integer.parseInt(pasta);
int pasta_quantity=Integer.parseInt(pasta_p);
total+=pastaprice*pasta_quantity; 
} 
if(noodles!=null){ 
int noodlesprice=Integer.parseInt(noodles);
int noodles_quantity=Integer.parseInt(noodles_p);
total+=noodlesprice*noodles_quantity; 
} 
if(tea!=null)
{
	int teaprice=Integer.parseInt(tea);
	int tea_quantity=Integer.parseInt(tea_p);
	total+=teaprice*tea_quantity;
}
if(coffee!=null)
{
	int coffeeprice=Integer.parseInt(coffee);
	int coffee_quantity=Integer.parseInt(coffee_p);
	total+=coffeeprice*coffee_quantity;
}
if(juice!=null)
{
	int juiceprice=Integer.parseInt(juice);
	int juice_quantity=Integer.parseInt(juice_p);
	total+=juiceprice*juice_quantity;
}
if(frappy!=null)
{
	int frappyprice=Integer.parseInt(frappy);
	int frappy_quantity=Integer.parseInt(frappy_p);
	total+=frappyprice*frappy_quantity;
}
if(colddrink!=null)
{
	int colddrinkprice=Integer.parseInt(colddrink);
	int colddrink_quantity=Integer.parseInt(colddrink_p);
	total+=colddrinkprice*colddrink_quantity;
}

//out.println("Total Price: "+total); 
request.setAttribute("total", total);


Class.forName("com.mysql.jdbc.Driver");  
Connection con=(Connection) DriverManager.getConnection(  
"jdbc:mysql://localhost:3306/project","root","root");
String query="insert into bill(id,bill_amt,order_id)values(?,?,?)";
Random rand = new Random();int order_number = rand.nextInt(90000) + 10000;
PreparedStatement stmt=null;
request.setAttribute("order_number", order_number);

int i=0;
try{
stmt=(PreparedStatement) con.prepareStatement(query);  
stmt.setString(1,session.getAttribute("id").toString());
stmt.setInt(2,total);
stmt.setInt(3,order_number);
i=stmt.executeUpdate();
out.print("Successfully updated!!!");
}catch(Exception e)
{
	
}
//out.print("ID: "+session.getAttribute("id"));
%> 
<div class="container">
		<div class="login-box animated fadeInUp">
		<font face = "Comic sans MS" size =" 5">Total:  <%=request.getAttribute("total")%></font>
		<br>
		<br>
		<font face = "Comic sans MS" size =" 5">Order Number:  <%=request.getAttribute("order_number")%></font>
		<br>
		<br>
			<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="business" value="prerna-seller@gmail.com">

<input type="hidden" name="cmd" value="_xclick">
<input type="hidden" name="amount" value="<%=total%>">

<input type="hidden" name="hosted_button_id" value="SUG63AZ3VNMVS">
<input type="image" src="https://www.paypalobjects.com/webstatic/en_US/i/btn/png/btn_buynow_107x26.png" alt="Buy Now">
<img alt="" src="https://paypalobjects.com/en_US/i/scr/pixel.gif"
    width="1" height="1">
</form>
		</div>
	</div>
</body>

<script>
	$(document).ready(function () {
    	$('#logo').addClass('animated fadeInDown');
    	$("input:text:visible:first").focus();
	});
	$('#username').focus(function() {
		$('label[for="username"]').addClass('selected');
	});
	$('#username').blur(function() {
		$('label[for="username"]').removeClass('selected');
	});
	$('#password').focus(function() {
		$('label[for="password"]').addClass('selected');
	});
	$('#password').blur(function() {
		$('label[for="password"]').removeClass('selected');
	});
</script>

</html>