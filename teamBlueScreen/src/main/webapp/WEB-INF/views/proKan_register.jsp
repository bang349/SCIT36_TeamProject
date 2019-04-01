<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js css-menubar">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="bootstrap material admin template">
    <meta name="author" content="">
    
    <title>Register V3 | Remark Material Admin Template</title>
    
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
        <link rel="stylesheet" href="resources/global/css/register-v3.css">
    
    
    <!-- Fonts -->
    <link rel="stylesheet" href="resources/global/fonts/material-design/material-design.min.css">
    <link rel="stylesheet" href="resources/global/fonts/brand-icons/brand-icons.min.css">
    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,300italic'>

    
    <!-- Scripts -->
    <script src="resources/global/vendor/breakpoints/breakpoints.js"></script>
    <script>
      Breakpoints();

    </script>
    
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
  </head>
  
	<script>
  	$(function()
	{
		$("#signUp").on("click", function()
		{
			let userId = $("#userId").val();
			let userPassword = $("#password").val();
			let name = $("#name").val();
			let Member =
			{
				userPassword : userPassword,
				name : name
			}
			
			database.ref("Prokan/Member/"+userId).set(Member);
			alert("회원가입에 성공했습니다.");
			location.href = "/cssTest";
		})
  		
	})
  
  </script>
  
  
  <body class="animsition page-register-v3 layout-full">

    <!-- Page -->
    <div class="page vertical-align text-center" data-animsition-in="fade-in" data-animsition-out="fade-out">>
      <div class="page-content vertical-align-middle">
        <div class="panel">
          <div class="panel-body">
            <div class="brand">
              <img class="brand-img" src="resources/global//images/logo-colored.png" alt="...">
              <h2 class="brand-text font-size-18">Remark</h2>
            </div>
            <form method="post" action="#" autocomplete="off">
              <div class="form-group form-material floating" data-plugin="formMaterial">
                <input type="text" class="form-control" name="name" id = "name"/>
                <label class="floating-label">Full Name</label>
              </div>
              <div class="form-group form-material floating" data-plugin="formMaterial">
                <input type="email" class="form-control" name="id" id = "userId" />
                <label class="floating-label">ID</label>
              </div>
              <div class="form-group form-material floating" data-plugin="formMaterial">
                <input type="password" class="form-control" name="password" id = "password"/>
                <label class="floating-label">Password</label>
              </div>
              <div class="form-group form-material floating" data-plugin="formMaterial">
                <input type="password" class="form-control" name="PasswordCheck" id = "PasswordCheck" />
                <label class="floating-label">Re-enter Password</label>
              </div>

              <button type="button" class="btn btn-primary btn-block btn-lg mt-40" id = "signUp">Sign up</button>
            </form>
            <p>Have account already? Please go to <a href="login-v3.html">Sign In</a></p>
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
    <script>Config.set('assets', '../../assets');</script>
    
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
