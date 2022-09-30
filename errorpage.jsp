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
        
        <div class="container text-center" >
            <section>
                <div class="panel panel-default panel-danger">
                    <div class="panel-heading text-center">
                        <h1><b>ERROR</b></h1>
                    </div>
                    <div class="panel-body">
                        <form action="" class="form-horizontal">
                            <div class="form-group">
                                <h3>Something went wrong !</h3>
                                <h3><%=session.getAttribute("msg")%></h3>
                            </div><!--end form group-->
                        </form>
                        <div>
                            <button onclick="history.back()" class="btn btn-default" name='view' value="" >Back</button>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>