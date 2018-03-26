<%@page import="util.Summery"%>
<%@page import="bean.product"%>
<%@page import="util.Summer_B"%>
<%@page import="bean.order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="util.Summery_A"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="conn.dbcon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Thank for Ordering</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />

    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="M_Header.jsp"></jsp:include>

<div class="container">

<div class="page-header">
    <h1>Product invoice <small>Your order was successfully placed </small></h1>
</div>

<!-- Simple Invoice - START -->
<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <div class="text-center">
                <i class="fa fa-search-plus pull-left icon"></i>
                <h2>Invoice for purchase #33221</h2>
            </div>
            <hr>
            <% 
            int id = Integer.parseInt(request.getParameter("id")); 
            String name = (String)session.getValue("name");    		
            System.out.println(id);
            int a = 0;
            int i = 0;
            int qtytotel = 0;    		
           	ArrayList<order> ap = Summery_A.summeryA(name, id);
           	order Or=null;
           	for(order O:ap)
           	{
           		Or = O;
    		%>
            <div class="row">
            
                <div class="col-xs-12 col-md-3 col-lg-3 pull-left">
                    <div class="panel panel-default height">
                        <div class="panel-heading">Billing Details</div>
                        <div class="panel-body">
                            <strong><%=O.getNAME()%></strong><br>
                            <strong>Address</strong><%=O.getLOCALITY()%><br>
                            <%=O.getADD()%><br>
                            <%=O.getCITY()%><br>
                            <%=O.getSTATE() %><br>
                                                        
                        </div>
                    </div>
                </div>
              
                <div class="col-xs-12 col-md-3 col-lg-3">
                    <div class="panel panel-default height">
                        <div class="panel-heading">Payment Information</div>
                        <div class="panel-body">
                            <strong>the product is placed in COD method </strong>                        </div>
                    </div>
                </div>
                  <%} %>
                <div class="col-xs-12 col-md-3 col-lg-3">
                    <div class="panel panel-default height">
                        <div class="panel-heading">Order Preferences</div>
                        <div class="panel-body">
                            <strong>Gift:</strong> No<br>
                            <strong>Express Delivery:</strong> Yes<br>
                            <strong>Insurance:</strong> No<br>
                            <strong>Coupon:</strong> No<br>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="text-center"><strong>Order summary</strong></h3>
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-condensed">
                            <thead>
                                <tr>
                                    <td><strong>Item Name</strong></td>
                                    <td class="text-center"><strong>Item Price</strong></td>
                                    <td class="text-center"><strong>Item Quantity</strong></td>
                                    <td class="text-right"><strong>Total</strong></td>
                                </tr>
                            </thead>
                            <tbody>
                            
                            <%
                            int amount = 0;
                            int Ship = 20;
                            int Full = 0;
                            
                      				
                      				
                      				ArrayList<product> ap1 = Summer_B.summeryb(Or.getU_ID());
                      				for(product p:ap1)
                      				{
                      					qtytotel = p.getPrice() * p.getQty();
                          				amount = qtytotel + amount;
                            	
                            %>
                                <tr>
                                    <td><%=p.getName() %></td>
                                    <td class="text-center">$<%=p.getPrice() %></td>
                                    <td class="text-center"><%=p.getQty() %></td>
                                    <td class="text-right"><%=qtytotel%></td>
                                </tr>
                <% }%>
                                <tr>
                                    <td class="highrow"></td>
                                    <td class="highrow"></td>
                                    <td class="highrow text-center"><strong>Subtotal</strong></td>
                                    <td class="highrow text-right">$<%= amount %></td>
                                </tr>
                                <tr>
                                    <td class="emptyrow"></td>
                                    <td class="emptyrow"></td>
                                    <td class="emptyrow text-center"><strong>Shipping</strong></td>
                                    <td class="emptyrow text-right">$20</td>
                                </tr>
                                <% Full=amount + Ship; %>
                                <tr>
                                    <td class="emptyrow"><i class="fa fa-barcode iconbig"></i></td>
                                    <td class="emptyrow"></td>
                                    <td class="emptyrow text-center"><strong>Total</strong></td>
                                    <td class="emptyrow text-right"><%=Full %></td>
                                </tr>
                                <%
                                int ip = Summery.summery(Or.getU_ID());
                                if(ip>0)
                                {
                                	System.out.println("success");
                                }
                                else
                                {
                                	System.out.println("unsuccessfull");
                                }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
.height {
    min-height: 200px;
}

.icon {
    font-size: 47px;
    color: #5CB85C;
}

.iconbig {
    font-size: 77px;
    color: #5CB85C;
}

.table > tbody > tr > .emptyrow {
    border-top: none;
}

.table > thead > tr > .emptyrow {
    border-bottom: none;
}

.table > tbody > tr > .highrow {
    border-top: 3px solid;
}
</style>

<!-- Simple Invoice - END -->

</div>

</body>
</html>