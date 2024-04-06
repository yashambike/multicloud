<%-- 
    Document   : index
    Created on : Feb 5, 2016, 11:17:23 AM
    Author     : SAII
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html0>
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
<style>
      html, body, #map-canvas {
        height: 100%;
        margin: 0px;
        padding: 0px
      }
      #panel {
        position: absolute;
        top: 5px;
        left: 50%;
        margin-left: -180px;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
      }
    body {
	margin-left: 5px;
	margin-top: 5px;
	margin-right: 5px;
	margin-bottom: 5px;
}
    #map-canvas {
	height: 200px;
	width: 200px;
}
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
    <script>
var geocoder;
var map;
function initialize() {
  geocoder = new google.maps.Geocoder();
  var latlng = new google.maps.LatLng(-34.397, 150.644);
  var mapOptions = {
    zoom: 8,
    center: latlng
  }
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
}

function codeAddress() {
  var address = document.getElementById('address').value;
  
  geocoder.geocode( { 'address': address}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      map.setCenter(results[0].geometry.location);
      document.getElementById("lat").value=results[0].geometry.location.lat();
       document.getElementById("lon").value=results[0].geometry.location.lng();
      var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
         
      });
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}

google.maps.event.addDomListener(window, 'load', initialize);

    </script>
</head>
<body>
<!---->
<div class="header">
	 <div class="container">
		 <div class="header-top">
			 <div class="logo">
				 <a href="index.jsp">
				 <h1>Cloud System</h1>
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
			 <li><a href="owner_home.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>

                        <li><a href="owner_uploadinfo.jsp"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>Upload Files</a></li>
                        <li><a href="ownerviewfile.jsp"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>View Files</a></li>

                        <li><a href="ownerdelete.jsp"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>Delete Files</a></li>

                        <li class="active"><a href="ownerdownload.jsp"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>Download Files</a></li>

           


                        <li><a href="owner_pdown.jsp"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>Grant Download Permision</a></li>

                        <li><a href="Logout"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>Logout</a></li>
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
                      <h3> <%=session.getAttribute("owner")%></h3>
        
			<%
            String name = (String) session.getAttribute("owner");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/multicloud","root", "root");
            Statement st = con.createStatement();
        String s="select * from file where owner='"+name+"'";
            ResultSet rs =st.executeQuery(s);
            %>
                        <table border="0" width="90%" cellpadding="5">
                            <thead>
                                <tr>
                                           <TH>File Id</TH>
                                           <TH>File Name</TH>
                                         
                                          
                                </tr>
                            </thead>
                            <% while (rs.next()) {  %>
                            <tbody>
                                <tr align="">
                                   <TD> <%= rs.getString("fileid") %> </TD>
                                   <TD> <%= rs.getString("filename") %> </TD>
                               
                                   
                                </tr>
                            </tbody>
                             <%}%>
                        </table>
                        <form action="ownerdownload" method="get" name="login" onsubmit="return valid();">
                            Enter The File id To Download<br>
                            <input type="text" name="dwnid" id="id"><br>
                        
                               
                        <input style="color: #FF008C" type="submit" value="Download">              
                        </form>
                         
                  
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