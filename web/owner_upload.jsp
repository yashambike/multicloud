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
                    <div class="search">
                        <div class="search-box">
                            <div id="sb-search" class="sb-search">
                                <form>
                                    <input class="sb-search-input" placeholder="search term..." type="search" name="search" id="search">
                                    <input class="sb-search-submit" type="submit" value="">
                                    <span class="sb-icon-search"> </span>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                    <!-- search-scripts -->
                    <script src="js/classie.js"></script>
                    <script src="js/uisearch.js"></script>
                    <script>
                        new UISearch(document.getElementById('sb-search'));
                    </script>
                    <!-- //search-scripts -->
                </div>
                <div class="top-menu">
                    <span class="menu">MENU</span>
                    <ul>
                       <li ><a href="owner_home.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>

                        <li class="active"><a href="owner_uploadinfo.jsp"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>Upload Files</a></li>
                        <li><a href="ownerviewfile.jsp"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>View Files</a></li>

                        <li><a href="ownerdelete.jsp"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>Delete Files</a></li>

                        <li><a href="ownerdownload.jsp"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>Download Files</a></li>

                        <li><a href="owner_pread.jsp"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>Grant View Permision</a></li>


                        <li><a href="owner_pdown.jsp"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>Grant Download Permision</a></li>

                        <li><a href="Logout"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>Logout</a></li>

                    </ul>
                </div>
                <!-- script-for-menu -->
                <script>
                    
window.onload=function(){

                    $("span.menu").click(function () {
                        $(".top-menu ul").slideToggle("slow", function () {
                        });
                    });
                  $(".upload").click(function () {
                       var uploadfile = document.getElementById('fname');
 
             if(uploadfile.value == '')
            {
                alert('Please upload the attachment');
                return false;
            }
            return true;
                    });
                }
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
                <%
        String o=request.getParameter("owner");
        String k=request.getParameter("key");
        application.setAttribute("owner",o);
         application.setAttribute("key",k);
    %>
    <center>
 <form action="ownerupload" method="post" enctype="multipart/form-data" >
          <tr>
            <td width="23%"><p>&nbsp; </p>
              <p>&nbsp;</p>
             <h3> <p><b>Select File:</b><br></h3>
                <input type="file" name="fname" id="fname"style="color:#FF008C;" />
                <br/>
                <input  style="color:#FF008C;"type="submit" class="upload" value="Upload"  >
                            </p></td>
            </tr><tr><td>&nbsp;</td>
          </form>
</center>
                       
</div>

                       
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
                <p> © 2016 Multi Cloud System. All rights reserved </p>
            </div>
        </div>
        <!---->
    </body>
</html>