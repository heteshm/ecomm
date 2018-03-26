<!DOCTYPE html>
<%@page import="bean.product"%>
<%@page import="util.Horder"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.* "%>
<%@ page import="conn.dbcon" %>

<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>MY ORDER</title>
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
<li class="active">My Order</li>
</ol>
</div>
<div class="table-responsive cart_info">
<table class="table table-condensed">
<thead>
<tr class="cart_menu">
<td class="image">Item</td>
<td class="description">Day</td>
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
String name = (String)session.getValue("name");
System.out.println(name);

// CallableStatement cs=con.prepareCall("{call PROCEDURE1(?,?)}");
// cs.setString(1, name);
// cs.setInt(2, Integer.parseInt(id));
// int i=cs.executeUpdate();

ArrayList<product> ap = Horder.horder(name);
for(product p:ap)
{
			
%>
<tr>

<td class="cart_product">
<a href=""><img src="<%=p.getP_FNAME()%> "height="42" width="42" alt=""></a>
</td>

<td class="cart_description">
<p></p>
</td>
<td>
<p>Product name:<%=p.getName()%> </p>
</td>

<td class="cart_price">
<p><%=p.getPrice()%></p> 
</td>
<td class="cart_price">
<p></p> 
</td>


</div>
</td>
<td class="cart_total">
<p class="cart_total_price"></p>
</td>

</tr>
<% 
}}
%>
</tbody>
</table>
</div>
</div>
</section> <!--/#cart_items-->

<section id="do_action">
<div class="container">
</div>
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