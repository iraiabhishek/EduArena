<%-- 
    Document   : FacEditProfile
    Created on : Mar 17, 2019, 2:53:53 AM
    Author     : Abhishek Rai
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.java.DB"%>

<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HashMap ud=(HashMap)session.getAttribute("Facdata");
    if(ud!=null){
%>
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
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle navbar-brand"><%=ud.get("name")%> <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="FacProfile.jsp">Profile</a></li>
                                <li><a href="FacPapers.jsp">Exam Papers</a></li>
                                <li><a href="../LogoutFac">Logout</a></li>
                            </ul>
                        </div>
                    </ul>			
                </div>
            </div>
	</nav><!-- end of navbar-->
		
        <div class="container">
            <section>
                <div class="col-lg-10 col-lg-offset-1">
                    <div class="panel panel-default">
                        <div class="panel-heading text-center">
                            <div class="row">
                                <div class="col-lg-12">
                                    <img src="../GetPhotoFac?email=<%=ud.get("email")%>"
                                         border="20px" align="" width="120px" height="120px" alt="Profile Photo">
                                    <br><br>
                                </div>
                                <form action="../UpdatePhotoFac" method="post" enctype="multipart/form-data" class="form-horizontal">
                                    <div class="form-group">
                                        <div class="row col-lg-8 col-lg-offset-3">
                                            <div class="col-lg-3">
                                                <label for="changephoto" control-label=""><h4>Change Photo:</h4></label>
                                            </div>
                                            <div class="col-lg-4">
                                                <input class="form-control" type="file" accept="image/*" name="photo" size="4096" required/>
                                            </div>
                                            <div class="col-lg-1">
                                                <button type="submit" class="btn">Update Photo</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div class="panel-body">
                            <div class="container">
                                <form method="post" class="form-horizontal col-lg-9">
                                    <div class="panel panel-default panel-warning">
                                        <div class="panel-heading">
                                            <b><h4 class="text-center">PERSONAL</h4></b>
                                        </div>
                                        <div class="panel-body">
                                            <div class="form-group">
                                                <label for="name" class="col-lg-2 control-label">Name:</label>
                                                <div class="col-lg-10">
                                                    <input type="text" pattern="*[A-Za-z]" class="form-control" name="name" id="name" placeholder="Enter your name"/>
                                                </div>
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="email" class="col-lg-2 control-label">Email:</label>
                                                <div class="col-lg-10">
                                                    <!-- <input type="email" class="form-control" disabled name="email"  id="email" placeholder="<%=ud.get("email")%>"/> -->
                                                    <input type="email" class="form-control" readonly name="email"  id="email" placeholder="<%=ud.get("email")%>"/>
                                                </div>
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="gender" class="col-lg-2 control-label">Gender:</label>
                                                <div class="col-lg-10">
                                                    <label class="radio-inline"><input type="radio" name="gen" value="Male" id="gender" required/>Male</label>
                                                    <label class="radio-inline"><input type="radio" name="gen" value="Female" id="gender" required/>Female</label>
                                                    <label class="radio-inline"><input type="radio" name="gen" value="Other" id="gender" required/>Other</label>
                                                </div>
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="dob" class="col-lg-2 control-label">Date of Birth:</label>
                                                <div class="col-lg-10">
                                                    <input type="date" class="form-control" name="dob" id="dob" required/>
                                                </div>
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                    <label for="country" class="col-lg-2 control-label">Country:</label>
                                                    <div class="col-lg-10">
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
                                                <label for="state" class="col-lg-2 control-label">State:</label>
                                                <div class="col-lg-10" id="state_id">
                                                    <select class="form-control" name="state">
                                                        <option>Select State</option>
                                                    </select>
                                                </div>
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="city" class="col-lg-2 control-label">City:</label>
                                                <div class="col-lg-10" id="city_name">
                                                    <select name="city" class="form-control">
                                                        <option>Select City</option>
                                                    </select>
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
                                                <label for="name" class="col-lg-2 control-label">High School:</label>
                                                <div class="col-lg-10">
                                                    <input type="text" pattern="*[A-Za-z]" class="form-control" name="hs" id="hs" placeholder="Enter your high school name"/>
                                                </div>
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="name" class="col-lg-2 control-label">10<sup>th</sup> Marks:</label>
                                                <div class="col-lg-10">
                                                    <input type="number" pattern="[0-9].{5}" class="form-control" name="hsm" id="hsm" placeholder="Enter marks in %"/>
                                                </div>
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="name" class="col-lg-2 control-label">Intermediate:</label>
                                                <div class="col-lg-10">
                                                    <input type="text" pattern="*[A-Za-z]" class="form-control" name="im" id="im" placeholder="Enter your intermediate college name"/>
                                                </div>
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="name" class="col-lg-2 control-label">12<sup>th</sup> Marks:</label>
                                                <div class="col-lg-10">
                                                    <input type="number" pattern="[0-9].{5}" class="form-control" name="imm" id="imm" placeholder="Enter marks in %"/>
                                                </div>
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="degree" class="col-lg-2 control-label">Graduation:</label>
                                                <div class="col-lg-10">
                                                    <select class="form-control" id="gd" name="gd"></select>
                                                </div>
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="department" class="col-lg-2 control-label">Departments:</label>
                                                <div class="col-lg-10">
                                                    <select class="form-control" name="dp" id="dp"></select>
                                                </div>
                                            </div><!--end form group-->
                                            <script language="javascript">
                                                populateCourses("gd", "dp");
                                                populateCourses("gd");
                                            </script>
                                            <div class="form-group">
                                                <label for="name" class="col-lg-2 control-label">Institute:</label>
                                                <div class="col-lg-10">
                                                    <input type="text" pattern="*[A-Za-z]" class="form-control" name="ins" id="ins" placeholder="Enter your institute name"/>
                                                </div>
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="name" class="col-lg-2 control-label">Aggregate(%):</label>
                                                <div class="col-lg-10">
                                                    <input type="number" pattern="[0-9].{5}" class="form-control" name="insm" id="insm" placeholder="Enter aggregate"/>
                                                </div>
                                            </div><!--end form group-->
                                        </div>
                                    </div>
                                    <div class="panel panel-default panel-warning">
                                        <div class="panel-body">
                                            <div class="form-group">
                                                <div class="col-lg-6 col-lg-offset-3">
                                                    <button formaction="../UpdateProfileFac" type="submit" class="btn btn-warning">Update Profile</button>
                                                    <button formaction="" type="reset" class="btn btn-primary">Reset</button>
                                                    <button formaction="" type="submit" class="btn btn-primary" onclick="history.back()">Back</button>
                                                    <button formaction="../DeleteAccountFac" type="submit" class="btn btn-danger">Delete Account</button>
                                                </div>
                                            </div><!--end form group-->
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
                                    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
<%
    }else{
        session.setAttribute("msg","Plz Login First!");
            response.sendRedirect("../index.jsp");
    }
%>

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