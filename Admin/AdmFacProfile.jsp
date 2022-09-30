<%-- 
    Document   : AdmFacProfile
    Created on : Apr 14, 2019, 1:28:03 PM
    Author     : Abhishek Rai
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="admin.DBConnect"%>
<%@page import="java.util.HashMap"%>
<%
    HashMap aspfac=(HashMap)session.getAttribute("aspfac");            
    HashMap ud=(HashMap)session.getAttribute("Admdata");            
    if(aspfac!=null){
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
      <!-- Bootstrap -->
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
                                <li><a href="AdmProfile.jsp">Profile</a></li>
                                <li><a href="AdmFacList.jsp">Faculty List</a></li>
                                <li><a href="AdmAspList.jsp">Aspirant List</a></li>
                                <li><a href="../LogoutAdm">Logout</a></li>
                            </ul>
                        </div>
                    </ul>			
                </div>
            </div>
	</nav>
	</br></br>
        
        <div class="container-fluid ">
            <section>
                <div class="row">
                    <div class="col-lg-7">
                        <div class="panel panel-default panel-danger">
                            <div class="panel-heading text-center">
                                <div class="col-lg-12">
                                    <img src="../GetPhotoAspFac?email=<%=aspfac.get("email")%>"
                                         border="20px" align="" width="120px" height="120px" alt="Profile Photo">
                                </div><br><br><br><br><br><br>
                            </div>
                            <div class="panel-body text-left">
                                <form action="" class="form-horizontal">
                                    <div class="panel panel-default panel-warning">
                                        <div class="panel-heading">
                                            <b><h4 class="text-center">PERSONAL</h4></b>
                                        </div>
                                        <div class="panel-body">
                                            <div class="form-horizontal col-lg-offset-4">    
                                                <div class="form-group">
                                                    <label for="email" class="control-label">Name: <font color="grey"><%=aspfac.get("name")%></font></label>						
                                                </div><!--end form group-->
                                                <div class="form-group">
                                                    <label for="name" class="control-label">Email: <font color="grey"><%=aspfac.get("email")%></font></label>						
                                                </div><!--end form group-->
                                                <div class="form-group">
                                                    <label for="gender" class="control-label">Gender: <font color="grey"><%=aspfac.get("gen")%></font></label>
                                                </div><!--end form group-->
                                                <div class="form-group">
                                                    <label for="dob" class="control-label">Date of Birth: <font color="grey"><%=aspfac.get("dob")%></font></label>
                                                </div>
                                                <%
                                                    int stid=Integer.parseInt(String.valueOf(aspfac.get("state")));
                                                    int ctid=Integer.parseInt(String.valueOf(aspfac.get("country")));
                                                    DBConnect db=(DBConnect)application.getAttribute("db");
                                                    if(db==null){
                                                        db=new DBConnect();
                                                        application.setAttribute("db",db);
                                                    }
                                                    Statement stmt=db.getSt();
                                                    ResultSet r1=stmt.executeQuery("Select country_name from countries where id="+ctid+"");
                                                    r1.next();
                                                    String ct=r1.getString(1);
                                                    ResultSet r2=stmt.executeQuery("Select state from states where id="+stid+"");
                                                    r2.next();
                                                    String st=r2.getString(1);
                                                %>
                                                <div class="form-group">
                                                    <label for="state" class="control-label">Address: <font color="grey"><%=aspfac.get("city")%>, <%=st%>, <%=ct%></font></label>						
                                                </div><!--end form group-->
                                            </div>
                                        </div>
                                    </div>    
                                    <div class="panel panel-default panel-warning">
                                        <div class="panel-heading">
                                            <b><h4 class="text-center">ACADEMIC</h4></b>
                                        </div>
                                        <div class="panel-body">
                                            <div class="form-horizontal col-lg-offset-4">    
                                            <div class="form-group">
                                                <label for="hs" class="control-label">High School: <font color="grey"><%=aspfac.get("hs")%></font></label>						
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="hsm" class="control-label">Marks: <font color="grey"><%=aspfac.get("hsm")%></font></label>						
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="im" class="control-label">Intermediate: <font color="grey"><%=aspfac.get("im")%></font></label>						
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="imm" class="control-label">Marks: <font color="grey"><%=aspfac.get("imm")%></font></label>						
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="gd" class="control-label">Graduation: <font color="grey"><%=aspfac.get("gd")%></font></label>						
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="dp" class="control-label">Department: <font color="grey"><%=aspfac.get("dp")%></font></label>						
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="ins" class="control-label">Institute: <font color="grey"><%=aspfac.get("ins")%></font></label>						
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="insm" class="control-label">Aggregate(%): <font color="grey"><%=aspfac.get("insm")%></font></label>						
                                            </div><!--end form group-->
                                        </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-10 col-lg-offset-4">
                                            <button type="" class="btn btn-primary" onclick="history.back()" >Back</button>
                                            <button type="submit" value=<%=aspfac.get("email")%> name="email" class="btn btn-danger" formaction="../DeleteFacAdm" onclick="return confirm('Click on OK button to delete this account.');">Delete Account</button>
                                        </div>
                                    </div>            
                                </form>
                            </div>
                        </div><br><br>
                    </div>
                                        
                                            
                    <div class="col-lg-5">
                        <div class="panel panel-default panel-danger">
                            <div class="panel-heading text-center">
                                <div class="col-lg-12">
                                    <h3><b>QUESTION PAPERS</b></h3>
                                </div><br><br><br><br><br><br>
                            </div>
                            <div class="panel-body text-left">
                                <form action="" class="form-horizontal">
                                    <div class="panel panel-default panel-warning">
                                        <div class="panel-heading">
                                            <b><h4 class="text-center">SCHEDULED</h4></b>
                                        </div>
                                        <div class="panel-body">
                                            <div class="form-horizontal">    
                                                <%
                                                    db=(DBConnect)application.getAttribute("db");
                                                    if(db==null){
                                                        db=new DBConnect();
                                                        application.setAttribute("db",db);
                                                    }
                                                    int i=0;
                                                    stmt=db.getSt();
                                                    ResultSet res=stmt.executeQuery("Select * from facultypaperdetails where Ready='YES' and Email='"+((String)aspfac.get("email"))+"' ");
                                                    while(res.next()){
                                                        i++ ;
                                                %>
                                                        <div class="col-lg-1">
                                                            <div class="form-group">
                                                                <label for="sno" class="control-label"><b><%=i%>.</b></label>
                                                            </div><!--end form group-->
                                                        </div>
                                                        <div class="col-lg-7">
                                                            <div class="form-group">
                                                                <label for="sub" class="control-label"><b><%=res.getString(5) %></b></label>
                                                            </div><!--end form group-->
                                                        </div>
                                                        <div class="col-lg-4">
                                                            <div class="form-group">
                                                                <input type="hidden" id="pid" name="pid" value='<%=res.getInt(9)%>' />
                                                                <!--The hidden field is not shown to the user, but the data is sent when the form is submitted.-->
                                                                <button type="submit" value='<%=res.getInt(9)%>' name="sbt" class="btn btn-dark" formaction="AdmFacViewPapers.jsp">View</button>
                                                                <button type="submit" value='<%=aspfac.get("email")%>' name="email" class="btn btn-danger" formaction="../DeleteFacSQP" onclick="return confirm('Click on OK button to delete this paper record completely');" >Delete</button>
                                                            </div>						
                                                        </div>
                                                <%
                                                    }
                                                %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default panel-warning">
                                        <div class="panel-heading">
                                            <b><h4 class="text-center">PREPARING</h4></b>
                                        </div>
                                        <div class="panel-body">
                                            <div class="form-horizontal">    
                                                <%
                                                    db=(DBConnect)application.getAttribute("db");
                                                    if(db==null){
                                                        db=new DBConnect();
                                                        application.setAttribute("db",db);
                                                    }
                                                    i=0;
                                                    stmt=db.getSt();
                                                    res=stmt.executeQuery("Select * from facultypaperdetails where Ready='NO' and Email='"+((String)aspfac.get("email"))+"' ");
                                                    while(res.next()){
                                                        i++ ;
                                                %>
                                                        <div class="col-lg-1">
                                                            <div class="form-group">
                                                                <label for="sno" class="control-label"><b><%=i%>. </b></label>
                                                            </div><!--end form group-->
                                                        </div>
                                                        <div class="col-lg-7">
                                                            <div class="form-group">
                                                                <label for="sub" class="control-label"><b><%=res.getString(5) %></b></label>
                                                            </div><!--end form group-->
                                                        </div>
                                                        <div class="col-lg-4">
                                                            <div class="form-group">
                                                                <input type="hidden" id="pid1" name="pid1" value='<%=res.getInt(9)%>' />
                                                                <!--The hidden field is not shown to the user, but the data is sent when the form is submitted.-->
                                                                <button type="submit" value='<%=aspfac.get("email")%>' name='email1' class="btn btn-danger" formaction="../DeleteFacPQP" onclick="return confirm('Click on OK button to delete this account.');">Delete</button>
                                                            </div>						
                                                        </div>
                                                <%
                                                    }
                                                %>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div><br><br>
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
            response.sendRedirect("../errorpage.jsp");
    }
%>