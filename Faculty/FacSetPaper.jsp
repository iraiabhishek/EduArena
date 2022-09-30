<%-- 
    Document   : FacSetPaper
    Created on : Mar 18, 2019, 2:34:10 PM
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
                                <hr><h3><font color="black"><b>SET QUESTIONS</b></font></h3><hr>
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
                                int paperid=Integer.valueOf((String) ud.get("paperid"));
                                String QPName="QPN"+paperid;
                                Statement stmt=db.getSt();
                                rs=stmt.executeQuery("select count(*) from "+QPName+"");
                                rs.next();
                                int qnum=rs.getInt(1);
                                rs.close();
                                if(tq>qnum){
                                    stmt.executeUpdate("Update facultypaperdetails SET ready='NO' where paperid='"+paperid+"' ");
                            %>
                            <br>
                                <div class="panel-body text-left panel-default">
                                    <div class="panel panel-info"><br>
                                        <form action="../PaperSetQuestion" class="form-horizontal">
                                            <div class="form-group">
                                                <label for="question" class="col-lg-2 control-label">Q.No.<%=(qnum+1)%>: </label>
                                                <div class="col-lg-9">
                                                    <textarea type="text" id="question" name="tarea" class="form-control" rows="4" cols="50"></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="answers" class="col-lg-2 control-label">Answers:</label>
                                                <div class="row">
                                                    <div class="column col-lg-2">
                                                        <label for="question" class="control-label">(A) </label>
                                                        <input type="text" class="form-control" name="op1" id="op1" placeholder="Option 1"/>
                                                    </div>
                                                    <div class="column col-lg-2">
                                                        <label for="question" class="control-label">(B) </label>
                                                        <input type="text" class="form-control" name="op2" id="op2" placeholder="Option 2"/>
                                                    </div>
                                                    <div class="column col-lg-2">
                                                        <label for="question" class="control-label">(C) </label>
                                                        <input type="text" class="form-control" name="op3" id="op3" placeholder="Option 3"/>
                                                    </div>
                                                    <div class="column col-lg-2">
                                                        <label for="question" class="control-label">(D) </label>
                                                        <input type="text" class="form-control" name="op4" id="op4" placeholder="Option 4"/>
                                                    </div>
                                                </div>
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="cropt" class="col-lg-2 control-label">Correct Answer:</label>
                                                <div class="col-lg-2">
                                                    <input type="text" class="form-control" name="cropt" id="cropt" placeholder="Correct option"/>
                                                </div>
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="mark" class="col-lg-2 control-label">Mark:</label>
                                                <div class="col-lg-2">
                                                    <input type="number" class="form-control" name="mark" id="mark" placeholder="Enter marks"/>
                                                </div>
                                            </div><!--end form group-->
                                            <hr>
                                            <div class="form-horizontal col-lg-offset-6">    
                                                <div class="form-group">
                                                    <div class="form-group">
                                                        <button type="" class="btn btn-primary" onclick="history.back()" >Back</button>
                                                        <button type="submit" class="btn btn-success ">Add</button>
                                                    </div>						
                                                </div>
                                            </div>
                                        </form>                                
                                    </div>
                                </div>
                            <%
                                }else{
                                    stmt.executeUpdate("Update facultypaperdetails SET ready='YES' where paperid='"+paperid+"' ");
                            %>
                                <div class="panel-body text-left">
                                    <div class="text-center">
                                        <hr>
                                            <h3><b><font color="#a04000">Question paper designed successfully.<br/> Thank you !!</font></b></h3>
                                        <hr>
                                        <a href="FacViewPaper.jsp"><button type="submit" name="ed"  class="btn btn-info" >View</button></a>
                                        <button type="" class="btn btn-primary" onclick="history.back()" >Back</button>
                                        <a href="../PaperDelete"><button type="submit" name="ed"  class="btn btn-danger" >Delete</button></a>
                                    </div>                                
                                </div>
                            <%        
                                }
                            %>
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