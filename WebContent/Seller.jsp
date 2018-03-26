<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="conn.dbcon"%>
<%@page import="java.util.ArrayList"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>product insertion</title>
<title>Resale a Business Category Flat Bootstrap Responsive Website Template | Home :: w3layouts</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-select.css">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Resale Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<!--fonts-->
<link href='//fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<!--//fonts-->	
<!-- js -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<!-- js -->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap-select.js"></script>
<script>
  $(document).ready(function () {
    var mySelect = $('#first-disabled2');

    $('#special').on('click', function () {
      mySelect.find('option:selected').prop('disabled', true);
      mySelect.selectpicker('refresh');
    });

    $('#special2').on('click', function () {
      mySelect.find('option:disabled').prop('disabled', false);
      mySelect.selectpicker('refresh');
    });

    $('#basic2').selectpicker({
      liveSearch: true,
      maxOptions: 1
    });
  });
</script>
<script type="text/javascript" src="js/jquery.leanModal.min.js"></script>
<link href="css/jquery.uls.css" rel="stylesheet"/>
<link href="css/jquery.uls.grid.css" rel="stylesheet"/>
<link href="css/jquery.uls.lcd.css" rel="stylesheet"/>
<!-- Source -->
<script src="js/jquery.uls.data.js"></script>
<script src="js/jquery.uls.data.utils.js"></script>
<script src="js/jquery.uls.lcd.js"></script>
<script src="js/jquery.uls.languagefilter.js"></script>
<script src="js/jquery.uls.regionfilter.js"></script>
<script src="js/jquery.uls.core.js"></script>
<script>
			$( document ).ready( function() {
				$( '.uls-trigger' ).uls( {
					onSelect : function( language ) {
						var languageName = $.uls.data.getAutonym( language );
						$( '.uls-trigger' ).text( languageName );
					},
					quickList: ['en', 'hi', 'he', 'ml', 'ta', 'fr'] //FIXME
				} );
			} );
		</script>
</head>
<body>
	<jsp:include page="M_Header.jsp"></jsp:include>
	
	<div class="submit-ad main-grid-border">
		<div class="container">
							<h1>Add Products</h1>
					<p><h5>Welcome, please enter the following details to continue.</h5></p>
					
					</p>
					<div class="submit-ad main-grid-border">
		<div class="container">
			<h2 class="head">Insert Product</h2>
			<div class="post-ad-form">
					<form method="POST" action="Product" enctype="multipart/form-data">
						<div class="clearfix">
						<ul>
							<li class="text-info">Product Name:</li>
							<li><input type="text" value="" id="pname" name="pname"
								required="required"></li>
						</ul>
						</div>
						<div class="clearfix">
						<ul>
							<li class="text-info">Product Description :</li>
							<li><textarea rows="5" cols="60" id="pdesc" name="pdesc"
									placeholder="Enter Product Description" required="required"></textarea></li>
						</ul>
						</div>
						<div class="clearfix">
						<ul>
							<li class="text-info">Product Image :</li>
							<li><input type="file" value="" id="file" name="file"
								required="required"></li> 
						</ul>
						</div>
						<ul>
							<li class="text-info">Product Price:</li>
							<li><input type="text" value="" id="pprice" name="pprice"
								required="required"></li>
						</ul>
						<ul>
							<li class="text-info">Product Price:</li>
							<li><input type="text" value="" id="qty" name="qty"
								required="required"></li>
						</ul>
<!-- 						<ul> -->
<!-- 									<li> class="text-info">Product Categorie:</li> -->
<%-- 						<li><%	 -
<%-- 									%> --%>
<%-- 									 <input type="text" id="pcat" name="pcat" value="<%=categories%>"  disabled="disabled">  --%>
<%-- 									<% --%>
<%-- 									}%> --%>
<!-- 									</li> -->
<!-- 					</ul> -->
	
							<ul>
							
								<div class="clearfix"></div>
								<li class="text-info">Product SubCategory:</li>
								<li>
								
									<%
									
									Connection con=dbcon.getConnection();
									String stmnt="select SNAME from SUBCATEGORIES ";
									PreparedStatement ps=con.prepareStatement(stmnt);
								    ps=con.prepareStatement(stmnt);
							        ResultSet rs=ps.executeQuery();
							
							rs=ps.executeQuery();
							if(rs!=null)
							{
								%> <select id="dropscat" name="dropscat" required="required">
										<option value="" selected="selected">Choose here</option>
										<% 
								while(rs.next())
								{
									String str1=rs.getString(1);%>
										<option value="<%=str1%>">
											<%= str1 %>
										</option>
										<%
								}
							}
							%>
								</select>
								</li>
							</ul>


							<input type="submit" value="Add Product"> 
							<p class="click">
								By clicking this button, you are agree to my <a href="#">Policy
									Terms and Conditions.</a>
							</p>
					</form>
				</div>
				</div></div>
			
		</body>
</html>