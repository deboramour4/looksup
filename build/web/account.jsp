<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.Address"%>
<%@page import="model.Usuario"%>
<jsp:useBean id="acControl" class="controller.accountController" scope="session"/>
    
<!--A Design by W3layouts 
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->

<%
    if(session.getAttribute("id") == null) {
        response.sendRedirect("index.jsp");
    } else {
%>
                
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
		<h1>Minha Conta</h1>
		<em></em>
		<h2><a href="index.html">Home</a><label>/</label>Minha Conta</h2>
	</div>
</div>
<div class="single">
    <div class="container">
        <div class="col-md-9">
        <!-- client area -->
            <div class="tab-head">
                <h3>Olá, <%= session.getAttribute("nome") %>!</h3>
                <%
                    
                    Usuario user = new Usuario();
                    Address ad = new Address();

                    user = acControl.getUserData((Integer)session.getAttribute("id"));
                    ad = acControl.getAddressData((Integer)session.getAttribute("id"));                   
                %>
                <br>
                <nav class="nav-sidebar">
                    <ul class="nav tabs">
                        <li class="active"><a href="#tab1" data-toggle="tab">Meu perfil</a></li>
                        <li class=""><a href="#tab2" data-toggle="tab">Meus pedidos</a></li> 
                        <li class=""><a href="logout">Sair</a></li>  
                    </ul>
                </nav>
                <div class="tab-content one">
                    <div class="tab-pane active text-style" id="tab1">
                        <div class="facts">
                            <h3>Meus dados pessoais</h3>
                            
                            <form method="POST" action="account">
                                <p>
                                <div class="login-do">
                                    <div class="login-mail">
                                        <input type="text" placeholder="Nome" name="name" value="<%= user.getName() %>" required>
                                    </div>
                                    <div class="login-mail">
                                        <% if(user.getBirth()==null){ %>
                                        <input type="text" placeholder="Insira uma data de nascimento" name="birth">
                                        <% } else { %>
                                        <input type="text" placeholder="Data de Nascimento" name="birth" value="<%= user.getBirth() %>">
                                        <% } %>
                                    </div>
                                    <div class="login-mail">
                                        <% if(user.getPhone() == 0){ %>
                                        <input type="text" placeholder="Insira um telefone" name="phone">
                                        <% } else { %>
                                        <input type="text" placeholder="Telefone" name="phone" value="<%= user.getPhone() %>">
                                        <% } %>
                                    </div>
                                </div>                                                        
                        </div>
                        
                        <div class="facts">
                            <%
                                if (ad.getWay() != null){
                            %>
                            <h3>Meu endereço</h3>
                                <p>
                                <div class="login-do">
                                    <div class="login-mail">
                                        <input type="text" placeholder="Rua" name="way" value="<%= ad.getWay() %>" required>
                                    </div>
                                    <div class="login-mail">
                                        <input type="text" placeholder="Número" name="number" value="<%= ad.getNumber() %>" required>
                                    </div>
                                    <div class="login-mail">
                                        <input type="text" placeholder="Cidade" name="city" value="<%= ad.getCity() %>" required>
                                    </div>
                                    <div class="login-mail">
                                        <input type="text" placeholder="Estado" name="state" value="<%= ad.getState() %>" required>
                                    </div>
                                    <div class="login-mail">
                                        <input type="text" placeholder="País" name="country" value="<%= ad.getCountry() %>"  required>
                                    </div>
                                </div>
                            <% } else { %>
                            <h3>Meu endereço</h3>
                                <p>
                                <h5 id="ad-not">Você ainda não possui endereço</h5><br>
                                <div class="login-do">
                                    <div class="login-mail">
                                        <input type="text" placeholder="Insira uma rua" name="way" required>                                       
                                    </div>
                                    <div class="login-mail">
                                        <input type="text" placeholder="Insira um número" name="number" required>
                                    </div>
                                    <div class="login-mail">
                                        <input type="text" placeholder="Insira uma cidade" name="city" required>
                                    </div>
                                    <div class="login-mail">
                                        <input type="text" placeholder="Insira um estado" name="state" required>
                                    </div>
                                    <div class="login-mail">
                                        <input type="text" placeholder="Insira um país" name="country" required>
                                    </div>
                                </div>
                            <% } %>                             
                        </div>
                        
                        <div class="facts">
                            <h3>Meu login</h3>
                                <p>
                                <div class="login-do">
                                    <div class="login-mail">
                                        <input type="text" placeholder="Email" name="email" value="<%= user.getEmail() %>" required>
                                    </div>
                                    <div class="login-mail">
                                        <input id="pass" type="password" placeholder="Senha" name="password" value="<%= user.getPassword() %>" required>
                                        <i id="see-pass" class="glyphicon glyphicon-eye-open"></i>
                                    </div>
                                    <a class="news-letter " href="#">
                                        <label class="checkbox1"><input type="checkbox" name="checkbox" ><i> </i>Desejo receber e-mails de ofertas promocionais da <b>LooksUp Store</b></label>
                                    </a>
                                    <label class="hvr-skew-backward">
                                        <input type="submit" value="Salvar">
                                    </label>
                                </div>                               
                            </form>      
                        </div>
                    </div>
                    
                    <div class="tab-pane text-style" id="tab2">
                        <div class="facts">									
                            <p> Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections </p>
                            <ul>
                                <li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Multimedia Systems</li>
                                <li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Digital media adapters</li>
                                <li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Set top boxes for HDTV and IPTV Player  </li>
                            </ul>
                        </div>	
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>                      
        <!-- client area -->
        </div>
    <!----->
        <div class="clearfix"> </div>
    </div>

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
    
  $('#see-pass').hover(function functionName() {
        //Change the attribute to text
        $('#pass').attr('type', 'text');
        $('#see-pass').removeClass('glyphicon-eye-open').addClass('glyphicon-eye-close');
        }, function () {
        //Change the attribute back to password
        $('#pass').attr('type', 'password');
        $('#see-pass').removeClass('glyphicon-eye-close').addClass('glyphicon-eye-open');
        }
    );
});
</script>

	<script src="js/simpleCart.min.js"> </script>
<!-- slide -->
<script src="js/bootstrap.min.js"></script>

</body>
</html>
<% } %>