<%-- 
    Document   : changepassword
    Created on : 15 Jun, 2018, 6:11:48 PM
    Author     : Abhishek Rai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>EduArena</title>
        <link rel="icon" href="bootstrap/img/EA.ico" type="image/x-icon">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="bootstrap/css/forgetpassword.css" rel="stylesheet">
        <style>
            body {
              background-image: url('bootstrap/img/bg.jpg');
            }
        </style>
    </head>
    
    <body data-spy="scroll" data-target="#my-navbar">
        <nav class="navbar navbar-inverse navbar-fixed-top" id="my-navbar">
            <div class="container-fluid ">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="index.jsp" class="navbar-brand">EduArena</a>
                </div><!--end header-->
            </div><!--end container-->
        </nav><!--end navbar-->
        <br/><br/><br/><br/>
        
        <div class="container">
            <section>
                <div class="col-lg-8 col-lg-offset-2">
                    <div class="panel panel-default panel-primary">
                        <div class="panel-heading text-center">
                            <h3>FORGET PASSWORD ?</h3>
                        </div>
                        <div class="panel-body"><br/><br/>
                            <form action="" method="post" class="form-horizontal">
                                <div class="form-group">
                                    <label for="email" class="col-lg-4 control-label">Email ID: </label>
                                    <div class="col-lg-5">
                                        <input type="email" class="form-control" name="email" placeholder="Please enter your here."/>
                                    </div>
                                </div><!--end form group-->
                                <br>
                                <div class="form-group">
                                    <div class="col-lg-10 col-lg-offset-4">
                                        <button type="" class="btn btn-primary" onclick="history.back()" >Back</button>
                                        <button type="submit" formaction="resetpassword.jsp" class="btn btn-primary">Send Link</button>
                                        <button type="reset" class="btn btn-primary">Reset</button>
                                    </div>
                                </div><!--end form group-->
                            </form>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>