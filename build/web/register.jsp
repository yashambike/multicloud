<%-- 
    Document   : index
    Created on : Feb 5, 2016, 11:17:23 AM
    Author     : SAII
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html0>
<a href="register.jsp"></a>
<html>
<head>
<title>Cloud System</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Charity Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
</head>
<body>
<!---->
<div class="header">
	 <div class="container">
		 <div class="header-top">
			 <div class="logo">
				 <a href="index.jsp">
				 <h1> Cloud System</h1>
				 </a>
			 </div>
			 <div class="hdr-address">
				 <div class="address1">
					 <h5>&nbsp;</h5>
			   </div>
				 <div class="call">
					 <h5>&nbsp;</h5>
			   </div>
				 <div class="clearfix"></div>
			 </div>
			 <div class="clearfix"> </div>
			 <!-- search-scripts -->
			<script src="js/classie.js"></script>
			<script src="js/uisearch.js"></script>
				<script>
					new UISearch( document.getElementById( 'sb-search' ) );
				</script>
			<!-- //search-scripts -->
		 </div>
		 <div class="top-menu">
			 <span class="menu">MENU</span>
			 <ul>
			 <li ><a href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
		         <li  class="active"><a href="register.jsp"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>Register</a></li>
			 <li><a href="userlogin.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>User Login</a></li>
                         <li><a href="ownerlogin.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>Admin Login</a></li>	
			  

			  
			 </ul>
	   </div>
		 <!-- script-for-menu -->
		 <script>					
					$("span.menu").click(function(){
						$(".top-menu ul").slideToggle("slow" , function(){
						});
					});
		 </script>
		 <!-- script-for-menu -->	
		 <div class="clearfix"></div>
	 </div>
</div>
<!---->
<div class="banner">
	 <div class="container">			
			<script src="js/responsiveslides.min.js"></script>
			  <script>
					$(function () {
					  $("#slider").responsiveSlides({
						auto: true,
						nav: false,
						speed: 500,
						namespace: "callbacks",
						pager: true,
					  });
					});
			 </script>
			  <!----->		  

	 </div>
</div>
<!---->
<div class="welcome">
	 <div class="container">
		 <div class="welcome-top">
			 <h3><strong>Register Here!. </strong></h3>
                         <form action="RegisterServlet" method="post">
                             <br>
			   <table width="461" height="328" border="0" align="center">
                 <tr>
                   <td width="127"><strong>Enter Your Name</strong></td>
                   <td width="124"><input name="name" type="text"  required></td>
                 </tr>
                 <tr>
                   <td><strong>Enter Email Id</strong></td>
                   <td><input name="email" type="text" value="Email" required=""></td>
                 </tr>
            
                 <tr>
                   <td><strong>Password</strong></td>
                   <td><input name="pass" type="password" value="Password" required></td>
                 </tr>
                
                  
                 <tr>
                   <td><input style="color:#FF008C" name="submit" type="submit" value="Submit" ></td>
                   <td>&nbsp;</td>
                 </tr>
               </table>
			  
		     </form>
			 <h4>&nbsp;</h4>
	   </div>
		  <div class="charitys">
		    <div class="clearfix"></div>
	   </div>		 
	 </div>
</div>
<!---->
<!---->
<!---->
<div class="bottom-grids">
	 <div class="container">
	   <div class="clearfix"></div>
  </div>
</div>
<!---->
<div class="copywrite">
  <div class="container">
		  <p> © 2017 Cloud System. All rights reserved </p>
	 </div>
</div>
<!---->
</body>
</html>