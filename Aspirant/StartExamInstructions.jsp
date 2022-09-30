<%-- 
    Document   : StartExam
    Created on : Apr 11, 2019, 11:25:03 AM
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
            .header {
              position: fixed;
              top: 0;
              z-index: 1;
              width: 100%;
              background-color: #f1f1f1;
            }

            .header h2 {
              text-align: center;
            }

            .progress-container {
              width: 100%;
              height: 8px;
              background: #ccc;
            }

            .progress-bar {
              height: 8px;
              background: #4caf50;
              width: 0%;
            }

            .content {
              padding: 100px 0;
              margin: 50px auto 0 auto;
              width: 80%;
            }
        </style>
        <style>
            div.ex1 {
              background-color: azure;
              width: 916px;
              height: 300px;
              overflow: auto;
            }
            div.ex5 {
                  background-color: white;
                  width: 916px;
                  height: 100px;
                  overflow: visible;
            }
        </style>
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
		
        <div class="container">
            <section>
                <div class="panel panel-default panel-info">
                    <div class="panel-heading text-center">
                        <h3><font color="White"><b>EXAM INSTRUCTIONS</b></font></h3>  
                    </div>
                    <div class="progress-container">
                        <div class="progress-bar" id="myBar"></div>
                    </div>            
                    <div class="panel-body">
                        <form method="post" class="form-horizontal">
                            <div class="row">
                                <div class="panel panel-default panel-danger panel-heading col-lg-10 col-lg-offset-1">
                                    <!--<h4 class="col-lg-offset-0"><font color="Red">Paper Specific Instructions</font></h4>-->
                                    <!--<h4 class="col-lg-offset-0"><font color="Red">Examination Guidelines</font></h4>-->
                                    <!--<h4 class="col-lg-offset-0"><font color="Red">General Instructions</font></h4>-->
                                    <div class="col-12 col-md-10">
                                        <div class="col-12 col-md-12 border p-2">
                                            <div class="col-12 col-md-12 col-md-offset-1 text-center text-danger">
                                                <h4><b>General Instructions</b></h4>
                                            </div>
                                            <div class="col-12 col-md-12">
                                                <p>The clock will be set at the server. The countdown timer at the right corner of the screen will display the remaining time available for you to complete the examination. When the timer reaches zero the examination ends by itself. You need to terminate the examination or submit the paper.<br/><br/>The question palette displayed on the right side of the screen will show the status of each question using one of the following symbols:</p>
                                            </div>
                                            <div class="col-12 col-md-12">
                                                <div class="row">
                                                    <div class="col-12 col-md-12"><br/>
                                                        <button type="submit" disabled="true" class="btn btn-primary">0</button>
                                                        <span class="insnotVisited"></span><span class="style-float">You are at current question.</span>
                                                    </div>
                                                    <div class="col-12 col-md-12"><br/>
                                                        <button type="submit" disabled="true" class="btn btn-default">0</button>
                                                        <span class="insnotVisited"></span><span class="style-float">You have not visited the question yet.</span>
                                                    </div>
                                                    <div class="col-12 col-md-12"><br/>
                                                        <button type="submit" disabled="true" class="btn btn-danger">0</button>
                                                        <span class="insunattempt"></span><span class="style-float">You have not answered the question.</span>
                                                    </div>
                                                    <div class="col-12 col-md-12"><br/>
                                                        <button type="submit" disabled="true" class="btn btn-success">0</button>
                                                        <span class="insattempt"></span><span class="style-float">You have answered the question.</span>
                                                    </div>
                                                    <div class="col-12 col-md-12"><br/>
                                                        <button type="submit" disabled="true" class="btn btn-warning">0</button>
                                                        <span class="insmark"></span><span class="style-float">You have NOT answered the question, but have marked the question for review.</span>
                                                    </div>
                                                    <div class="col-12 col-md-12"><br/>
                                                        <button type="submit" disabled="true" class="btn btn-info">0</button>
                                                        <span class="insmarkReview" style="padding-top: 10px;padding-right: 5px;"></span><span class="style-float">You have answered the question, but marked it for review.</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-12 mt-3"><br/>
                                                <p>The Marked for Review status for a question simply indicates that you would like to look at that question again. If a question is answered, but marked for review, then the answer to that question will be considered in the evaluation, unless the status is modified by the candidate.</p>
                                            </div>
                                            <div class="col-12 col-md-12">
                                                <p><b class="text-danger">Navigating to a Question</b></p>
                                            </div>
                                            <div class="col-12 col-md-12">
                                                <p>To answer a question, do the following:</p>
                                                <ul>    
                                                    <li>Click on the question number in the Question Palette to go to that question directly.</li>
                                                    <li>Select an answer for a multiple choice type question by clicking on bubble placed before the 4 choices A, B, C, D. Use the virtual numeric keypad to enter a number as an answer to a numerical type question.</li>
                                                    <li>Click on <b>Save and Next</b> to save your answer for the current question and then go to the next question.</li>
                                                    <li>Click on <b>Mark for Review and Next</b> to save your answer for the current question, mark it for review, and then go to the next question.</li>
                                                    <li>Caution: Note that your answer for the current question will not be saved, if you navigate to another question directly by clicking on its question number.</li>
                                                    <li>You can view all the questions by clicking on the <b>Question Paper</b> button. This feature is provided so that you can see the entire question paper at a glance. Note that the options for multiple choice type questions will not be shown.</li>
                                                </ul>
                                            </div>
                                            <div class="col-12 col-md-12">
                                                <p><b class="text-danger">Answering a Question</b></p>
                                            </div>
                                            <div class="col-12 col-md-12">
                                                <p>Procedure for answering a multiple choice type question:</p>
                                                <ul>
                                                    <li>To select your answer, click on the button of one of the options A, B, C, D</li>							
                                                        <li>To deselect your chosen answer, click on the button of the chosen option again or click on the <b>Clear Response button</b></li>
                                                        <li>To change your chosen answer, click on the button of another option</li>						
                                                        <li>To save your answer, you MUST click on the <b>Save & Next</b> button</li>
                                                        <li>To mark the question for review, click on the <b>Mark for Review & Next</b> button. If an answer is selected for a question that is <b>Marked for Review,</b> that answer will be considered in the evaluation.</li>
                                                        <li>Procedure for answering a numerical answer type question:<br/></li>
                                                        <li>To enter a number as your answer, use the virtual numerical keypad</li>
                                                        
<!--                                                        <li><b>In Numerical Type Questions, you are limited to answer till two decimal points.</b></li>
                                                        <li>A fraction (eg. -0.3 or -.3) can be entered as an answer with or without "0" before the decimal point</li>
                                                        <li>To clear your answer, click on the <b>Clear Response</b> button</li>
                                                    <ul>
                                                        <li>To save your answer, you MUST click on the <b>Save & Next</b> button</li>
                                                        <li>To mark the question for review, click on the <b>Mark for Review and Next</b> button. If an answer is entered for a question that is <b>Marked for Review,</b> that answer will be considered in the evaluation.</li>
                                                        <li>To change your answer to a question that has already been answered, first select that question for answering and then follow the procedure for answering that type of question.</li>
                                                        <li>Note that ONLY Questions for which answers are saved or <b>MARKED FOR REVIEW</b> after answering will be considered for evaluation</li>
                                                    </ul>-->
                                                </ul>
                                            </div>
<!--                                            <div class="col-12 col-md-12">
                                                <p><b class="text-danger">8. Sections</b></p>
                                            </div>
                                            <div class="col-12 col-md-12">
                                                <ul>
                                                    <li>a. Sections in the question paper will be displayed in the top bar of the screen. Questions in a section can be viewed by clicking on the name of that Section. The Section you are currently viewing will be highlighted</li>
                                                    <li>b. After clicking on Save & the Next button for the last question in a Section, you will be automatically taken to the first question of the next Section in a sequence.</li>
                                                    <li>c. You can move the mouse cursor over the name of the Section to view the answering status of that Section.</li>
                                                    <li>d. You can shuffle between different Sections or change the optional Sections any number of times.</li>
                                                </ul>
                                            </div>
                                            <div class="col-12 col-md-12">
                                                <p><b class="text-danger">9. Calculators</b></p>
                                                <p>Online Scientific Calculators will be available in GATE Online Test Platform.</p>
                                            </div>-->
                                            <div class="col-12 col-md-12">
                                                <p><b class="text-danger">Disclaimer:</b></p>
                                                <p>This Online Test Series is designed by studying and surveying the previous platforms of the respective examinations. And efforts are made to replicate the actual exam patterns in all the aspects. However EduArena will not be responsible for any changes in exam pattern or functionality updates in the actual examinations.</p>
                                            </div>
                                            <div class="col-12 col-md-12">
                                                <p><b class="text-danger">Declaration:</b></p>
                                                <p>I have read and understood all the above mentioned instructions. Also, I confirm that at the start of the examination all the computer hardware and internet connection are in proper working condition.</p>
                                            </div>
                                        <!--                                        
                                            <div class="col-12 col-md-12">
                                                <div class="row">
                                                    <div class="col-12 col-md-10">
                                                        <div class="form-check">
                                                            <label class="form-check-label">
                                                                <input type="checkbox" class="" id="acceptcheckBox" name="acceptCheckBox1" onchange="doalert(this)">
                                                                <span class="text-danger">I have read and understood the instructions. I agree that in case of not adhering to the exam instructions, I will be disqualified from giving the exam. </span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-md-2">
                                                        <div class="col-12 col-md-12">
                                                            <button type="button" class="btn btn-primary col-12 col-md-12" id="staartTestBtn" disabled onclick="startTest(17)">Start Test</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        -->    
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                            <div class="ex5 panel panel-default panel-danger panel-heading col-lg-10 col-lg-offset-1">
                                    <input type="checkbox" name="checkbox" id="checkme" value="checkbox"/>
                                    <span class="text-danger">I <%=ud.get("name")%> have read and understood the instructions. I agree that in case of not adhering to the exam instructions, I will be disqualified from giving the exam. </span>
                                <div class="form-group">
                                    <div class="col-lg-7 col-lg-offset-5">
                                        <button type="submit" disabled="disabled" class="btn btn-primary" id="sendNewSms" name="startexam" formaction="../StartExam" value=<%=Integer.valueOf((String)ud.get("paperid"))%> >Start Exam</button>
                                        <script>
                                            var checker=document.getElementById('checkme');
                                            var sendbtn=document.getElementById('sendNewSms');
                                            checker.onchange=function(){
                                                if(this.checked)
                                                    sendbtn.disabled=false;
                                                else
                                                    sendbtn.disabled=true;
                                            };
                                        </script>
                                    </div>
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

<script>
// When the user scrolls the page, execute myFunction 
window.onscroll = function() {myFunction()};
function myFunction() {
  var winScroll = document.body.scrollTop || document.documentElement.scrollTop;
  var height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
  var scrolled = (winScroll / height) * 100;
  document.getElementById("myBar").style.width = scrolled + "%";
}
</script>
<%
    }else{
        session.setAttribute("msg","Plz Login First!");
            response.sendRedirect("../index.jsp");
    }
%>