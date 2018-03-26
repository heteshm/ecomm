<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="util.OrderDAO"%>
<%@ page import="java.sql.* "%>
<%@ page import="conn.dbcon" %>
<%@ page import = "bean.product" %>

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
<li><a href="#">Home</a></li>
<li class="active">Shopping Cart</li>
</ol>
</div>
<div class="table-responsive cart_info">
<table class="table table-condensed">
<thead>
<tr class="cart_menu">
<td class="image">Item</td>
<td class="description"></td>
<td class="price">Price</td>
<td class="quantity">Quantity</td>
<td class="total">Total</td>
<td></td>
</tr>
</thead>


<%
if (session.getAttribute("name") == null || (session.getAttribute("name") == ""))
{
	
	response.sendRedirect("login.jsp");
	
}
else
{
int a = 0 ;
int amount = 0;
String id=request.getParameter("id");
String name = (String)session.getValue("name");
System.out.println(name);

// CallableStatement cs=con.prepareCall("{call PROCEDURE1(?,?)}");
// cs.setString(1, name);
// cs.setInt(2, Integer.parseInt(id));
// int i=cs.executeUpdate();

			ArrayList<product> ap = OrderDAO.orderdao(name);
			for(product p:ap)
			{
			
			
			
			//System.out.println(nu);
			//System.out.println(name1);
			//System.out.println(Price);
			//System.out.println(image);	

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

<td class="cart_quantity">
<p><%=p.getQty()%></p> 
</td>

<%
	int total = p.getPrice() * p.getQty();
	amount += total; 
%>
<!-- <a class="cart_quantity_up" href=""> + </a> -->
<!-- <input class="cart_quantity_input" type="text" name="quantity" value="1" autocomplete="off" size="2"> -->
<!-- <a class="cart_quantity_down" href=""> - </a> -->
</div>
</td>
<td class="cart_total">
<p><%=total%></p>
<p class="cart_total_price"></p>
</td>
<!-- <td class="cart_delete"> -->
<%-- <a class="cart_quantity_delete" href="delete.jsp?id=<%=p.getID()%>"><i class="fa fa-times"></i></a> --%>
<!-- </td> -->
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
<h3>The total amount is <%=amount %></h3>
</div><% }
%>
<div>
<form action ="Order" method ="post" >
<div class="sign-u">
<div class="sign-up1">
<h4>Name* :</h4>
</div>
<div class="sign-up2">
<input type="text" name="fname" placeholder="Name" required=" "/ size="10">
</div>
<div class="clearfix"> </div>
</div>
<h4>LOCALITY* :</h4>
</div>
<div class="sign-up2">
<input type="text" name="local" placeholder="your locality" required=" "/ size="30">
</div>
<div class="clearfix"> 
</div>
<h4>ADDRESS* :</h4>

<div class="sign-up2">
<textarea name ="add" placeholder= "Street"></textarea>
</div>
<div class="clearfix"> </div>
</div>
<div>
<h4>CITY* :</h4>
</div>
<div class="sign-up2">
<input type="text" name="city" placeholder="city" required=" "/>
</div>
<div class="clearfix"> </div>
</div>
<h4>STATE* :</h4>
</div>
<div class="sign-up2">
<input type="text" name="state" placeholder="state" required=" "/>
</div>
<div class="clearfix"> </div>
</div>
<input type="submit" value="COD ORDER"/>
</form>
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