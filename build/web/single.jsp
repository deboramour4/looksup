<%@page import="model.Produto"%>
<%@page import="model.ProdutoDAO"%>
<!--A Design by W3layouts 
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<title>Shopin A Ecommerce Category Flat Bootstrap Responsive Website Template | Single :: w3layouts</title>
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
<link href="css/form.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<!--header-->
<%@ include file= "views/header.jsp" %>

<!--banner-->
<div class="banner-top">
	<div class="container">
		<h1>Produto</h1>
		<em></em>
		<h2><a href="index.html">Home</a><label>/</label>Produto</h2>
	</div>
</div>

    <%
        //if (request.getAttribute("id") != null) {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        ProdutoDAO dao = new ProdutoDAO();
        Produto p = dao.getProductById(id);
        
    %>
    
<div class="single">
    <div class="login">
<div class="container">
<div class="col-md-9">
	<div class="col-md-5 grid">		
		<div class="flexslider">
			  <ul class="slides">
			    <li data-thumb=<%= p.getImage() %>>
			        <div class="thumb-image"> <img src="<%= p.getImage() %>" data-imagezoom="true" class="img-responsive"> </div>
			    </li>
			    <li data-thumb=<%= p.getImage() %>>
			         <div class="thumb-image"> <img src="<%= p.getImage() %>" data-imagezoom="true" class="img-responsive"> </div>
			    </li>
			    <li data-thumb=<%= p.getImage() %>>
			       <div class="thumb-image"> <img src="<%= p.getImage() %>" data-imagezoom="true" class="img-responsive"> </div>
			    </li> 
			  </ul>
		</div>
	</div>	
<div class="col-md-7 single-top-in">
    <div class="span_2_of_a1 simpleCart_shelfItem">
        <h3><%= p.getName() %></h3>
        <p class="in-para"><strike>R$ <%= p.getPrice()+39 %>  </strike> <span class="reducedfrom item_price">R$<%= p.getPrice() %></span></p>
            
            <h4 class="quick">Descrição:</h4>
            <p class="quick_desc"><%= p.getDescription() %></p>
                <!-- <div class="wish-list">
                    <ul>
                        <li class="wish"><a href="#"><span class="glyphicon glyphicon-check" aria-hidden="true"></span>Add to Wishlist</a></li>
                    </ul>
                </div> -->
                
            <!-- quantidade -->    
            <div class="quantity"> 
                <div class="quantity-select">                           
                    <div class="entry value-minus">&nbsp;</div>
                    <div class="entry value"><span>1</span></div>
                    <div class="entry value-plus active">&nbsp;</div>
                </div>
            </div>
            <!-- quantidade -->
            
            <!--quantity-->
	<script>
        $('.value-plus').on('click', function(){
            var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)+1;
            divUpd.text(newVal);
        });

        $('.value-minus').on('click', function(){
            var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)-1;
            if(newVal>=1) divUpd.text(newVal);
        });
        
        
        
        function gotoCart(){
            var numQ = $('.value').text();
            window.location.replace("addCart?id=<%= p.getId() %>&qnt="+numQ);
            //$('#qntJS').attr("href","addCart?id=<%= p.getId() %>&qnt="+numQ);
        }
        
	</script>
	<!--quantity-->
			 
        <a  id="qntJS" onclick="gotoCart()" class="add-to item_add hvr-skew-backward">Adicionar ao carrinho</a>
        <div class="clearfix"> </div>
    </div>
		
</div>
<div class="clearfix"> </div>
			<!---->
                        
			<!---->	
</div>
<!----->

<div class="col-md-3 product-bottom product-at">
			<!--categories-->
				<div class=" rsidebar span_1_of_left">
						<h4 class="cate">Categorias</h4>
							 <ul class="menu-drop">
							<li class="item1"><a href="product.jsp?category=roupas">Roupas</a>
								<ul class="cute">
									<li class="subitem1"><a href="product.jsp?subcategory=blusas">Blusas</a></li>
									<li class="subitem2"><a href="product.jsp?subcategory=saias">Saias</a></li>
                                                                        <li class="subitem3"><a href="product.jsp?subcategory=casacos">Casacos</a></li>
                                                                        <li class="subitem3"><a href="product.jsp?subcategory=jeans">Jeans</a></li>
                                                                </ul>
							</li>
							<li class="item2"><a href="product.jsp?category=acessorios">Acessórios</a>
								<ul class="cute">
									<li class="subitem1"><a href="product.jsp?subcategory=brincos">Brincos</a></li>
									<li class="subitem2"><a href="product.jsp?subcategory=colares">Colares</a></li>
                                                                        <li class="subitem3"><a href="product.jsp?subcategory=pulseiras">Pulseiras</a></li>
                                                                        <li class="subitem3"><a href="product.jsp?subcategory=relogios">Relógios</a></li>
                                                                        <li class="subitem3"><a href="product.jsp?subcategory=aneis">Anéis</a></li>
								</ul>
                                                            
							</li>
							<li class="item3"><a href="product.jsp?category=calcados">Calçados</a>
								<ul class="cute">
									<li class="subitem1"><a href="product.jsp?subcategory=saltos">Saltos</a></li>
									<li class="subitem2"><a href="product.jsp?subcategory=sandalias">Sandálias</a></li>
									<li class="subitem3"><a href="product.jsp?subcategory=tenis">Tênis</a></li>
								</ul>
							</li>
						</ul>
					</div>
				<!--initiate accordion-->

<!--//menu-->
                                <!-- <section  class="sky-form">
					<h4 class="cate">Discounts</h4>
					 <div class="row row1 scroll-pane">
						 <div class="col col-4">
								<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Upto - 10% (20)</label>
						 </div>
						 <div class="col col-4">
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>40% - 50% (5)</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>30% - 20% (7)</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>10% - 5% (2)</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Other(50)</label>
						 </div>
					 </div>
				 </section> 				 				 
				 
					
					 
					 <section  class="sky-form">
						<h4 class="cate">Type</h4>
							<div class="row row1 scroll-pane">
								<div class="col col-4">
									<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Sofa Cum Beds (30)</label>
								</div>
								<div class="col col-4">
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Bags  (30)</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Caps & Hats (30)</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Jackets & Coats   (30)</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Jeans  (30)</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Shirts   (30)</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Sunglasses  (30)</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Swimwear  (30)</label>
								</div>
							</div>
				   </section>
						<h4 class="cate">Brand</h4>
							<div class="row row1 scroll-pane">
								<div class="col col-4">
									<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Roadstar</label>
								</div>
								<div class="col col-4">
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Levis</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Persol</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Nike</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Edwin</label>
									<label class="checkbox"><input type="checkbox" name="checkbox" ><i></i>New Balance</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Paul Smith</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Ray-Ban</label>
								</div>
							</div>
				   </section>	--> 	
		</div>
		<div class="clearfix"> </div>
        </div>
    </div>
                <% /*} else { 
                    response.sendRedirect("404.jsp");
                } */%>
	
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
		</div>	
		
	<!--//content-->

<!--//footer-->
<%@ include file= "views/footer.jsp" %>
<!--//footer-->

<script src="js/imagezoom.js"></script>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script defer src="js/jquery.flexslider.js"></script>
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />

<script>
// Can also be used with $(document).ready()
$(window).load(function() {
  $('.flexslider').flexslider({
    animation: "slide",
    controlNav: "thumbnails"
  });
});
</script>

	<script src="js/simpleCart.min.js"> </script>
<!-- slide -->
<script src="js/bootstrap.min.js"></script>


</body>
</html>