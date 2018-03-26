<!DOCTYPE html>
<%@page import="util.CartDAO"%>
<%@page import="bean.product"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.* "%>
<%@ page import="conn.dbcon" %>

<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Cart</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/price-range.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->
<link rel="shortcut icon" href="images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>


<jsp:include page="M_Header.jsp"></jsp:include>
<section id="cart_items">
<div class="container">
<div class="breadcrumbs">
<ol class="breadcrumb">
<li><a href="index.jsp">Home</a></li>
<li class="active">Shopping Cart</li>
</ol>
</div>
<div class="table-responsive cart_info">
<table class="table table-condensed">
<thead>
<tr class="cart_menu">
<td class="image">Item</td>
<td class="description"> Name</td>
<td class="price">Price</td>
	
<td></td>
</tr>
</thead>


<%
if (session.getAttribute("name") == null || (session.getAttribute("name") == ""))
{
	
	response.sendRedirect("login.jsp");
	
}else{
int a = 0 ;
String id=request.getParameter("id");
String name = (String)session.getValue("name");
System.out.println(name);
Connection con=dbcon.getConnection();
// CallableStatement cs=con.prepareCall("{call PROCEDURE1(?,?)}");
// cs.setString(1, name);
// cs.setInt(2, Integer.parseInt(id));
// int i=cs.executeUpdate();

String sql = "select USERID from USERS where UNAME =?";
PreparedStatement st = con.prepareStatement(sql);
int amount = 0;
st.setString(1, name);
ResultSet rs = st.executeQuery();

while(rs.next())
{
  a = rs.getInt(1);		
}

System.out.println(a);

	ArrayList<product> ap= CartDAO.selectCart(a);
	
	for(product p:ap)
	{
	   int price=p.getPrice();
			amount += price;
// 			System.out.println(nu);
// 			System.out.println(name1);
// 			System.out.println(Price);
// 			System.out.println(image);	

%>
<tr>

<td class="cart_product">
<a href=""><img src="<%=p.getP_FNAME()%> "height="42" width="42" alt=""></a>
</td>

<td class="cart_description">

<p>Product name:<%=p.getName()%> </p>
</td>
<td class="cart_price">
<p><%=p.getPrice()%></p> 
</td>
</div>
</td>
<td class="cart_total">

<p class="cart_total_price"></p>
</td>
<td class="cart_delete">
<a class="cart_quantity_delete" href="delete.jsp?id=<%=p.getID()%>"><i class="fa fa-times"></i></a>
</td>
</tr>
<% 
}
%>
</tbody>
</table>
</div>
</div>
</section> <!--/#cart_items-->

<section id="do_action">
<div class="container">
<div class="heading">
<%
	if(amount!=0)
	{
		
	
%>

<h3>What would you like to do next?</h3>
</div>
<div>
<br>
<br>
<h4>Totle amount : <%= amount %></h4>
</div>
<div class="row">
<div class="col-sm-6">
<div class="chose_area">
<a class="btn btn-default update" href="Order.jsp">Order</a>
</div>
</div>
<%}else
{
	%>
	
	<center><h1>nothing inside the cart. 
	
	</h1></center>
	
	<% 
}
}
%>
</div>
</div>
</section><!--/#do_action-->	

<jsp:include page="M_Footer.jsp"></jsp:include>

<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/main.js"></script>
</body>
</html>