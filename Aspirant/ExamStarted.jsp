<%-- 
    Document   : ExamStarted
    Created on : Apr 11, 2019, 2:47:02 PM
    Author     : Abhishek Rai
--%>

<%@page import="java.sql.Statement"%>
<%@page import="aspirant.DBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HashMap ud=(HashMap)session.getAttribute("Aspdata");
    if(ud!=null){
%>
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
        <link href="../bootstrap/css/forgetpassword.css" rel="stylesheet">
        <style>
            body {
              background-image: url('../bootstrap/img/bg.jpg');
            }
        </style>
    </head>
    
    <body data-spy="scroll" data-target="#my-navbar">
        <div class="container-fluid">
            <section>
                <div class="row">
                    <%--Left side--%>
                    <div class="col-lg-8">    
                        <div class="panel panel-default panel-info">
                            <div class="panel-heading">
                                    <%
                                        int paperid=Integer.valueOf((String)ud.get("paperid"));
                                        int crno=0;//Current row number
                                        DBConnect db=(DBConnect)application.getAttribute("db");
                                        if(db==null){
                                            db=new DBConnect();
                                            application.setAttribute("db",db);
                                        }
                                        //Retrivingg end of time of attempted question paper
                                        Statement stmt=db.getSt();
                                        String QPName="QPN"+paperid;
                                        ResultSet rs=stmt.executeQuery("select sub,enexam from facultypaperdetails where paperid='"+paperid+"' ");
                                        rs.next();
                                        //Gives time in millisecs since 1, 1970, 00:00:00 GMT
                                        Long en=rs.getTimestamp(2).getTime();
                                    %>
                                <div class="row">
                                    <h3 class="col-lg-7 col-lg-offset-1" color="white"><%=rs.getString(1)%></h3>
                                    <input type="Number" id="examdt" hidden value=<%=en%> />
                                    <h3 class="col-lg-3 col-lg-offset-1" color='white'><div id="demo"></div></h3>
                                </div>
                                    <script>
                                        // Set the date we're counting down to
                                        var countDownDate=document.getElementById("examdt").value;
                                        // Update the count down every 1 second
                                        var x = setInterval(function() {

                                                // Get todays date and time
                                                var now = new Date().getTime();

                                                // Find the distance between now and the count down date
//                                                var distance = countDownDate - now;
                                                var distance = countDownDate-now;


                                                // Time calculations for days, hours, minutes and seconds
                                                var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                                                var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                                                var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                                                var seconds = Math.floor((distance % (1000 * 60)) / 1000);

                                                // Output the result in an element with id="demo"
                                                document.getElementById("demo").innerHTML = hours + "H :" + minutes + "M :" + seconds + "S";

                                                // If the count down is over, write some text 
                                                if (distance < 0) {
                                                  clearInterval(x);
                                                  document.getElementById("demo").innerHTML = "Time over";
                                                  window.alert("Time is over. Click on 'OK' button to submit the exam.");
                                                  SubmitExam();
                                                }
                                              }, 1000);
                                    </script>
                                    <script>
                                        function SubmitExam(){
                                            window.location.href="../ExamStartedSubmitExamButton";
                                        }    
                                    </script>
                            </div>
                            <div class="panel-body">
                                <form method="post" class="form-horizontal">
                                    <%
                                        //Count total number of questions in question paper
                                        rs=stmt.executeQuery("select count(*) from "+QPName+"");
                                        rs.next();
                                        int totrows=rs.getInt(1);
                                        rs.close();
                                        //End count

                                        //Start
                                        rs=stmt.executeQuery("Select * from "+QPName+" ");
                                        rs.next();
                                        crno=rs.getRow();//Returns current row number as 1
                                        int qn2=Integer.valueOf((String)ud.get("QNo"));//Gives the ques# you are attempting
                                        if(qn2==0)
                                            ud.replace("QNo", "1");
                                        while(crno<qn2)
                                        {
                                            crno++;//Locating in db to get details of attempting question
                                            rs.next();
                                        }
                                                    
                                        String qpuser="QPN"+paperid+"rs";
                                        rs=stmt.executeQuery("Select OPTSEL from "+qpuser+" WHERE QNum='"+crno+"' and email='"+ud.get("email")+"' ");
                                        String optsel="";
                                        if(rs.next())
                                            optsel=rs.getString(1);//Getting the selected option for current question.
                                        //End

                                        //Fetching all the questions
                                        rs=stmt.executeQuery("Select * from "+QPName+" ");
                                        rs.next();
                                        crno=rs.getRow();//Returns current row number as 1
                                        int qn=Integer.valueOf((String)ud.get("QNo"));
                                        if(qn==0)
                                            ud.replace("QNo", "1");
                                        while(crno<qn)
                                        {
                                            crno++;
                                            rs.next();
                                        }
                                        //Fetching End

                                        if(crno<=totrows && crno>0){
                                    %>
                                    <div class="row">
                                        <div class="panel panel-default panel-heading col-lg-10 col-lg-offset-1">
                                            <h5><font color="Red">Question <%=rs.getInt(5)%> of <%=totrows%></font></h5>
                                            <div class="panel panel-default panel-danger panel-heading col-lg-12">
                                                <div class="form-group">
                                                    <label for="question" name="question" value='' class="col-lg-2 control-label">Question:</label>
                                                    <div class="col-lg-8">
                                                        <h5><%=rs.getString(6)%></h5>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <h5><b><%=rs.getInt(12)%> Mark</b></h5>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="answers" class="col-lg-2 control-label">Options:</label>
                                                    <div class="row col-lg-10">
                                                        <div class="col-lg-12">
                                                            <%
                                                                if(optsel.equals(rs.getString(7))){
                                                            %>
                                                                <input type="radio" checked  name="op" id="op" value='<%=rs.getString(7)%>' > <%=rs.getString(7)%>
                                                            <%
                                                                }else{
                                                            %>
                                                                <input type="radio"  name="op" id="op" value='<%=rs.getString(7)%>' > <%=rs.getString(7)%>
                                                            <%
                                                                }
                                                            %>
                                                        </div>
                                                        <div class="col-lg-12">
                                                            <%
                                                                if(optsel.equals(rs.getString(8))){
                                                            %>
                                                                <input type="radio" checked  name="op" id="op" value='<%=rs.getString(8)%>' > <%=rs.getString(8)%>
                                                            <%
                                                                }else{
                                                            %>
                                                                <input type="radio"  name="op" id="op" value='<%=rs.getString(8)%>' > <%=rs.getString(8)%>
                                                            <%
                                                                }
                                                            %>
                                                        </div>
                                                        <div class="col-lg-12">
                                                            <%
                                                                if(optsel.equals(rs.getString(9))){
                                                            %>
                                                                <input type="radio" checked  name="op" id="op" value='<%=rs.getString(9)%>' > <%=rs.getString(9)%>
                                                            <%
                                                                }else{
                                                            %>
                                                                <input type="radio"  name="op" id="op" value='<%=rs.getString(9)%>' > <%=rs.getString(9)%>
                                                            <%
                                                                }
                                                            %>
                                                        </div>
                                                        <div class="col-lg-12">
                                                            <%
                                                                if(optsel.equals(rs.getString(10))){
                                                            %>
                                                                <input type="radio" checked  name="op" id="op" value='<%=rs.getString(10)%>' > <%=rs.getString(10)%>
                                                            <%
                                                                }else{
                                                            %>
                                                                <input type="radio"  name="op" id="op" value='<%=rs.getString(10)%>' > <%=rs.getString(10)%>
                                                            <%
                                                                }
                                                            %>
                                                        </div>
                                                    </div>
                                                </div><!--end form group-->
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default panel-info panel-heading col-lg-10 col-lg-offset-1" align="center">
                                        <div class="form-group">
                                            <div class="col-lg-12"><br>
                                                <button type="submit" formaction="../ExamStartedPreviousButton" name="previous" id="previous" value='<%=(crno-1)%>' class="btn btn-default">Previous</button>
                                                <button type="submit" formaction="../ExamStartedSaveButton" name="save" value='<%=crno%>' class="btn btn-success">Save</button>
                                                <button type="submit" formaction="../ExamStartedReviewButton" name="review" value='<%=crno%>' class="btn btn-warning">Review</button>
                                                <button type="submit" formaction="../ExamStartedResetAnswerButton" name="resetanswer" value='<%=crno%>' class="btn btn-danger">Reset Answer</button>
                                                <button type="submit" formaction="../ExamStartedSaveReviewButton" name="save&review" value='<%=crno%>' class="btn btn-info">Save & Review</button>
                                                <button type="submit" formaction="../ExamStartedSaveNextButton" name="save&next" value='<%=(crno+1)%>' class="btn btn-success">Save & Next</button>
                                                <button type="submit" formaction="../ExamStartedNextButton" name="next" id="next" value='<%=(crno+1)%>' class="btn btn-default">Next</button>
                                            </div>
                                        </div>
                                    </div>
                                        <%
                                            }
                                        %>
                                </form>
                            </div>
                        </div>
                    </div>
                    <%--Right side--%>
                    <div class="col-lg-4">
                        <form action="" class="form-horizontal">
                            <div class="panel panel-default panel-info">
                                <div class="panel-heading text-center">
                                    <h3>Questions</h3>
                                </div>
                                <div class="panel-body text-left">
                                    <div class="panel panel-heading panel-primary">
                                        <div style="text-align:center">
                                        <%
                                            int trows=totrows,i=0;
                                            rs=stmt.executeQuery("Select RESPONSE from "+qpuser+" where email='"+ud.get("email")+"' ");
                                            while(trows>0 && rs.next()){
                                                trows--;i++;
                                                if(Integer.valueOf((String)ud.get("QNo"))==i){
                                        %>
                                                    <button formaction="../ExamStartedQNButton" class="btn btn-circle btn-primary" name="qn" value=<%=i%> ><font color="white"><%=i%></font></button>
                                        <%        
                                                }else if(rs.getString(1).equals("NOT ATTEMPTED")){
                                        %>
                                                    <button formaction="../ExamStartedQNButton" class="btn btn-circle btn-dark" name="qn" value=<%=i%> ><font color="white"><%=i%></font></button>
                                        <%        
                                                }else if(rs.getString(1).equals("ANSWERED")){
                                        %>
                                                    <button formaction="../ExamStartedQNButton" class="btn btn-circle btn-success" name="qn" value=<%=i%> ><font color="white"><%=i%></font></button>
                                        <%
                                                }else if(rs.getString(1).equals("NOT ANSWERED")){
                                        %>
                                                    <button formaction="../ExamStartedQNButton" class="btn btn-circle btn-danger" name="qn" value=<%=i%> ><font color="white"><%=i%></font></button>
                                        <%
                                                }else if(rs.getString(1).equals("REVIEW")){
                                        %>
                                                    <button formaction="../ExamStartedQNButton" class="btn btn-circle btn-warning" name="qn" value=<%=i%> ><font color="white"><%=i%></font></button>
                                        <%
                                                }else if(rs.getString(1).equals("REVIEW ANSWERED")){
                                        %>
                                                    <button formaction="../ExamStartedQNButton" class="btn btn-circle btn-info" name="qn" value=<%=i%> ><font color="white"><%=i%></font></button>
                                        <%
                                                }
                                            }
                                        %>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-body text-left">
                                    <div class="panel panel-heading panel-primary">
                                        <div style="text-align:left">
                                            <button class="btn btn-circle btn-primary" ><font color="primary">.</font></button> Current Question<br> 
                                            <button class="btn btn-circle btn-dark  " ><font color="grey">.</font></button> Not Attempted<br>
                                            <button class="btn btn-circle btn-danger" ><font color="warning">.</font></button> Not Answered<br>
                                            <button class="btn btn-circle btn-success" ><font color="success">.</font></button> Answered<br>
                                            <button class="btn btn-circle btn-warning"  ><font color="danger">.</font></button> Review<br>
                                            <button class="btn btn-circle btn-info"  ><font color="info">.</font></button>Answered but Review<br>
                                        </div>
                                    </div>
                                            <button type="submit" formaction="../ExamStartedSubmitExamButton" name="submitexam" class="btn btn-default col-lg-offset-4">Submit Exam</button>
                                </div>
                            </div>
                        </form>
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
