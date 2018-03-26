<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<%@page import="util.Subcategories"%>
<%@page import="bean.SUBCATEGORIES"%>
<%@page import="util.Categories"%>
<%@page import="bean.categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="conn.dbcon"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<title>Resale a Business Category Flat Bootstrap Responsive Website Template | Categories :: w3layouts</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-select.css">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
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
		<link rel="stylesheet" type="text/css" href="css/easy-responsive-tabs.css " />
    <script src="js/easyResponsiveTabs.js"></script>
</head>
<body>
	<div class="banner text-center">
	  <div class="container">    
			<h1>Sell or Advertise   <span class="segment-heading">    anything online </span> with Resale</h1>
			<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>
			<a href="post-ad.html">Post Free Ad</a>
	  </div>
	</div>
	<!-- Categories -->
	<!--Vertical Tab-->
	<div class="categories-section main-grid-border">
		<div class="container">
			<h2 class="head">Main Categories</h2>
			<div class="category-list">
				<div id="parentVerticalTab">
					<ul class="resp-tabs-list hor_1">
					    <%
						ArrayList<categories> ap = Categories.categorie();
						for(categories C:ap)
						{
						%>
					<li><%=C.getCNAME()%></li>
					<%} %>
					</ul>
					<div class="resp-tabs-container hor_1">
						<%
						ArrayList<categories> ap1 = Categories.categorie();
						for(categories C:ap1)
						{
						%>
						<div>
							<div class="category">
								<div class="category-img">
									<img src="images/cat<%=C.getCDID() %>.png" title="image" alt="" />
								</div>
								<div class="category-info">
									<h4><%=C.getCNAME()%></h4>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="sub-categories">
								<ul>
								<%	
									System.out.println(C.getCDID());
									ArrayList <SUBCATEGORIES> Sp = Subcategories.sub(C.getCDID());
									for(SUBCATEGORIES S : Sp)
									{
										System.out.println(S.getSCID());
								%>
								
									<li><a href="plp.jsp?id=<%=S.getSCID()%>"><%=S.getSNAME()%></a></li>
									<%} %>
<!-- 									<li><a href="plp.jsp?id=1">mobile phones</a></li> -->
<!-- 									<li><a href="plp.jsp?id=2">Tablets</a></li> -->
<!-- 									<li><a href="plp.jsp?id=3">Accessories</a></li> -->
									<div class="clearfix"></div>
								</ul>
							</div>
						</div>
						<% }%>										
<!-- 						<div> -->
<!-- 							<div class="category"> -->
<!-- 								<div class="category-img"> -->
<!-- 									<img src="images/cat2.png" title="image" alt="" /> -->
<!-- 								</div> -->
<!-- 								<div class="category-info"> -->
<!-- 									<h4>Electronics & Appliances</h4> -->
									
<!-- 								</div> -->
<!-- 								<div class="clearfix"></div> -->
<!-- 							</div> -->
<!-- 							<div class="sub-categories"> -->
<!-- 								<ul> -->
<!-- 									<li><a href="plp.jsp?id=4">Computers & accessories</a></li> -->
<!-- 									<li><a href="plp.jsp?id=5">Tv - video - audio</a></li> -->
<!-- 									<li><a href="plp.jsp?id=6">Cameras & accessories</a></li> -->
<!-- 									<li><a href="plp.jsp?id=7">Games & Entertainment</a></li> -->
<!-- 									<li><a href="plp.jsp?id=8">Fridge - AC - Washing Machine</a></li> -->
<!-- 									<li><a href="plp.jsp?id=9">Kitchen & Other Appliances</a></li> -->
<!-- 									<div class="clearfix"></div> -->
<!-- 								</ul> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div> -->
<!-- 							<div class="category"> -->
<!-- 								<div class="category-img"> -->
<!-- 									<img src="images/cat3.png" title="image" alt="" /> -->
<!-- 								</div> -->
<!-- 								<div class="category-info"> -->
<!-- 									<h4>Cars</h4> -->
									
<!-- 								</div> -->
<!-- 								<div class="clearfix"></div> -->
<!-- 							</div> -->
<!-- 							<div class="sub-categories"> -->
<!-- 								<ul> -->
<!-- 									<li><a href="plp.jsp?id=10">Commercial Vehicles</a></li> -->
<!-- 									<li><a href="plp.jsp?id=11">Other Vehicles</a></li> -->
<!-- 									<li><a href="plp.jsp?id=12">Spare Parts</a></li> -->
<!-- 									<div class="clearfix"></div> -->
<!-- 								</ul> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div> -->
<!-- 							<div class="category"> -->
<!-- 								<div class="category-img"> -->
<!-- 									<img src="images/cat4.png" title="image"alt="" /> -->
<!-- 								</div> -->
<!-- 								<div class="category-info"> -->
<!-- 									<h4>Bikes</h4> -->
									
<!-- 								</div> -->
								
<!-- 							</div> -->
<!-- 							<div class="sub-categories"> -->
<!-- 								<ul> -->
<!-- 									<li> <a onclick="location.href='cars.html/2"> Motorcycles></a></li> -->
									 
<!-- 									<li><a href="plp.jsp?id=13">Scooters</a></li> -->
<!-- 									<li><a href="plp.jsp?id=14">Bicycles</a></li> -->
<!-- 									<li><a href="plp.jsp?id=15">Spare Parts</a></li> -->
<!-- 									<div class="clearfix"></div> -->
<!-- 								</ul> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div> -->
<!-- 							<div class="category"> -->
<!-- 								<div class="category-img"> -->
<!-- 									<img src="images/cat5.png" title="image" alt="" /> -->
<!-- 								</div> -->
<!-- 								<div class="category-info"> -->
<!-- 									<h4>Furniture</h4> -->
								
<!-- 								</div> -->
<!-- 								<div class="clearfix"></div> -->
<!-- 							</div> -->
<!-- 							<div class="sub-categories"> -->
<!-- 								<ul> -->
<!-- 									<li><a href="plp.jsp?id=16">Sofa & Dining</a></li> -->
<!-- 									<li><a href="plp.jsp?id=17">Beds & Wardrobes</a></li> -->
<!-- 									<li><a href="plp.jsp?id=18">Home Decor & Garden</a></li> -->
<!-- 									<li><a href="plp.jsp?id=19">Other Household Items</a></li> -->
<!-- 									<div class="clearfix"></div> -->
<!-- 								</ul> -->
<!-- 							</div> -->
						</div>
						<div>
							
						
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	<!--Plug-in Initialisation-->
	<script type="text/javascript">
    $(document).ready(function() {

        //Vertical Tab
        $('#parentVerticalTab').easyResponsiveTabs({
            type: 'vertical', //Types: default, vertical, accordion
            width: 'auto', //auto or any width like 600px
            fit: true, // 100% fit in a container
            closed: 'accordion', // Start closed if in accordion view
            tabidentify: 'hor_1', // The tab groups identifier
            activate: function(event) { // Callback function if tab is switched
                var $tab = $(this);
                var $info = $('#nested-tabInfo2');
                var $name = $('span', $info);
                $name.text($tab.text());
                $info.show();
            }
        });
    });
</script>
	<!-- //Categories -->
	<!--footer section start-->		
		<footer>
			<div class="footer-top">
				<div class="container">
					<div class="foo-grids">
						<div class="col-md-3 footer-grid">
							<h4 class="footer-head">Who We Are</h4>
							<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>
							<p>The point of using Lorem Ipsum is that it has a more-or-less normal letters, as opposed to using 'Content here.</p>
						</div>
						<div class="col-md-3 footer-grid">
							<h4 class="footer-head">Help</h4>
							<ul>
							<li><input type="button" class="btn btn-block btn-warning btn-sm"  value="<== DATA INPUT" onclick="location.href='/cars.html/2'" style="position: absolute; width:120px; border:1px solid #000000; "></input></li>
								<li><a href="howitworks.html">How it Works</a></li>						
								<li><a href="sitemap.html">Sitemap</a></li>
								<li><a href="faq.html">Faq</a></li>
								<li><a href="feedback.html">Feedback</a></li>
								<li><a href="contact.html">Contact</a></li>
								<li><a href="typography.html">Shortcodes</a></li>
							</ul>
						</div>
						<div class="col-md-3 footer-grid">
							<h4 class="footer-head">Information</h4>
							<ul>
								<li><a href="regions.html">Locations Map</a></li>	
								<li><a href="terms.html">Terms of Use</a></li>
								<li><a href="popular-search.html">Popular searches</a></li>	
								<li><a href="privacy.html">Privacy Policy</a></li>	
							</ul>
						</div>
						<div class="col-md-3 footer-grid">
							<h4 class="footer-head">Contact Us</h4>
							<span class="hq">Our headquarters</span>
							<address>
								<ul class="location">
									<li><span class="glyphicon glyphicon-map-marker"></span></li>
									<li>CENTER FOR FINANCIAL ASSISTANCE TO DEPOSED NIGERIAN ROYALTY</li>
									<div class="clearfix"></div>
								</ul>	
								<ul class="location">
									<li><span class="glyphicon glyphicon-earphone"></span></li>
									<li>+0 561 111 235</li>
									<div class="clearfix"></div>
								</ul>	
								<ul class="location">
									<li><span class="glyphicon glyphicon-envelope"></span></li>
									<li><a href="mailto:info@example.com">mail@example.com</a></li>
									<div class="clearfix"></div>
								</ul>						
							</address>
						</div>
						<div class="clearfix"></div>
					</div>						
				</div>	
			</div>	
			<div class="footer-bottom text-center">
			<div class="container">
				<div class="footer-logo">
					<a href="index.html"><span>Re</span>sale</a>
				</div>
				<div class="footer-social-icons">
					<ul>
						<li><a class="facebook" href="#"><span>Facebook</span></a></li>
						<li><a class="twitter" href="#"><span>Twitter</span></a></li>
						<li><a class="flickr" href="#"><span>Flickr</span></a></li>
						<li><a class="googleplus" href="#"><span>Google+</span></a></li>
						<li><a class="dribbble" href="#"><span>Dribbble</span></a></li>
					</ul>
				</div>
				<div class="copyrights">
					<p> © 2016 Resale. All Rights Reserved | Design by  <a href="http://w3layouts.com/"> W3layouts</a></p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		</footer>
        <!--footer section end-->
</body>
</html>