<%-- 
    Document   : FacEditPaper
    Created on : Apr 7, 2019, 7:54:52 PM
    Author     : Abhishek Rai
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="faculty.DBConnect"%>
<%@page import="java.util.HashMap"%>
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
	</nav>
	</br></br>
        
        <div class="container-fluid">
            <section>
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1">
                        <div class="panel panel-default">
                            <%
                                DBConnect db=(DBConnect)application.getAttribute("db");
                                if(db==null){
                                    db=new DBConnect();
                                    application.setAttribute("db",db);
                                }
                                PreparedStatement QPD=db.getQPDetails();
                                QPD.setString(1, (String)ud.get("email"));
                                QPD.setString(2, (String)ud.get("paperid"));
                                ResultSet rs=QPD.executeQuery();
                                if(rs.next()){
                            %>
                            <div class="panel-heading text-center">
                                <hr><h3><b>EDIT QUESTION</b></h3><hr>
                                <div class="row">
                                    <div class="form-group col-lg-6">
                                        <label for="name" class="col-lg-4 control-label">Name:</label>
                                        <div class="col-lg-8">
                                            <label for="name" class="control-label"><%=rs.getString(1)%></label>
                                        </div>
                                    </div><!--end form group-->
                                    <div class="form-group col-lg-6">
                                        <label for="email" class="col-lg-4 control-label">Email:</label>
                                        <div class="col-lg-8">
                                            <label for="email" class="control-label"><%=rs.getString(2)%></label>
                                        </div>
                                    </div><!--end form group-->
                                </div>
                                <div class="row">
                                    <div class="form-group col-lg-6">
                                        <label for="degree" class="col-lg-4 control-label">Graduation:</label>
                                        <div class="col-lg-8">
                                            <label for="degree" class="control-label"><%=rs.getString(3)%></label>
                                        </div>
                                    </div><!--end form group-->
                                    <div class="form-group col-lg-6">
                                        <label for="department" class="col-lg-4 control-label">Departments:</label>
                                        <div class="col-lg-8">
                                            <label for="department" class="control-label"><%=rs.getString(4)%></label>
                                        </div>
                                    </div><!--end form group-->
                                </div>
                                <div class="row">
                                    <div class="form-group col-lg-6">
                                        <label for="subject" class="col-lg-4 control-label">Subject:</label>
                                        <div class="col-lg-8">
                                            <label for="subject" class="control-label"><%=rs.getString(5)%></label>
                                        </div>
                                    </div><!--end form group-->
                                    <div class="form-group col-lg-6">
                                        <label for="totq" class="col-lg-4 control-label">Questions:</label>
                                        <div class="col-lg-8">
                                            <label for="totq" class="control-label"><%=rs.getString(6)%></label>
                                        </div>
                                    </div><!--end form group-->
                                </div>
                                <div class="row">
                                    <div class="form-group col-lg-6">
                                        <label for="stexam" class="col-lg-4 control-label">Start:</label>
                                        <div class="col-lg-8">
                                            <label for="stexam" class="control-label"><%=rs.getString(7)%></label>
                                        </div>
                                    </div><!--end form group-->
                                    <div class="form-group col-lg-6">
                                        <label for="enexam" class="col-lg-4 control-label">End:</label>
                                        <div class="col-lg-8">
                                            <label for="enexam" class="control-label"><%=rs.getString(8)%></label>
                                        </div>
                                    </div><!--end form group-->
                                </div>
                                <hr>    
                            </div>
                            <%
                                }
                                int tq=Integer.valueOf(rs.getString(6));
                                String QPName="QPN"+((String) ud.get("paperid"));
                                Statement stmt=db.getSt();
                                rs=stmt.executeQuery("select count(*) from "+QPName+"");
                                rs.next();
                                int qnum=rs.getInt(1);
                                rs.close();
                                rs=stmt.executeQuery("Select * from "+QPName+"");
                                int qn= Integer.valueOf(request.getParameter("ed"));
                                while(rs.next()){
                                    if(Integer.valueOf(rs.getString(5))==qn){
                            %>
                            <div class="panel-body text-left panel-primary">
                                <div class="panel panel-danger">
                                    <form action="../PaperUpdateQuestion" class="form-horizontal">
                                        <hr>
                                        <div class="form-group">
                                            <label for="question" class="col-lg-2 control-label">Question <%=rs.getString(5)%>: </label>
                                            <div class="col-lg-9">
                                                <textarea type="text" id="question" name="tarea" class="form-control" rows="4" cols="50"><%=rs.getString(6)%></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="answers" class="col-lg-2 control-label">Answers:</label>
                                            <div class="row">
                                                <div class="column col-lg-2">
                                                    <label for="question" class="control-label">(A) </label>
                                                    <input type="text" class="form-control" name="op1" id="op1" placeholder="Option 1" value=<%=rs.getString(7)%> />
                                                </div>
                                                <div class="column col-lg-2">
                                                    <label for="question" class="control-label">(B) </label>
                                                    <input type="text" class="form-control" name="op2" id="op2" placeholder="Option 2" value=<%=rs.getString(8)%> />
                                                </div>
                                                <div class="column col-lg-2">
                                                    <label for="question" class="control-label">(C) </label>
                                                    <input type="text" class="form-control" name="op3" id="op3" placeholder="Option 3" value=<%=rs.getString(9)%> />
                                                </div>
                                                <div class="column col-lg-2">
                                                    <label for="question" class="control-label">(D) </label>
                                                    <input type="text" class="form-control" name="op4" id="op4" placeholder="Option 4" value=<%=rs.getString(10)%> />
                                                </div>
                                            </div>
                                        </div><!--end form group-->
                                        <div class="form-group">
                                            <label for="cropt" class="col-lg-2 control-label">Correct Answer:</label>
                                            <div class="col-lg-2">
                                                <input type="text" class="form-control" name="cropt" id="cropt" placeholder="Correct option" value=<%=rs.getString(11)%> />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="cropt" class="col-lg-2 control-label">Mark:</label>
                                            <div class="col-lg-2">
                                                <input type="text" class="form-control" name="mark" id="mark" placeholder="Marks" value=<%=rs.getString(12)%> />
                                            </div>
                                        </div><!--end form group-->
                                        <hr>
                                        <div class="form-horizontal col-lg-offset-5">    
                                            <div class="form-group">
                                                <div class="form-group">
                                                    <button type="submit" class="btn btn-success" name="upqn" value=<%=rs.getString(5)%> >Update</button>
                                                    <button type="" class="btn btn-primary" onclick="history.back()" >Back</button>
                                                </div>						
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <%
                                    }
                                }
                            %>
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
            response.sendRedirect("../index.jsp");
    }
%>