<%-- 
    Document   : index
    Created on : Feb 5, 2016, 11:17:23 AM
    Author     : SAII
--%>

<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.BufferedReader"%>
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
                        <li class="active"><a href="userhome.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                        <li><a href="userviewfile.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>View File  </a></li>
                        <li><a href="userreqdownload.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>Request Download Permision </a></li>
                        <li><a href="changeUserPass.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>Change Password</a></li>
                        <li><a href="updateUser.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>Update Profile</a></li>
                        <li><a href="userDownloadfile.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>Download File</a></li>
                        <li><a href="userreqview.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>Request View Permision </a></li>
                        <li><a href="Logout"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>Logout</a></li>
                    </ul>
                </div>
                <!-- script-for-menu -->
                <script>
                    $("span.menu").click(function () {
                        $(".top-menu ul").slideToggle("slow", function () {
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

                    <table width="99%" border="0" align="right" cellpadding="5">
                        <thead>
                            <tr>
                                <th colspan="2"><%out.println(application.getAttribute("filecontent"));%></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td height="316">
                                    <form  method="post" action="user_home.jsp">

                                        <%
                                            String path = (String) application.getAttribute("encode");

                                            String jspPath = session.getServletContext().getRealPath("/res");
                                            String txtFilePath = jspPath + "/aFile.txt";
                                            BufferedReader reader = new BufferedReader(new FileReader(path));
                                            StringBuilder sb = new StringBuilder();
                                            String line;

                                            while ((line = reader.readLine()) != null) {
                                                sb.append(line + "\n");
                                            }
                                            out.println(sb.toString());
                                        %>
                                        </label>
                                    </form>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="100"><p>&nbsp;</p>
                                    <p>&nbsp;</p></td>
                                <td><p>
                                    <form action="user_del" method="post">
                                    <input  style="color:#FF008C" type="submit" value="Finish" />
                                    </form>
                                    </p>
                                    <p>&nbsp;</p></td>
                            </tr>
                        </tbody>
                    </table>
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