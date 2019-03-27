<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js css-menubar">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="bootstrap material admin template">
    <meta name="author" content="">
    
    <title>Pro感_LoginPage</title>
    
    <link rel="apple-touch-icon" href="resources/material/iconbar/assets/images/apple-touch-icon.png">
    <link rel="shortcut icon" href="resources/material/iconbar/assets/images/favicon.ico">
    
    <!-- Stylesheets -->
    <link rel="stylesheet" href="resources/material/global/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/material/global/css/bootstrap-extend.min.css">
    <link rel="stylesheet" href="resources/material/iconbar/assets/css/site.min.css">
    
    <!-- Plugins -->
    <link rel="stylesheet" href="resources/material/global/vendor/animsition/animsition.css">
    <link rel="stylesheet" href="resources/material/global/vendor/asscrollable/asScrollable.css">
    <link rel="stylesheet" href="resources/material/global/vendor/switchery/switchery.css">
    <link rel="stylesheet" href="resources/material/global/vendor/intro-js/introjs.css">
    <link rel="stylesheet" href="resources/material/global/vendor/slidepanel/slidePanel.css">
    <link rel="stylesheet" href="resources/material/global/vendor/flag-icon-css/flag-icon.css">
    <link rel="stylesheet" href="resources/material/global/vendor/waves/waves.css">
        <link rel="stylesheet" href="resources/material/iconbar/assets/examples/css/pages/login-v3.css">
    
    
    <!-- Fonts -->
    <link rel="stylesheet" href="resources/material/global/fonts/material-design/material-design.min.css">
    <link rel="stylesheet" href="resources/material/global/fonts/brand-icons/brand-icons.min.css">
    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,300italic'>
    
    <!-- Scripts -->
    <script src="resources/material/global/vendor/breakpoints/breakpoints.js"></script>
    <script>
      Breakpoints();
    </script>
  </head>
  
  <script>
  	$(function()
  	{
  		$("#SignInButton").on("click", function()
  		{
  			alert();
  			
  			alert("goSignUpPage}");
  		})	
  	})
  
  </script>
  
  
  
  <body class="animsition page-login-v3 layout-full">


    <!-- Page -->
    <div class="page vertical-align text-center" data-animsition-in="fade-in" data-animsition-out="fade-out">>
      <div class="page-content vertical-align-middle">
        <div class="panel">
          <div class="panel-body">
            <div class="brand">
              <img class="brand-img" src="resources/material/iconbar/assets//images/logo-colored.png" alt="...">
              <h2 class="brand-text font-size-18">Pro感</h2>
            </div>
            <form method="post" action="#" autocomplete="off">
              <div class="form-group form-material floating" data-plugin="formMaterial">
                <input type="email" class="form-control" name="email" />
                <label class="floating-label">Id</label>
              </div>
              <div class="form-group form-material floating" data-plugin="formMaterial">
                <input type="password" class="form-control" name="password" />
                <label class="floating-label">Password</label>
              </div>
              <div class="form-group clearfix">
                <div class="checkbox-custom checkbox-inline checkbox-primary checkbox-lg float-left">
                  <input type="checkbox" id="inputCheckbox" name="remember">
                  <label for="inputCheckbox">Remember me</label>
                </div>
                <a class="float-right" href="forgot-password.html">Forgot password?</a>
              </div>
              <button type="submit" class="btn btn-primary btn-block btn-lg mt-40" id = "SignInButton">Sign in</button>
            </form>
            <p>Still no account? Please go to <a href="register-v3.html">Sign up</a></p>
          </div>
        </div>

        <footer class="page-copyright page-copyright-inverse">
          <p>WEBSITE BY Creation Studio</p>
          <p>© 2018. All RIGHT RESERVED.</p>
          <div class="social">
            <a class="btn btn-icon btn-pure" href="javascript:void(0)">
            <i class="icon bd-twitter" aria-hidden="true"></i>
          </a>
            <a class="btn btn-icon btn-pure" href="javascript:void(0)">
            <i class="icon bd-facebook" aria-hidden="true"></i>
          </a>
            <a class="btn btn-icon btn-pure" href="javascript:void(0)">
            <i class="icon bd-google-plus" aria-hidden="true"></i>
          </a>
          </div>
        </footer>
      </div>
    </div>
    <!-- End Page -->

	<!-- <script src = "resources/scripts/viewScript.js"></script> -->
	
	/**
 * 
 */
	//<!-- Core  -->
     <script src ="resources/material/global/vendor/babel-external-helpers/babel-external-helpers.js"> </script>
     <script src ="resources/material/global/vendor/jquery/jquery.js">  </script>
     <script src ="resources/material/global/vendor/popper-js/umd/popper.min.js"> </script> 
     <script src ="resources/material/global/vendor/bootstrap/bootstrap.js">  </script>
     <script src ="resources/material/global/vendor/animsition/animsition.js">  </script>
     <script src ="resources/material/global/vendor/mousewheel/jquery.mousewheel.js">  </script>
     <script src ="resources/material/global/vendor/asscrollbar/jquery-asScrollbar.js">  </script>
     <script src ="resources/material/global/vendor/asscrollable/jquery-asScrollable.js">  </script>
     <script src ="resources/material/global/vendor/waves/waves.js">  </script>
    
    //<!-- Plugins -->
     <script src ="resources/material/global/vendor/switchery/switchery.js">  </script>
     <script src ="resources/material/global/vendor/intro-js/intro.js">  </script>
     <script src ="resources/material/global/vendor/screenfull/screenfull.js">  </script>
     <script src ="resources/material/global/vendor/slidepanel/jquery-slidePanel.js">  </script>
         <script src ="resources/material/global/vendor/jquery-placeholder/jquery.placeholder.js">  </script>
    
    //<!-- Scripts -->
     <script src ="resources/material/global/js/Component.js">  </script>
     <script src ="resources/material/global/js/Plugin.js">  </script>
     <script src ="resources/material/global/js/Base.js">  </script>
     <script src ="resources/material/global/js/Config.js">  </script>
    
     <script src ="resources/material/iconbar/assets/js/Section/Menubar.js">  </script>
     <script src ="resources/material/iconbar/assets/js/Section/Sidebar.js">  </script>
     <script src ="resources/material/iconbar/assets/js/Section/PageAside.js">  </script>
     <script src ="resources/material/iconbar/assets/js/Plugin/menu.js">  </script>
    
    //<!-- Config -->
     <script src ="resources/material/global/js/config/colors.js">  </script>
     <script src ="resources/material/iconbar/assets/js/config/tour.js">  </script>
     Config.set('assets', 'resources/material/iconbar/assets')
    
    //<!-- Page -->
     <script src ="resources/material/iconbar/assets/js/Site.js"> </script> 
     <script src ="resources/material/global/js/Plugin/asscrollable.js">  </script>
     <script src ="resources/material/global/js/Plugin/slidepanel.js">  </script>
     <script src ="resources/material/global/js/Plugin/switchery.js">  </script>
         <script src ="resources/material/global/js/Plugin/jquery-placeholder.js">  </script>
         <script src ="resources/material/global/js/Plugin/material.js">  </script>
    
  
    <script>
      (function(document, window, $){
        'use strict';
    
        var Site = window.Site;
        $(document).ready(function(){
          Site.run();
        });
      })(document, window, jQuery);
    </script>
   
  </body>
</html>
