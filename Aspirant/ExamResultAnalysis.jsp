<%-- 
    Document   : ExamResult
    Created on : Apr 15, 2019, 11:05:03 PM
    Author     : Abhishek Rai
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="aspirant.DBConnect"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HashMap ud=(HashMap)session.getAttribute("Aspdata");
    if(ud!=null){
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="widdiv=device-widdiv, initial-scale=1">
        <!-- dive above 3 meta tags *must* come first in dive head; any odiver head content must come *after* divese tags -->
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
                                <li><a href="AspProfile.jsp">Profile</a></li>
                                <li><a href="AspCourses.jsp">Courses</a></li>
                                <li><a href="RegisteredExams.jsp">Registered Exams</a></li>
                                <li><a href="../Logout">Logout</a></li>
                            </ul>
                        </div>
                    </ul>			
                </div>
            </div>
	</nav><!-- end of navbar-->
	
        
        <div class="container-fluid text-center" >
            <section>
                <div class=" col-lg-12">
                    <div class="panel panel-default panel-info">
                        <div class="panel-heading text-center">
                            <h3><b>RESULT</b></h3>
                        </div>
                        <div class="panel-body">
                            <form action="" class="form-horizontal">
                                <div class="form-group"><br>
                                    <div class="panel panel-heading panel-primary col-lg-10 col-lg-offset-1">
                                        <%
                                            DBConnect db=(DBConnect)application.getAttribute("db");
                                            if(db==null){
                                                db=new DBConnect();
                                                application.setAttribute("db",db);
                                            }
                                            //Counting total rows
                                            int paperid=Integer.valueOf((String)ud.get("paperid"));
//                                            String email=((String)ud.get("email")).replace("@gmail.com", "");
                                            String qpuser="QPN"+paperid+"rs";
                                            String QPName="QPN"+paperid;
                                            Statement stmt=db.getSt();
                                            //Code End
                                            
                                            //Required for the inserting result in database
                                            int pid=0;
                                            String em="";
                                            ResultSet rs=stmt.executeQuery("Select email,paperid from examresults where email='"+(String)ud.get("email")+"' and paperid='"+Integer.valueOf((String)ud.get("paperid"))+"' ");
                                            if(rs.next()){
                                                em=rs.getString(1);
                                                pid=rs.getInt(2);
                                            }
                                            //
                                            rs=stmt.executeQuery("SELECT CO,OPTSEL,MARK, RESPONSE FROM "+QPName+","+qpuser+" WHERE"
                                                    + " "+QPName+".QNum="+qpuser+".QNum and '"+(String)ud.get("email")+"'="+qpuser+".email");
                                            int totquestion=0,attemptedquestion=0,correctquestions=0,incorrectquestions=0, notanswered=0;
                                            int totMarks=0, amptMarks=0, namptMarks=0, correctMarks=0, incMarks=0;
                                            while(rs.next()){
                                                    if(rs.getString(4).equals("ANSWERED")){
                                                        if(rs.getString(1).equals(rs.getString(2))){
                                                            correctMarks+=rs.getInt(3);
                                                            correctquestions++;
                                                        }
                                                        else{ 
                                                            incorrectquestions++;
                                                            incMarks-=rs.getInt(3);
                                                        }
                                                        amptMarks+=rs.getInt(3);
                                                        attemptedquestion++;
                                                    }else{
                                                       namptMarks+=rs.getInt(3);
                                                       notanswered++;
                                                    }
                                                    totMarks+=rs.getInt(3);
                                                    totquestion++;
                                            }
                                            double markScored=correctMarks+incMarks*0.33;
                                            DecimalFormat dfr = new DecimalFormat("0.00");
                                            rs=stmt.executeQuery("select * from facultypaperdetails where paperid='"+paperid+"'");
                                            rs.next();
                                        %>
                                        <div class="text-center panel panel-warning">
                                            <h4><%=rs.getString(5).toUpperCase() %></h4>
                                        </div>
                                        <div class="text-center">
                                            <div class="panel panel-body panel-success ">
                                                <div class="panel-heading">
                                                    <h4><b>Marks Scored : <%=dfr.format(markScored)%> / <%=totMarks %></b></h4>
                                                </div>
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <table border="1px" cellpadding="5px" cellspacing="0px" width="100%">
                                                            <tr>
                                                                <td></td>
                                                                <td>Total</td>
                                                                <td>Attempted</td>
                                                                <td>Not Answered</td>
                                                                <td>Correct</td>
                                                                <td>Incorrect</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Questions</td>
                                                                <td><%=totquestion %></td>
                                                                <td><%=attemptedquestion %></td>
                                                                <td><%=notanswered %></td>
                                                                <td><%=correctquestions %></td>
                                                                <td><%=incorrectquestions %></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Marks</td>
                                                                <td><%=totMarks %></td>
                                                                <td><%=amptMarks %></td>
                                                                <td><%=namptMarks %></td>
                                                                <td><%=correctMarks %></td>
                                                                <td><%=(double)incMarks*0.33%></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                                <div>
                                                    <button onclick="history.back()" class="btn btn-default" name='view' value="" >Back</button>
                                                </div>
                                            </div>
                                        </div><!--end form group-->
                                    </div>
                                </div>
                            </form>
                            <%
                                Timestamp ct=new Timestamp(System.currentTimeMillis());
                                if(! ( pid==rs.getInt(9)  && em.equals((String)ud.get("email"))) )
                                {   
                                    stmt.executeUpdate("INSERT INTO examresults (NAME,EMAIL,SUB,DOE,DOET,TotalQ,AttemptedQ,NotAnsweredQ,CorrectQ,IncorrectQ,"
                                        + "TotalM,AttemptedM,NotAnsweredM,CorrectM,IncorrectM,paperid)"
                                        + " VALUES ('"+(String)ud.get("name")+"','"+(String)ud.get("email")+"','"+rs.getString(5)+"','"+rs.getTimestamp(7)+"','"+ct+"',"
                                                + "'"+totquestion+"','"+attemptedquestion+"','"+notanswered+"','"+correctquestions+"','"+incorrectquestions+"',"
                                                        + " '"+(double)totMarks+"','"+(double)amptMarks+"','"+(double)namptMarks+"','"+(double)correctMarks+"',"
                                                                + "'"+(double)incMarks*0.33+"','"+paperid+"' ) ");
                                
                                }else{
                                    stmt.executeUpdate("UPDATE examresults SET DOET='"+ct+"',TotalQ='"+totquestion+"',AttemptedQ='"+attemptedquestion+"',NotAnsweredQ='"+notanswered+"',"
                                        + "CorrectQ='"+correctquestions+"', IncorrectQ='"+incorrectquestions+"',TotalM='"+(double)totMarks+"',AttemptedM='"+(double)amptMarks+"',"
                                        + "NotAnsweredQ='"+(double)namptMarks+"', CorrectM='"+(double)correctMarks+"',IncorrectM='"+(double)incMarks*0.33+"' "
                                                + "WHERE EMAIL='"+(String)ud.get("email")+"' and PAPERID='"+paperid+"' ");
                                
                                }
                            %>
                        </div>
                    </div>
                </div>
            </section>
            <section>
                <div class=" col-lg-12">
                    <div class="panel panel-default panel-info">
                        <div class="panel-heading text-center">
                            <h3><b>ANALYSIS</b></h3>
                        </div>
                        <div class="panel-body">
                            <div class="panel panel-default">
                                <%
                                    rs=stmt.executeQuery("select * from "+qpuser+", "+QPName+" "
                                            + "where "+qpuser+".email='"+(String)ud.get("email")+"' and "+qpuser+".qnum = "+QPName+".qnum "
                                            + " order by "+qpuser+".qnum asc");
                                    String marksAwarded="";
                                    while(rs.next()){
                                %>
                                <%
                                    if(rs.getString(16).equals(rs.getString(4)) && rs.getString(5).equals("ANSWERED")){
                                        marksAwarded="+"+rs.getString(17);
                                %>
                                <div class="panel-body text-left panel-success">
                                <%        
                                    }else if(rs.getString(5).equals("ANSWERED")){
                                        DecimalFormat df = new DecimalFormat("0.00");
                                        marksAwarded="-"+df.format(Double.parseDouble(rs.getString(17))/3);
                                %>
                                <div class="panel-body text-left panel-danger">
                                <%
                                    }else{
                                        marksAwarded="0";
                                %>
                                <div class="panel-body text-left panel-info">
                                <%
                                    }
                                %>
                                    <div class="panel panel-heading panel-default panel-warning">
                                        <form action="../PaperSetQuestion" method="post" class="form-horizontal">
                                            <div class="panel panel-heading panel-default panel-warning">
                                                <div class="form-group">
                                                    <label for="question" class="col-lg-2 control-label">Question <%=rs.getString(3)%>: </label>
                                                    <div class="col-lg-9">
                                                        <h5><%=rs.getString(11)%></h5>
                                                    </div>
                                                    <div class="col-lg-1">
                                                        <h5><b>Marks</b></h5>
                                                        <h5><b><%=marksAwarded %> / <%=rs.getString(17)%></b></h5>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="answers" class="col-lg-2 control-label">Options:</label>
                                                    <div class="row col-lg-offset-2 col-lg-10">
                                                        <h5 class="col-lg-4">(A) <%=rs.getString(12)%></h5>
                                                        <h5 class="col-lg-4 col-lg-offset-1">(B) <%=rs.getString(13)%></h5>
                                                    </div>
                                                    <div class="row col-lg-offset-2 col-lg-10">
                                                        <h5 class="col-lg-4">(C) <%=rs.getString(14)%></h5>
                                                        <h5 class="col-lg-4 col-lg-offset-1">(D) <%=rs.getString(15)%></h5>
                                                    </div>
                                                </div><!--end form group-->
                                                <div class="form-group" >
                                                    <label for="cropt" class="col-lg-2 control-label">Correct Answer:</label>
                                                    <p class="col-lg-4 control-label"  ><%=rs.getString(16)%></p><br/><br/>
                                                    <label for="cropt" class="col-lg-2 control-label">Marked:</label>
                                                    <p class="col-lg-4 control-label"><%=rs.getString(4)%></p>
                                                </div><!--end form group-->
                                            </div>
                                        </form>
                                    </div>                                
                                </div>
                                <%
                                    }
                                %>
                                <hr>
                            </div><br><br>
                        </div>
                    </div>
                </div>
            </section>
        </div><br><br>
            
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