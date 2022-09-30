<%-- 
    Document   : FacJoin
    Created on : Mar 17, 2019, 1:11:24 AM
    Author     : Abhishek Rai
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.java.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.HashMap"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>EduArena</title>
        <link rel="icon" href="../bootstrap/img/EA.ico" type="image/x-icon">
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="../bootstrap/css/custom.css" rel="stylesheet">
        <script src="../bootstrap/js/courses.js"></script>
        <style>
            body {
              background-image: url('../bootstrap/img/bg.jpg');
            }
        </style>
    </head>
    
    <body data-spy="scroll" data-target="#my-navbar">
        <!--navigation bar-->
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="../index.jsp">EduArena</a>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <div class="dropdown pull-right">
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle navbar-brand">Login<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="../Aspirant/AspLogin.jsp">Aspirant</a></li>
                                <li><a href="FacLogin.jsp">Faculty</a></li>
                                <li><a href="../Admin/AdmLogin.jsp">Admin</a></li>
                            </ul>
                        </div>
                    </ul>			
                </div>
            </div>
	</nav>
                
        <!--Features-->
        <hr>
        <div class="container">
            <section>
                <div class="row">
                <!--Left Side-->
                    <div class="col-lg-6 col-lg-offset-3">
                        <div class="panel panel-default">
                            <div class="panel-heading text-center">
                                <h3>REGISTER MENTOR</h3>
                            </div>
                            <div class="panel-body">
                                <form action="../RegisterFac" method='post' enctype="multipart/form-data" class="form-horizontal">
                                    <div class="panel panel-default panel-warning">
                                        <div class="panel-heading">
                                            <b><h4 class="text-center">PERSONAL</h4></b>
                                        </div>
                                        <div class="panel-body">
                                            <div class="form-group">
                                                <label for="name" class="col-lg-3 control-label">Name:</label>
                                                <div class="col-lg-9">
                                                    <input type="text" pattern="*[A-Za-z]" class="form-control" name="name" id="name" placeholder="Enter your name"/>
                                                </div>
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="email" class="col-lg-3 control-label">Email:</label>
                                                <div class="col-lg-9">
                                                    <input type="email" pattern="[A-Za-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" class="form-control" name="email" id="email" placeholder="Enter your email"/>
                                                </div>
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="password" class="col-lg-3 control-label">Password:</label>
                                                <div class="col-lg-9">
                                                    <input type="password" class="form-control" name="pass" id="password" 
                                                           pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="must contain 8 or more characters that are of at least one number, and one uppercase and lowercase letter." placeholder="Enter your password"/>
                                                </div>
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="password" class="col-lg-3 control-label">Confirm:</label>
                                                <div class="col-lg-9">
                                                    <input type="password" class="form-control" name="pass2" id="password2" placeholder="Re-enter your password"/>
                                                </div>
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="gender" class="col-lg-3 control-label">Gender:</label>
                                                <div class="col-lg-9">
                                                    <label class="radio-inline"><input type="radio" name="gen" value="Male" id="gender"/>Male</label>
                                                    <label class="radio-inline"><input type="radio" name="gen" value="Female" id="gender"/>Female</label>
                                                    <label class="radio-inline"><input type="radio" name="gen" value="Other" id="gender"/>Other</label>
                                                </div>
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="dob" class="col-lg-3 control-label">Date of Birth:</label>
                                                <div class="col-lg-9">
                                                    <input type="date" class="form-control" name="dob" id="dob"/>
                                                </div>
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="country" class="col-lg-3 control-label">Country:</label>
                                                <div class="col-lg-9">
                                                    <select class="form-control" id="country_id" name="country">
                                                        <option disabled="" value="" selected="">Select Country</option>
                                                        <%
                                                            Connection con = DB.getConnection();
                                                            Statement st = con.createStatement();
                                                            ResultSet rs = st.executeQuery("select * from countries");
                                                            while (rs.next()) {
                                                        %>
                                                        <option value="<%=rs.getString("id")%>"><%=rs.getString("country_name")%></option>
                                                        <%
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="state" class="col-lg-3 control-label">State:</label>
                                                <div class="col-lg-9" id="state_id">
                                                    <select class="form-control" name="state">
                                                        <option>Select State</option>
                                                    </select>
                                                </div>
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="city" class="col-lg-3 control-label">City:</label>
                                                <div class="col-lg-9" id="city_name">
                                                    <select name="city" class="form-control">
                                                        <option>Select City</option>
                                                    </select>
                                                </div>
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="photo" class="col-lg-3 control-label">Photo:</label>
                                                <div class="col-lg-9">
                                                    <input class="form-control" type="file" name="photo" size="4096" required/>
                                                </div>
                                            </div><!--end form group-->
                                        </div>
                                    </div>
                                    <div class="panel panel-default panel-warning">
                                        <div class="panel-heading">
                                            <b><h4 class="text-center">ACADEMIC</h4></b>
                                        </div>
                                        <div class="panel-body">
                                            <div class="form-group">
                                                <label for="name" class="col-lg-3 control-label">High School:</label>
                                                <div class="col-lg-9">
                                                    <input type="text" pattern="*[A-Za-z]" class="form-control" name="hs" id="name" placeholder="Enter your high school name"/>
                                                </div>
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="name" class="col-lg-3 control-label">10<sup>th</sup> Marks %:</label>
                                                <div class="col-lg-9">
                                                    <input type="number" pattern="[0-9].{5}" class="form-control" name="hsm" id="name" placeholder="Enter marks"/>
                                                </div>
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="name" class="col-lg-3 control-label">Intermediate:</label>
                                                <div class="col-lg-9">
                                                    <input type="text" pattern="*[A-Za-z]" class="form-control" name="im" id="name" placeholder="Enter your intermediate college name"/>
                                                </div>
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="name" class="col-lg-3 control-label">12<sup>th</sup> Marks %:</label>
                                                <div class="col-lg-9">
                                                    <input type="number" pattern="[0-9].{5}" class="form-control" name="imm" id="name" placeholder="Enter marks"/>
                                                </div>
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="degree" class="col-lg-3 control-label">Graduation:</label>
                                                <div class="col-lg-9">
                                                    <select class="form-control" id="gd" name="gd">Select Course</select>
                                                </div>
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="department" class="col-lg-3 control-label">Departments:</label>
                                                <div class="col-lg-9">
                                                    <select class="form-control" name="dp" id="dp">Select Departments</select>
                                                </div>
                                            </div><!--end form group-->
                                            <script language="javascript">
                                                populateCourses("gd", "dp");
                                                populateCourses("gd");
                                            </script>
                                            <div class="form-group">
                                                <label for="name" class="col-lg-3 control-label">Institute:</label>
                                                <div class="col-lg-9">
                                                    <input type="text" pattern="*[A-Za-z]" class="form-control" name="ins" id="name" placeholder="Enter your institute name"/>
                                                </div>
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="name" class="col-lg-3 control-label">Aggregate(%):</label>
                                                <div class="col-lg-9">
                                                    <input type="number" pattern="[0-9].{5}" class="form-control" name="insm" id="name" placeholder="Enter aggregate"/>
                                                </div>
                                            </div><!--end form group-->
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-10 col-lg-offset-4">
                                            <button type="submit" class="btn btn-primary">Register</button>
                                            <button type="reset" class="btn btn-primary">Reset</button>
                                        </div>
                                    </div>   
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <hr><br><br>
        <!--end of Features-->

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="../bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>

<script>
    $(document).ready(function () {
        $("#country_id").on("change", function () {
            var country_id = $("#country_id").val();//id of country select box of index.jsp page;
                $.ajax({
                    url: "../state.jsp",//your jsp page name
                    data: {country_id: country_id},//sending request to state.jsp page.
                    method: "POST",//HTTP method.
                    success: function (data)
                    {
                        $("#state_id").html(data);//output or response will display in state select box.
                    }
                });
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#submit").on("click",function () {
            var country_id = $("#country_id").val();//id of country select box of index.jsp page;
            var state_id = $("#state").val();//coming value from state.jsp page.
            var city_name = $("#city").val();//coming value from city.jsp page.
            
            // check if country select box have blank or null value.
            if (country_id === ""||country_id===null)
            {
                $("#error").html("All fields are mandatory.");//this message will display in error div.
            }
            else
            {
                $("#error").html("");//show blank message when all select box doesn't have any null value.
                $.ajax({
                    url:"DisplayText",//your servlet or jsp page name.
                    method:"POST",//HTTP method.
                    data:{country_id:country_id,state_id:state_id,city_name:city_name},//sending request to DisplayText.java page.
                    success:function(data)
                    {
                        $("#success").html(data);//output or response will display in success div.
                        $("#form").trigger("reset");//this will reset the form.
                    }
                });
            }
        });
    });
</script>