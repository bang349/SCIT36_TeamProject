<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js css-menubar">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="bootstrap material admin template">
    <meta name="author" content="">
    
    <title>Login V3 | Remark Material Admin Template</title>
    
    <link rel="apple-touch-icon" href="resources/global/images/apple-touch-icon.png">
    <link rel="shortcut icon" href="resources/global/images/favicon.ico">
    
    <!-- Stylesheets -->
    <link rel="stylesheet" href="resources/global/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/global/css/bootstrap-extend.min.css">
    <link rel="stylesheet" href="resources/global/css/site.min.css">
    
    <!-- Plugins -->
    <link rel="stylesheet" href="resources/global/vendor/animsition/animsition.css">
    <link rel="stylesheet" href="resources/global/vendor/asscrollable/asScrollable.css">
    <link rel="stylesheet" href="resources/global/vendor/switchery/switchery.css">
    <link rel="stylesheet" href="resources/global/vendor/intro-js/introjs.css">
    <link rel="stylesheet" href="resources/global/vendor/slidepanel/slidePanel.css">
    <link rel="stylesheet" href="resources/global/vendor/flag-icon-css/flag-icon.css">
    <link rel="stylesheet" href="resources/global/vendor/waves/waves.css">
        <link rel="stylesheet" href="resources/global/css/login-v3.css">
    
    <!-- Fonts -->
    
    <link rel="stylesheet" href="resources/global/fonts/material-design/material-design.min.css">
    <link rel="stylesheet" href="resources/global/fonts/brand-icons/brand-icons.min.css">
    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,300italic'>
    

    
    <!-- Scripts -->
    <script src="resources/global/vendor/breakpoints/breakpoints.js"></script>
   
   <!-- fireBase -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <script src="https://www.gstatic.com/firebasejs/5.8.6/firebase.js"></script>
   <script src = "https://www.gstatic.com/firebasejs/5.8.6/firebase-app.js"></script>
   <script src = "https://www.gstatic.com/firebasejs/5.8.6/firebase-database.js"></script>
   <script>
      // 파이어베이스 접속을 위한 객체 생성
      var config = 
      {
         apiKey: "AIzaSyAI8TGALcJNErr2GXWpPOVSlhKEXav_A4Y",
         authDomain: "testfirebase-c65c3.firebaseapp.com",
          databaseURL: "https://testfirebase-c65c3.firebaseio.com",
          projectId: "testfirebase-c65c3",
          storageBucket: "testfirebase-c65c3.appspot.com",
          messagingSenderId: "322301187076"
      };
        
      //파이어베이스 접속
      firebase.initializeApp(config);
        
      //파이어베이스 데이터를 사용하기 위한 변수 생성
      var database = firebase.database();
      
   </script>
    <script>
      Breakpoints();
    </script>
  
    <script>  	
    	function logIn()
    	{
    		let id = $("#userId").val();
    		let password = $("#userPassword").val();
   			alert(id);
    		database.ref("Prokan/Member/" + id).once("value").then(function(snapshot)
    		{
    			let member = JSON.parse(JSON.stringify(snapshot));
    			
    			if(member.userPassword == password)
    			{	
    				$.ajax
    				({
    					url: "successLogin",
    					type: "POST",
    					data: 
    					{
    						userId : id
    					},
    					success: function(isSuccess)
    					{
   					    	alert("로그인 성공");
	    				    location.href = "/TeamProject/defaultPage";
   						}
   				    })
	  			}
    			else
    			{
    				alert("false");
    			}
    		});
    		
    	}
    	
    	$(function()
    	{
    	 	$("#signInButton").on("click", logIn);
    	})
    
    </script>
    
  </head>
  <body class="animsition page-login-v3 layout-full">


    <!-- Page -->
    <div class="page vertical-align text-center" data-animsition-in="fade-in" data-animsition-out="fade-out">>
      <div class="page-content vertical-align-middle">
        <div class="panel">
          <div class="panel-body">
            <div class="brand">
              <img class="brand-img" src="resources/global//images/logo-colored.png" alt="...">
              <h2 class="brand-text font-size-18">Pro感</h2>
            </div>
            <form method="post" action="#" autocomplete="off">
              <div class="form-group form-material floating" data-plugin="formMaterial">
                <input type="text" class="form-control" id="userId" />
                <label class="floating-label">ID</label>
           
              </div>
              <div class="form-group form-material floating" data-plugin="formMaterial">
                <input type="password" class="form-control" id="userPassword" />
                <label class="floating-label">Password</label>
              </div>
              <div class="form-group clearfix">
                <div class="checkbox-custom checkbox-inline checkbox-primary checkbox-lg float-left">
                  <input type="checkbox" id="inputCheckbox" id="remember">
                  <label for="inputCheckbox">Remember me</label>
                </div>
                <a class="float-right" href="forgot-password.html">Forgot password?</a>
              </div>
              <button type="button" class="btn btn-primary btn-block btn-lg mt-40" id = "signInButton">Sign in</button>
            </form>
            <p>Still no account? Please go to <a href="proKan_register">Sign up</a></p>
          </div>
        </div>

        <footer class="page-copyright page-copyright-inverse">
          <p>WEBSITE BY Creation Studio</p>
          <p>Â© 2018. All RIGHT RESERVED.</p>
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


    <!-- Core  -->
    <script src="resources/global/vendor/babel-external-helpers/babel-external-helpers.js"></script>
    <script src="resources/global/vendor/jquery/jquery.js"></script>
    <script src="resources/global/vendor/popper-js/umd/popper.min.js"></script>
    <script src="resources/global/vendor/bootstrap/bootstrap.js"></script>
    <script src="resources/global/vendor/animsition/animsition.js"></script>
    <script src="resources/global/vendor/mousewheel/jquery.mousewheel.js"></script>
    <script src="resources/global/vendor/asscrollbar/jquery-asScrollbar.js"></script>
    <script src="resources/global/vendor/asscrollable/jquery-asScrollable.js"></script>
    <script src="resources/global/vendor/ashoverscroll/jquery-asHoverScroll.js"></script>
    <script src="resources/global/vendor/waves/waves.js"></script>
    
    <!-- Plugins -->
    <script src="resources/global/vendor/switchery/switchery.js"></script>
    <script src="resources/global/vendor/intro-js/intro.js"></script>
    <script src="resources/global/vendor/screenfull/screenfull.js"></script>
    <script src="resources/global/vendor/slidepanel/jquery-slidePanel.js"></script>
        <script src="resources/global/vendor/jquery-placeholder/jquery.placeholder.js"></script>
    
    <!-- Scripts -->
    <script src="resources/global/js/Component.js"></script>
    <script src="resources/global/js/Plugin.js"></script>
    <script src="resources/global/js/Base.js"></script>
    <script src="resources/global/js/Config.js"></script>
    
    <script src="resources/global/js/Section/Menubar.js"></script>
    <script src="resources/global/js/Section/GridMenu.js"></script>
    <script src="resources/global/js/Section/Sidebar.js"></script>
    <script src="resources/global/js/Section/PageAside.js"></script>
    <script src="resources/global/js/Plugin/menu.js"></script>
    
    <script src="resources/global/js/config/colors.js"></script>
    <script src="resources/global/js/config/tour.js"></script>
    <script>Config.set('assets', 'resources/global');</script>
    
    <!-- Page -->
    <script src="resources/global/js/Site.js"></script>
    <script src="resources/global/js/Plugin/asscrollable.js"></script>
    <script src="resources/global/js/Plugin/slidepanel.js"></script>
    <script src="resources/global/js/Plugin/switchery.js"></script>
        <script src="resources/global/js/Plugin/jquery-placeholder.js"></script>
        <script src="resources/global/js/Plugin/material.js"></script>
    
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
