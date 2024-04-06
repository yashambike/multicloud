<%-- 
    Document   : index
    Created on : Feb 5, 2016, 11:17:23 AM
    Author     : SAII
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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
                    <%
                        String name = (String) session.getAttribute("uname");
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/multicloud", "root", "root");
                        Statement st = con.createStatement();

                        ResultSet rs
                                = st.executeQuery("select * from user where email='" + name + "'");

                        while (rs.next()) {
                    %>
                    <form method="post" action="UpdateUser">
                        <center>
                            <table border="0" width="90%" cellpadding="5">
                                <thead>
                                    <tr>
                                        <th colspan="2">Update Profile here</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td width="23%">Name</td>
                                        <td width="77%"><input type="text" name="name" value="<%=rs.getString("name")%>"/></td></tr>
                                    <tr>
                                        <td>Mobile Number</td>
                                        <td><input type="text" name="pass" value="<%=rs.getString("password")%>"/></td>
                                    </tr>

                                    <tr>
                                        <td>Email id</td>
                                        <td><input type="text" name="email" value="<%=rs.getString("email")%>"/></td>
                                    </tr>
                                    <tr>
                                        <td><input style="color: #FF008C" type="submit" value="Update" /></td>
                                    </tr>
                                    <!--  <tr>
                                          <td colspan="2"><p><a href="index.jsp">Login Here</a></p>
                                          </td>
                                      </tr>  -->
                                </tbody>
                            </table>
                        </center>
                    </form>
                    <%}%>
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