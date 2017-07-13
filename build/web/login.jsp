<!--A Design by W3layouts 
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<title>Login | Looks Up : Store</title>
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
		<h1>Login</h1>
		<em></em>
		<h2><a href="index.jsp">Home</a><label>/</label>Login</h2>
	</div>
</div>
<!--login-->
<div class="container">
    <div class="login">		
        <form method="POST" action="login">
            <div class="col-md-6 login-do">
                
                
                <%
                    if ( request.getParameter("error") != null ) {
                %>
                <div class="alert alert-danger" role="alert">
                    <strong>Usuário ou senha inválidos!</strong> Tente de novo.
                </div>
                <%  } %>
                
                
                <div class="login-mail">
                    <input type="text" placeholder="Email" name="email" required>
                    <i  class="glyphicon glyphicon-envelope"></i>
                </div>
                <div class="login-mail">
                    <input id="pass" type="password" placeholder="Senha" name="password" required>
                    <i id="see-pass" class="glyphicon glyphicon-eye-open"></i>
                </div>               
                <a class="news-letter " href="#">
                    <label class="checkbox1"><input type="checkbox" name="checkbox" ><i> </i>Lembrar senha</label>
                </a>
                <label class="hvr-skew-backward">
                    <input type="submit" value="Entrar">
                </label>
            </div>
            <div class="col-md-6 login-right">
                <h3>Cadastro completamente grátis</h3>

                <p>A Looks Up Store é um empresa que atende o público feminino de uma forma simples e fácil. Aqui você encontra os looks mais atuais para ficar na moda em todas as estações. Confira os nossos preços e descontos!<br> <b> Não possui uma conta? Cadastre-se.</b></p>
                <a href="register.jsp" class=" hvr-skew-backward">Cadastre-se</a>
            </div>
            <div class="clearfix"> </div>
        </form>
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

<script>
    $(document).ready(function(){
        
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
    
    })
</script> 

</body>
</html>