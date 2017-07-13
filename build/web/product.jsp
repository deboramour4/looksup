<%@page import="model.ProdutoDAO"%>
<%@page import="model.Produto"%>
<%@page import="model.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!--A Design by W3layouts 
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<title>Produtos | Looks Up : Store</title>
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
		<h1>Produtos</h1>
		<em></em>
		<h2><a href="index.jsp">Home</a><label>/</label>Produtos</h2>
	</div>
</div>
	<!--content-->
		<div class="product">
			<div class="container">
			<div class="col-md-9">
				<div class="mid-popular">
                                    
                                    <!-- produto ind. --> 
                                    <%
                                    List<Produto> allProducts = new ArrayList<Produto>();
                                    ProdutoDAO pDAO = new ProdutoDAO();
                                    allProducts = pDAO.getAll();
                                            
                                    Produto p;
                                    
                                    for(int i = 0; i < allProducts.size() ; i++){
                                        p = allProducts.get(i);                                            
                                    %>
					<div class="col-md-4 item-grid1 simpleCart_shelfItem">
                                            <div class=" mid-pop">
                                            <div class="pro-img">
                                                <img src="<%= p.getImage() %>" class="img-responsive" alt="">
                                                <div class="zoom-icon ">
                                                <a class="picture" href="<%= p.getImage() %>" rel="title" class="b-link-stripe b-animate-go  thickbox" > <i class="glyphicon glyphicon-search icon "></i></a>
                                                <a href="single.jsp?id=<%= p.getId() %>"><i class="glyphicon glyphicon-menu-right icon"></i></a>
                                                </div>
                                            </div>
                                            <div class="mid-1">
                                                <div class="women">
                                                    <div class="women-top">
                                                        <span><%= p.getCategory() %></span> /
                                                        <span class="subcategory"><%= p.getSubcategory() %></span>
                                                        <h6><a href="single.jsp?id=<%= p.getId() %>"><%= p.getName() %></a></h6>
                                                    </div>
                                                    <div class="img item_add">
                                                        <a href="addCart?id=<%= p.getId() %>&qnt=1"><img src="images/ca.png" alt=""></a>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                                <div class="mid-2">
                                                    <p ><label>R$ <%= p.getPrice()+39 %></label><em class="item_price">R$ <%= p.getPrice() %></em></p>
                                                    <div class="block">
                                                        <div class="starbox small ghosting"> </div>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>

                                            </div>
                                            </div>
					</div>
                                    <%       
                                        }
                                    %>
                                    <!-- produto ind. --> 
					
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="col-md-3 product-bottom">
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
<!--//menu-->
				 				 
				 										
				   				
		</div>
			<div class="clearfix"></div>
			</div>
				<!--products-->
			
			<!--//products-->
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

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

	<script src="js/simpleCart.min.js"> </script>
<!-- slide -->
<script src="js/bootstrap.min.js"></script>
 <!--light-box-files -->
		<script src="js/jquery.chocolat.js"></script>
		<link rel="stylesheet" href="css/chocolat.css" type="text/css" media="screen" charset="utf-8">
		<!--light-box-files -->
		<script type="text/javascript" charset="utf-8">
		$(function() {
			$('a.picture').Chocolat();
		});
		</script>
</body>
</html>