<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Modern Business - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<!-- Niconico CSS -->
	<link href="css/main.css" rel="stylesheet" type="text/css">

	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" ></script>
	<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>‌​
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	<script>
		function AddSelection(){
  			
  			activeOption = document.getElementById("usertype").selectedIndex;
  			
  			if (activeOption == 1)
  			{
  				document.getElementById("div0").style.display = "block";
  				document.getElementById("div1").style.display = "block";
  				document.getElementById("div2").style.display = "none";
  			}
  			
  			if (activeOption == 2) 
  			{
  				document.getElementById("div0").style.display = "none";
  				document.getElementById("div1").style.display = "none";
  				document.getElementById("div2").style.display = "block";
  			}		
  		}
	</script>
</head>

<body>
 <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.php">Sub-Cellular Localization</a>
				<?php
					include "search.php";
				?>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="about.php">About</a>
                    </li>
                    
                    <li class="dropdown active">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Tool <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="blast.php">Blast</a>
                            </li>
                            <li>
                                <a href="mitoloc.php">MitoLoc</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                       <a href="#" class="dropdown-toggle" data-toggle="dropdown">Login<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="login.php">Login</a>
                            </li>
							<li>
                                <a href="register.php">Register</a>
                            </li>
                     
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Other Pages <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="full-width.html">Full Width Page</a>
                            </li>
                            <li>
                                <a href="sidebar.html">Sidebar Page</a>
                            </li>
                            <li>
                                <a href="faq.html">FAQ</a>
                            </li>
                            <li>
                                <a href="404.html">404</a>
                            </li>
                            <li>
                                <a href="pricing.html">Pricing Table</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
 <!-- Page Content -->
    <div class="container">
<!-- Contact Form -->

        <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->

        <div class="row">

            <div class="col-md-8">

                <h3>Registration Form</h3>

                <form action="functions.php" method="POST" name="registration" id="contactForm" novalidate>

                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Select User Type:</label>
                            <select name="user-type" onchange="AddSelection()" class="form-control" id="usertype" required data-validation-required-message="Please enter your name.">
								<option >---user type---</option>
								<option value="individual" id="indiv">Individual</option>
								<option value="institution" id="instit">Institution</option>
							</select>
                            <p class="help-block"></p>
                        </div>
                
                        <div class="controls">
                            <label>Username</label>
                            <input type="text" class="form-control" id="username" name="username"required data-validation-required-message="Please enter your Username.">
                            <p class="help-block"></p>
                        </div>

                        <div id="div2" style="display: none;" class="controls">
                            <label>Institution Name</label>
                            <input type="text" class="form-control" id="institution_name" name="institution_name" required data-validation-required-message="Please enter your Institution Name.">
                            <p class="help-block"></p>
                        </div>
                        
                        <div id="div0" style="display: none;" class="controls">
                            <label>Firstname</label>
                            <input type="text" class="form-control" id="firstname" name="firstname" required data-validation-required-message="Please enter your Firstname.">
                            <p class="help-block"></p>
                        </div>
                        
                        <div id="div1" style="display: none;" class="controls">
                            <label>Lastname</label>
                            <input type="text" class="form-control" id="lastname" name="lastname" required data-validation-required-message="Please enter your Lastname.">
                            <p class="help-block"></p>
                        </div>
                                                
                        <div class="controls">
                            <label>Email</label>
                            <input type="text" class="form-control" id="email" name="email" required data-validation-required-message="Please enter your Email.">
                            <p class="help-block"></p>
                        </div>
                        
                        <div class="controls">
                            <label>Address</label>
                            <input type="text" class="form-control" id="address" name="address" required data-validation-required-message="Please enter your Address.">
                            <p class="help-block"></p>
                        </div>
                        
                        <div class="controls">
                            <label>City</label>
                            <input type="text" class="form-control" id="city" name="city" required data-validation-required-message="Please enter your City.">
                            <p class="help-block"></p>
                        </div>
                        
                        <div class="controls">
                            <label>State</label>
                            <input type="text" class="form-control" id="state" name="state" required data-validation-required-message="Please enter your State.">
                            <p class="help-block"></p>
                        </div>
                        
                        <div class="controls">
                            <label>Zip Code</label>
                            <input type="text" class="form-control" id="zipcode" name="zipcode" required data-validation-required-message="Please enter your Zipcode.">
                            <p class="help-block"></p>
                        </div>

                    </div>
                    
                    <div id="success"></div>

                    <!-- For success/fail messages -->

                    <button type="submit" name="submitRegForm" class="btn btn-primary">Submit</button>

                </form>

            </div>



        </div>

        <!-- /.row -->
		        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Contact Form JavaScript -->
    <!-- Do not edit these files! In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

</body>

</html>
