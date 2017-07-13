 <%@page import="model.ProdutoDAO"%>
<%@page import="model.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!-- A Design by W3layouts 
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->

<!DOCTYPE html>
<html>
<head>
<title>Looks Up : Store</title>
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
<!--header-->

<!--banner-->
<div class="banner">
<div class="container">
<section class="rw-wrapper">
				<h1 class="rw-sentence">
					<span>Moda &amp; Beleza</span>
					<div class="rw-words rw-words-1">
						<span>Reflita sua beleza interior</span>
						<span>Estar na moda � uma escolha</span>
						<span>O importante � se sentir bem consigo mesma</span>
                                                <span>Reflita sua beleza interior</span>
						<span>Estar na moda � uma escolha</span>
						<span>O importante � se sentir bem consigo mesma</span>
					</div>
					<div class="rw-words rw-words-2">
						<span></span>
						<span>Encontre as tend�ncias aqui</span>
						<span>Beleza naquele que veste</span>
						<span>Economize nas suas compras</span>
                                                <span>Encontre as tend�ncias aqui</span>
						<span>Beleza naquele que veste</span>
						<span>Economize nas suas compras</span>
					</div>
				</h1>
			</section>
			</div>
</div>
	<!--content-->
		<div class="content">
			<div class="container">
				<div class="content-top">
					<div class="col-md-6 col-md">
						<div class="col-1">
						 <a href="single.jsp" class="b-link-stroke b-animate-go  thickbox">
		   <img src="images/pi.jpg" class="img-responsive" alt=""/><div class="b-wrapper1 long-img"><p class="b-animate b-from-right    b-delay03 ">Cole��o</p><label class="b-animate b-from-right    b-delay03 "></label><h3 class="b-animate b-from-left    b-delay03 ">de inverno</h3></div></a>

							<!---<a href="single.jsp"><img src="images/pi.jpg" class="img-responsive" alt=""></a>-->
						</div>
						<div class="col-2">
							<span>�LTIMAS TEND�NCIAS</span>
							<h2><a href="single.jsp">Casual &amp; Elegante</a></h2>
							<p>O metalizado j� tinha ganhado nosso cora��o nos sapatos, quando come�aram a surgir as sapatilhas e mocassins dourados e prateados. Agora essa historia vai tamb�m pras pe�as de roupa, ent�o vale usar tshirts, jaquetas bomber, saias midi e tudo o que voc� quiser nesse acabamento brilhante do metal. Para n�o ter erro, basta combinar com pe�as mais neutras.</p>
							<a href="product.jsp" class="buy-now">Ver produtos</a>
						</div>
					</div>
					<div class="col-md-6 col-md1">
						<div class="col-3">
							<a href="single.jsp"><img src="images/pi1.jpg" class="img-responsive" alt="">
							<div class="col-pic">
								<p>Cole��es</p>
								<label></label>
								<h5>Masculinas</h5>
							</div></a>
						</div>
						<div class="col-3">
							<a href="single.jsp"><img src="images/pi2.jpg" class="img-responsive" alt="">
							<div class="col-pic">
								<p>Cole��es</p>
								<label></label>
								<h5>Infantis</h5>
							</div></a>
						</div>
						<div class="col-3">
							<a href="single.jsp"><img src="images/pi3.jpg" class="img-responsive" alt="">
							<div class="col-pic">
								<p>Cole��es</p>
								<label></label>
								<h5>Femininas</h5>
							</div></a>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
				<!--products-->
			<div class="content-mid">
				<h3>Mais vistos</h3>
				<label class="line"></label>
				<%
                                    List<Produto> allProducts = new ArrayList<Produto>();
                                    ProdutoDAO pDAO = new ProdutoDAO();
                                    allProducts = pDAO.getAll();
                                            
                                    Produto p;
                                    
                                    for(int i = 0; i < allProducts.size() ; i++){
                                        p = allProducts.get(i);

                                        if (i%4==0){                                            
                                %>
                                <div class="mid-popular">
                                <% } %>
					<div class="col-md-3 item-grid simpleCart_shelfItem">
                                            <div class=" mid-pop">
                                                <div class="pro-img">
                                                    <img src= <%= p.getImage() %> class="img-responsive" alt="">
                                                    <div class="zoom-icon ">
                                                    <a class="picture" href=<%= p.getImage() %> rel="title" class="b-link-stripe b-animate-go  thickbox"><i class="glyphicon glyphicon-search icon "></i></a>
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
                                   if (i%4==3){
                                   %>
                                   <div class="clearfix"></div>
                                </div>    
                                <%      } 
                                    } 
                                %>
			</div>
			<!--//products-->
			<!--brand-->
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
			<!--//brand-->
			</div>
			
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