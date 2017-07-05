<%@page import="java.util.List"%>
<%@page import="model.Produto"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="cartControl" class="controller.cartController" scope="session"/>

<!--A Design by W3layouts 
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<title>Shopin A Ecommerce Category Flat Bootstrap Responsive Website Template | Checkout :: w3layouts</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Shopin Responsive web template, Bootstrap Web Templates, Flat Web Templates, AndroId Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--theme-style-->
<link href="css/style4.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<script src="js/jquery.min.js"></script>
<!--- start-rate---->
<script src="js/jstarbox.js"></script>
	<link rel="stylesheet" href="css/jstarbox.css" type="text/css" media="screen" charset="utf-8" />
		<script type="text/javascript">
			jQuery(function() {
			jQuery('.starbox').each(function() {
				var starbox = jQuery(this);
					starbox.starbox({
					average: starbox.attr('data-start-value'),
					changeable: starbox.hasClass('unchangeable') ? false : starbox.hasClass('clickonce') ? 'once' : true,
					ghosting: starbox.hasClass('ghosting'),
					autoUpdateAverage: starbox.hasClass('autoupdate'),
					buttons: starbox.hasClass('smooth') ? false : starbox.attr('data-button-count') || 5,
					stars: starbox.attr('data-star-count') || 5
					}).bind('starbox-value-changed', function(event, value) {
					if(starbox.hasClass('random')) {
					var val = Math.random();
					starbox.next().text(' '+val);
					return val;
					} 
				})
			});
		});
		</script>
<!---//End-rate---->
</head>
<body>
<!--header-->
<%@ include file= "views/header.jsp" %>

<!--banner-->
<div class="banner-top">
	<div class="container">
		<h1>Carrinho</h1>
		<em></em>
		<h2><a href="index.html">Home</a><label>/</label>Carrinho</h2>
	</div>
</div>
<!--login-->

<div class="check-out">
<div class="container">
            <%
                List<Produto> cookiesProd = new ArrayList<Produto>();
                        
                cookiesProd = (ArrayList)session.getAttribute("cookiesProd");//produtos
                int qntProd[] = (int[])session.getAttribute("qntProd"); //quantidades
                
                if (cookiesProd == null){
            %>	
            <h3>Não há nada no carrinho.</h3>
            <%
                } else {                
            %>
<div class="bs-example4" data-example-id="simple-responsive-table">
    <div class="table-responsive">
        <table class="table-heading simpleCart_shelfItem">
              <tr>
                <th class="table-grid">Item</th>		
                <th>Preço</th>
                <th >Quant.</th>
                <th>Subtotal</th>
              </tr>
              
              <%
                  int cont=0;
                  float total=0;
                  for(Produto p : cookiesProd){
              %>
              <!-- product -->
              <tr class="cart-header">
                <td class="ring-in"><a href="single.html" class="at-in"><img src=<%= p.getImage() %> class="img-responsive" alt=""></a>
                <div class="sed">
                        <h5><a href="single.html"><%= p.getName() %></a></h5>
                        <p><%= p.getDescription() %></p>

                </div>
                <div class="clearfix"> </div>
                </td>
                <td>R$  <%= p.getPrice() %></td>
                <td>
                    <div class="quantity"> 
                        <div class="quantity-select">                           
                            <div class="entry value-minus">&nbsp;</div>
                            <div class="entry value"><span> <%= qntProd[cont]%> </span></div>
                            <div class="entry value-plus active">&nbsp;</div>
                        </div>
                    </div>                                          
                </td>
                <td class="item_price">R$<%= p.getPrice()*qntProd[cont] %></td>
                <td class="add-check"><a href="deleteItem?id=<%= p.getId() %>"><div class="close-item" id="close1"></div></a></td>
              </tr>
              <!-- product -->
            <%
                cont ++;
                total = total + (p.getPrice()*qntProd[cont]);
            }
            %>
            <tr>
                <td></td><td></td><td>Total</td><td class="item_price"><%= total %></td>
            </tr>
        </table>
    </div>
</div>
	<div class="produced">
            <a href="single.html" class="hvr-skew-backward">Comprar</a>
	</div>
        <%
            }
        %>
</div>
</div>

<!--//login-->
<!--brand-->
		<div class="container">
			<div class="brand">
				<div class="col-md-3 brand-grid">
					<img src="images/ic.png" class="img-responsive" alt="">
				</div>
				<div class="col-md-3 brand-grid">
					<img src="images/ic1.png" class="img-responsive" alt="">
				</div>
				<div class="col-md-3 brand-grid">
					<img src="images/ic2.png" class="img-responsive" alt="">
				</div>
				<div class="col-md-3 brand-grid">
					<img src="images/ic3.png" class="img-responsive" alt="">
				</div>
				<div class="clearfix"></div>
			</div>
			</div>
			<!--//brand-->
	<!--//content-->

<!--//footer-->
<%@ include file= "views/footer.jsp" %>
<!--//footer-->

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

	<script src="js/simpleCart.min.js"> </script>
<!-- slide -->
<script src="js/bootstrap.min.js"></script>
 
</body>
</html>