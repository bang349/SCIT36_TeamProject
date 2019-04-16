<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js css-menubar" >
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="bootstrap material admin template">
    <meta name="author" content="">
    
    <title>Blank | Remark Material Admin Template</title>
 
   	<link rel="apple-touch-icon" href="resources/images/apple-touch-icon.png">
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
        <link rel="stylesheet" href="resources/global/vendor/jquery-selective/jquery-selective.css">
        <link rel="stylesheet" href="resources/examples/css/apps/projects.css">
    
    
    <!-- Fonts -->
    <link rel="stylesheet" href="resources/global/fonts/material-design/material-design.min.css">
    <link rel="stylesheet" href="resources/global/fonts/brand-icons/brand-icons.min.css">
    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,300italic'>
    
    <!-- fireBase -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://www.gstatic.com/firebasejs/5.8.6/firebase.js"></script>
    <script src = "https://www.gstatic.com/firebasejs/5.8.6/firebase-app.js"></script>
    <script src = "https://www.gstatic.com/firebasejs/5.8.6/firebase-database.js"></script>
   
   
 	<!-- myJavascript -->
	<script src = "resources/script/projectDetailed.js"></script>

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
  
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
    
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
    
    
    <!-- Scripts -->
    <script src="resources/global/vendor/breakpoints/breakpoints.js"></script>
    <script>
      Breakpoints();
    </script>
  </head>
  
  <script>
 	$(function()
 	{
 		//============================== 전역변수 ==============================
 		//프로젝트 시퀀스
 		let projectSequence; 
 		//모든 회원
 		let allMember;
 		//프로젝트에 참가하기 위한 멤버
 		let selectedMember;
 		
 		//페이징을 위한 프로젝트의 갯수를 저장
 		let totalProject;
	
 		//============================== 함수 ==============================
		 	
 		database.ref("Prokan/Member").on("value", function(snapshot)
 		{
			allMember = JSON.parse(JSON.stringify(snapshot));
			let allMemberId = [];
			allMemberContent = "";
 			let memberTemp = {};
			
			 for(index in allMember)
			{
				memberTemp = 
				{
					id : index,
					name : allMember[index].name
				}; 
				allMemberId.push(memberTemp);
			}  
 			sessionStorage.setItem("allMemberId", JSON.stringify(allMemberId));
 		 	let tmp = sessionStorage.allMemberId;
 		})
		
 		database.ref("Prokan/Project").on('value', function(snapshot)
 		{
			let allProject = JSON.parse(JSON.stringify(snapshot));
 			let viewProject = '';
 			let buttonIndex = "";
 			let createProjectButton = "";
 			//페이징 처리를 위한 Array
 			let pagingAllProject = [];
 			
 			totalProject = 0;

 			for(index in allProject)
 			{	
 				if(allProject[index].projectManager == "admin")
 				{
 					let tempContent = "";
 					viewProject = viewProject + '<li  class = "animation-scale-up" style = "animation-fill-mode : backwards; animation-duration: 250ms; animation-delay : 0ms;">'
 					viewProject = viewProject + '	<div class="panel">'
 					viewProject = viewProject + '	<figure class="overlay overlay-hover animation-hover"><img class="caption-figure overlay-figure" src="resources/global/photos/placeholder.png">'
 					viewProject = viewProject + '	<figcaption class="overlay-panel overlay-background overlay-fade text-center vertical-align">'
 					viewProject = viewProject + '		<div class="btn-group">'
 					viewProject = viewProject + '			<div class="dropdown float-left">'
 					viewProject = viewProject + '				<button type="button" class="btn btn-icon btn-pure btn-default" title="Setting"><i class="icon md-settings" aria-hidden="true"></i></button>'
 					viewProject = viewProject + '				<div class="dropdown-menu" role="menu">'
 					viewProject = viewProject + '					<a class="dropdown-item" href="">Copy</a>'
 					viewProject = viewProject + '					<a class="dropdown-item" href="">Rename</a>'
 					viewProject = viewProject + '				</div>'
 					viewProject = viewProject + '			</div>'
 					viewProject = viewProject + '			<button type="button" class="btn btn-icon btn-pure btn-default" title="Delete"'
 					viewProject = viewProject + '				data-tag="project-delete"><i class="icon md-delete" aria-hidden="true"></i></button>'
 					viewProject = viewProject + '		</div>'
 					viewProject = viewProject + '		<button type="button" class="btn btn-inverse project-button" value = "' + index + '" >View Project</button>'
 					viewProject = viewProject + '	</figcaption>'
 					viewProject = viewProject + '	</figure>'
 					viewProject = viewProject + '	<div class="time float-right">' + allProject[index].createdDate + '</div>'
 					viewProject = viewProject + '	<div class="text-truncate">' + allProject[index].projectName +'</div>'
  					viewProject = viewProject + '	</div>'
 					viewProject = viewProject + '</li>'
 					
 					tempContent = viewProject;
 					totalProject = totalProject +1;
 					pagingAllProject.push(tempContent);
 					
 				}	
 			} 
 		 
			createProjectButton = createProjectButton + '	<div class="modal-dialog modal-simple">'
			createProjectButton = createProjectButton + '		<div class="modal-content">'
			createProjectButton = createProjectButton + '			<div class="modal-header">'
			createProjectButton = createProjectButton + '				<button type="button" class="close" aria-hidden="true" data-dismiss="modal">×</button>'
			createProjectButton = createProjectButton + '				<h4 class="modal-title">Create New Project</h4>'
			createProjectButton = createProjectButton + '			</div>'
			createProjectButton = createProjectButton + '			<div class="modal-body">'
			createProjectButton = createProjectButton + '				<div class="form-group">'
			createProjectButton = createProjectButton + '					<label class="form-control-label mb-15"  for="name">Project name:</label>'
			createProjectButton = createProjectButton + '					<input type="text" class="form-control" id="projectName" name="name" placeholder="Project name">'
			createProjectButton = createProjectButton + '				</div>'
			createProjectButton = createProjectButton + '				<div class="form-group">'
			createProjectButton = createProjectButton + '					<label class="form-control-label mb-15" for="name">Project description:</label>'
			createProjectButton = createProjectButton + '					<textarea class="form-control mb-sm" id = "projectDescription" placeholder="Project description." rows="4"></textarea>'
			createProjectButton = createProjectButton + '				</div>'
			createProjectButton = createProjectButton + '				<div class="form-group">'
			createProjectButton = createProjectButton + '					<label class="form-control-label mb-15" for="name">Choice people to your project:</label>'
			createProjectButton = createProjectButton + '					<select multiple="multiple" id = "memberSelect" class="plugin-selective"></select>'
			createProjectButton = createProjectButton + '				</div> '
			createProjectButton = createProjectButton + '			</div>'
			createProjectButton = createProjectButton + '			<div class="modal-footer text-right">'
			createProjectButton = createProjectButton + '				<button class="btn btn-primary" data-dismiss="modal" type="button" id = "createProjectButton">Creat</button>'
			createProjectButton = createProjectButton + '				<a class="btn btn-sm btn-white btn-pure" data-dismiss="modal" href="javascript:void(0)">Cancel</a>'
			createProjectButton = createProjectButton + '			</div>'
			createProjectButton = createProjectButton + '		</div>'
			createProjectButton = createProjectButton + '	</div>'
			
			let addButton = '';
			addButton = addButton + '<div class="site-action" data-target="#addProjectForm" data-toggle="modal" data-plugin="actionBtn">'
			addButton = addButton + '	<button type="button" data-action="add" class="site-action-toggle btn-raised btn btn-success btn-floating">'
			addButton = addButton + '		<i class="icon md-plus" aria-hidden="true"></i>'
			addButton = addButton + '	</button>'
			addButton = addButton + '</div>'
			
			
			$("#create").html(addButton);
 			$("#addProjectForm").html(createProjectButton);
 			$("#allProject").html(viewProject);

 			$(".project-button").on("click", function()
 			{
 				let element = $(this).val();
 				sessionStorage.setItem("projectIndex", element);
 				/* alert($(".btn btn-inverse project-button")); */
 				
			    location.href = "/TeamProject/projectDetailed";
			    
			})

 		})

		database.ref("Prokan/Sequence/projectSequence").on('value', function(snapshot)
		{
			projectSequence = snapshot.val(); 		
		});
 	
 	
 	 	$("#createProjectButton").on("click", function()
 		{
 	 	 	let projectName = $("#projectName").val();
 	 		let projectDescription = $("#projectDescription").val();
 			let memberSelect = $("#memberSelect").val();

 			let currentDate = new Date();
		 	let dd = currentDate.getDate();
		 	let mm = currentDate.getMonth()+1;
		 	let yyyy = currentDate.getFullYear();
		 	curruntDate = mm + '/' + dd + '/' + yyyy;
 			
 			let Project =
 	 		{
 				projectManager : "manager",
 	 			projectName : projectName,
 				projectDescription : projectDescription,
 				projectMember : memberSelect,
 				createdDate : curruntDate
 	 		};
 			
 			//database.ref("Prokan/Member/"+userId).set(Member);
 	 		database.ref("Prokan/Project/" + projectSequence).set(Project);
 			projectSequence = projectSequence + 1;
 			database.ref("Prokan/Sequence/projectSequence").set(projectSequence);
 		})
 	})

  </script>
  
  <body class="animsition app-projects">
    <nav class="site-navbar navbar navbar-default navbar-inverse navbar-fixed-top navbar-mega"
      role="navigation">
    
      <div class="navbar-header">
        <button type="button" class="navbar-toggler hamburger hamburger-close navbar-toggler-left hided"
          data-toggle="menubar">
          <span class="sr-only">Toggle navigation</span>
          <span class="hamburger-bar"></span>
        </button>
        <button type="button" class="navbar-toggler collapsed" data-target="#site-navbar-collapse"
          data-toggle="collapse">
          <i class="icon md-more" aria-hidden="true"></i>
        </button>
        <div class="navbar-brand navbar-brand-center site-gridmenu-toggle" data-toggle="gridmenu">
          <img class="navbar-brand-logo" src="resources/assets/images/logo.png" title="Remark">
          <span class="navbar-brand-text hidden-xs-down"> Remark</span>
        </div>
        <button type="button" class="navbar-toggler collapsed" data-target="#site-navbar-search"
          data-toggle="collapse">
          <span class="sr-only">Toggle Search</span>
          <i class="icon md-search" aria-hidden="true"></i>
        </button>
      </div>
    
      <div class="navbar-container container-fluid">
        <!-- Navbar Collapse -->
        <div class="collapse navbar-collapse navbar-collapse-toolbar" id="site-navbar-collapse">
          <!-- Navbar Toolbar -->
          <ul class="nav navbar-toolbar">
            <li class="nav-item hidden-float" id="toggleMenubar">
              <a class="nav-link" data-toggle="menubar" href="#" role="button">
                <i class="icon hamburger hamburger-arrow-left">
                  <span class="sr-only">Toggle menubar</span>
                  <span class="hamburger-bar"></span>
                </i>
              </a>
            </li>
            <li class="nav-item hidden-sm-down" id="toggleFullscreen">
              <a class="nav-link icon icon-fullscreen" data-toggle="fullscreen" href="#" role="button">
                <span class="sr-only">Toggle fullscreen</span>
              </a>
            </li>
            <li class="nav-item hidden-float">
              <a class="nav-link icon md-search" data-toggle="collapse" href="#" data-target="#site-navbar-search"
                role="button">
                <span class="sr-only">Toggle Search</span>
              </a>
            </li>
            <li class="nav-item dropdown dropdown-fw dropdown-mega">
              <a class="nav-link" data-toggle="dropdown" href="#" aria-expanded="false" data-animation="fade"
                role="button">Mega <i class="icon md-chevron-down" aria-hidden="true"></i></a>
              <div class="dropdown-menu" role="menu">
                <div class="mega-content">
                  <div class="row">
                    <div class="col-md-4">
                      <h5>UI Kit</h5>
                      <ul class="blocks-2">
                        <li class="mega-menu m-0">
                          <ul class="list-icons">
                            <li><i class="md-chevron-right" aria-hidden="true"></i><a href="../../advanced/animation.html">Animation</a></li>
                            <li><i class="md-chevron-right" aria-hidden="true"></i><a href="../../uikit/buttons.html">Buttons</a></li>
                            <li><i class="md-chevron-right" aria-hidden="true"></i><a href="../../uikit/colors.html">Colors</a></li>
                            <li><i class="md-chevron-right" aria-hidden="true"></i><a href="../../uikit/dropdowns.html">Dropdowns</a></li>
                            <li><i class="md-chevron-right" aria-hidden="true"></i><a href="../../uikit/icons.html">Icons</a></li>
                            <li><i class="md-chevron-right" aria-hidden="true"></i><a href="../../advanced/lightbox.html">Lightbox</a></li>
                          </ul>
                        </li>
                        <li class="mega-menu m-0">
                          <ul class="list-icons">
                            <li><i class="md-chevron-right" aria-hidden="true"></i><a href="../../uikit/modals.html">Modals</a></li>
                            <li><i class="md-chevron-right" aria-hidden="true"></i><a href="../../uikit/panel-structure.html">Panels</a></li>
                            <li><i class="md-chevron-right" aria-hidden="true"></i><a href="../../structure/overlay.html">Overlay</a></li>
                            <li><i class="md-chevron-right" aria-hidden="true"></i><a href="../../uikit/tooltip-popover.html ">Tooltips</a></li>
                            <li><i class="md-chevron-right" aria-hidden="true"></i><a href="../../advanced/scrollable.html">Scrollable</a></li>
                            <li><i class="md-chevron-right" aria-hidden="true"></i><a href="../../uikit/typography.html">Typography</a></li>
                          </ul>
                        </li>
                      </ul>
                    </div>
                    <div class="col-md-4">
                      <h5>Media
                        <span class="badge badge-pill badge-success">4</span>
                      </h5>
                      <ul class="blocks-3">
                        <li>
                          <a class="thumbnail m-0" href="javascript:void(0)">
                            <img class="w-full" src="resources/global/photos/placeholder.png" alt="..." />
                          </a>
                        </li>
                        <li>
                          <a class="thumbnail m-0" href="javascript:void(0)">
                            <img class="w-full" src="resources/global/photos/placeholder.png" alt="..." />
                          </a>
                        </li>
                        <li>
                          <a class="thumbnail m-0" href="javascript:void(0)">
                            <img class="w-full" src="resources/global/photos/placeholder.png" alt="..." />
                          </a>
                        </li>
                        <li>
                          <a class="thumbnail m-0" href="javascript:void(0)">
                            <img class="w-full" src="resources/global/photos/placeholder.png" alt="..." />
                          </a>
                        </li>
                        <li>
                          <a class="thumbnail m-0" href="javascript:void(0)">
                            <img class="w-full" src="resources/global/photos/placeholder.png" alt="..." />
                          </a>
                        </li>
                        <li>
                          <a class="thumbnail m-0" href="javascript:void(0)">
                            <img class="w-full" src="resources/global/photos/placeholder.png" alt="..." />
                          </a>
                        </li>
                      </ul>
                    </div>
                    <div class="col-md-4">
                      <h5 class="mb-0">Accordion</h5>
                      <!-- Accordion -->
                      <div class="panel-group panel-group-simple" id="siteMegaAccordion" aria-multiselectable="true"
                        role="tablist">
                        <div class="panel">
                          <div class="panel-heading" id="siteMegaAccordionHeadingOne" role="tab">
                            <a class="panel-title" data-toggle="collapse" href="#siteMegaCollapseOne" data-parent="#siteMegaAccordion"
                              aria-expanded="false" aria-controls="siteMegaCollapseOne">
                              Collapsible Group Item #1
                            </a>
                          </div>
                          <div class="panel-collapse collapse" id="siteMegaCollapseOne" aria-labelledby="siteMegaAccordionHeadingOne"
                            role="tabpanel">
                            <div class="panel-body">
                              De moveat laudatur vestra parum doloribus labitur sentire partes, eripuit praesenti
                              congressus ostendit alienae, voluptati ornateque accusamus
                              clamat reperietur convicia albucius.
                            </div>
                          </div>
                        </div>
                        <div class="panel">
                          <div class="panel-heading" id="siteMegaAccordionHeadingTwo" role="tab">
                            <a class="panel-title collapsed" data-toggle="collapse" href="#siteMegaCollapseTwo"
                              data-parent="#siteMegaAccordion" aria-expanded="false"
                              aria-controls="siteMegaCollapseTwo">
                              Collapsible Group Item #2
                            </a>
                          </div>
                          <div class="panel-collapse collapse" id="siteMegaCollapseTwo" aria-labelledby="siteMegaAccordionHeadingTwo"
                            role="tabpanel">
                            <div class="panel-body">
                              Praestabiliorem. Pellat excruciant legantur ullum leniter vacare foris voluptate
                              loco ignavi, credo videretur multoque choro fatemur mortis
                              animus adoptionem, bello statuat expediunt naturales.
                            </div>
                          </div>
                        </div>
    
                        <div class="panel">
                          <div class="panel-heading" id="siteMegaAccordionHeadingThree" role="tab">
                            <a class="panel-title collapsed" data-toggle="collapse" href="#siteMegaCollapseThree"
                              data-parent="#siteMegaAccordion" aria-expanded="false"
                              aria-controls="siteMegaCollapseThree">
                              Collapsible Group Item #3
                            </a>
                          </div>
                          <div class="panel-collapse collapse" id="siteMegaCollapseThree" aria-labelledby="siteMegaAccordionHeadingThree"
                            role="tabpanel">
                            <div class="panel-body">
                              Horum, antiquitate perciperet d conspectum locus obruamus animumque perspici probabis
                              suscipere. Desiderat magnum, contenta poena desiderant
                              concederetur menandri damna disputandum corporum.
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- End Accordion -->
                    </div>
                  </div>
                </div>
              </div>
            </li>
          </ul>
          <!-- End Navbar Toolbar -->
    
          <!-- Navbar Toolbar Right -->
          <ul class="nav navbar-toolbar navbar-right navbar-toolbar-right">
            <li class="nav-item dropdown">
              <a class="nav-link" data-toggle="dropdown" href="javascript:void(0)" data-animation="scale-up"
                aria-expanded="false" role="button">
                <span class="flag-icon flag-icon-us"></span>
              </a>
              <div class="dropdown-menu" role="menu">
                <a class="dropdown-item" href="javascript:void(0)" role="menuitem">
                  <span class="flag-icon flag-icon-gb"></span> English</a>
                <a class="dropdown-item" href="javascript:void(0)" role="menuitem">
                  <span class="flag-icon flag-icon-fr"></span> French</a>
                <a class="dropdown-item" href="javascript:void(0)" role="menuitem">
                  <span class="flag-icon flag-icon-cn"></span> Chinese</a>
                <a class="dropdown-item" href="javascript:void(0)" role="menuitem">
                  <span class="flag-icon flag-icon-de"></span> German</a>
                <a class="dropdown-item" href="javascript:void(0)" role="menuitem">
                  <span class="flag-icon flag-icon-nl"></span> Dutch</a>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link navbar-avatar" data-toggle="dropdown" href="#" aria-expanded="false"
                data-animation="scale-up" role="button">
                <span class="avatar avatar-online">
                  <img src="resources/global/portraits/5.jpg" alt="...">
                  <i></i>
                </span>
              </a>
              <div class="dropdown-menu" role="menu">
                <a class="dropdown-item" href="javascript:void(0)" role="menuitem"><i class="icon md-account" aria-hidden="true"></i> Profile</a>
                <a class="dropdown-item" href="javascript:void(0)" role="menuitem"><i class="icon md-card" aria-hidden="true"></i> Billing</a>
                <a class="dropdown-item" href="javascript:void(0)" role="menuitem"><i class="icon md-settings" aria-hidden="true"></i> Settings</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="javascript:void(0)" role="menuitem"><i class="icon md-power" aria-hidden="true"></i> Logout</a>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link" data-toggle="dropdown" href="javascript:void(0)" title="Notifications"
                aria-expanded="false" data-animation="scale-up" role="button">
                <i class="icon md-notifications" aria-hidden="true"></i>
                <span class="badge badge-pill badge-danger up">5</span>
              </a>
              <div class="dropdown-menu dropdown-menu-right dropdown-menu-media" role="menu">
                <div class="dropdown-menu-header">
                  <h5>NOTIFICATIONS</h5>
                  <span class="badge badge-round badge-danger">New 5</span>
                </div>
    
                <div class="list-group">
                  <div data-role="container">
                    <div data-role="content">
                      <a class="list-group-item dropdown-item" href="javascript:void(0)" role="menuitem">
                        <div class="media">
                          <div class="pr-10">
                            <i class="icon md-receipt bg-red-600 white icon-circle" aria-hidden="true"></i>
                          </div>
                          <div class="media-body">
                            <h6 class="media-heading">A new order has been placed</h6>
                            <time class="media-meta" datetime="2017-06-12T20:50:48+08:00">5 hours ago</time>
                          </div>
                        </div>
                      </a>
                      <a class="list-group-item dropdown-item" href="javascript:void(0)" role="menuitem">
                        <div class="media">
                          <div class="pr-10">
                            <i class="icon md-account bg-green-600 white icon-circle" aria-hidden="true"></i>
                          </div>
                          <div class="media-body">
                            <h6 class="media-heading">Completed the task</h6>
                            <time class="media-meta" datetime="2017-06-11T18:29:20+08:00">2 days ago</time>
                          </div>
                        </div>
                      </a>
                      <a class="list-group-item dropdown-item" href="javascript:void(0)" role="menuitem">
                        <div class="media">
                          <div class="pr-10">
                            <i class="icon md-settings bg-red-600 white icon-circle" aria-hidden="true"></i>
                          </div>
                          <div class="media-body">
                            <h6 class="media-heading">Settings updated</h6>
                            <time class="media-meta" datetime="2017-06-11T14:05:00+08:00">2 days ago</time>
                          </div>
                        </div>
                      </a>
                      <a class="list-group-item dropdown-item" href="javascript:void(0)" role="menuitem">
                        <div class="media">
                          <div class="pr-10">
                            <i class="icon md-calendar bg-blue-600 white icon-circle" aria-hidden="true"></i>
                          </div>
                          <div class="media-body">
                            <h6 class="media-heading">Event started</h6>
                            <time class="media-meta" datetime="2017-06-10T13:50:18+08:00">3 days ago</time>
                          </div>
                        </div>
                      </a>
                      <a class="list-group-item dropdown-item" href="javascript:void(0)" role="menuitem">
                        <div class="media">
                          <div class="pr-10">
                            <i class="icon md-comment bg-orange-600 white icon-circle" aria-hidden="true"></i>
                          </div>
                          <div class="media-body">
                            <h6 class="media-heading">Message received</h6>
                            <time class="media-meta" datetime="2017-06-10T12:34:48+08:00">3 days ago</time>
                          </div>
                        </div>
                      </a>
                    </div>
                  </div>
                </div>
                <div class="dropdown-menu-footer">
                  <a class="dropdown-menu-footer-btn" href="javascript:void(0)" role="button">
                    <i class="icon md-settings" aria-hidden="true"></i>
                  </a>
                  <a class="dropdown-item" href="javascript:void(0)" role="menuitem">
                    All notifications
                  </a>
                </div>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link" data-toggle="dropdown" href="javascript:void(0)" title="Messages"
                aria-expanded="false" data-animation="scale-up" role="button">
                <i class="icon md-email" aria-hidden="true"></i>
                <span class="badge badge-pill badge-info up">3</span>
              </a>
              <div class="dropdown-menu dropdown-menu-right dropdown-menu-media" role="menu">
                <div class="dropdown-menu-header" role="presentation">
                  <h5>MESSAGES</h5>
                  <span class="badge badge-round badge-info">New 3</span>
                </div>
    
                <div class="list-group" role="presentation">
                  <div data-role="container">
                    <div data-role="content">
                      <a class="list-group-item dropdown-item" href="javascript:void(0)" role="menuitem">
                        <div class="media">
                          <div class="pr-10">
                            <span class="avatar avatar-sm avatar-online">
                              <img src="resources/global/portraits/2.jpg" alt="..." />
                              <i></i>
                            </span>
                          </div>
                          <div class="media-body">
                            <h6 class="media-heading">Mary Adams</h6>
                            <div class="media-meta">
                              <time datetime="2017-06-17T20:22:05+08:00">30 minutes ago</time>
                            </div>
                            <div class="media-detail">Anyways, i would like just do it</div>
                          </div>
                        </div>
                      </a>
                      <a class="list-group-item dropdown-item" href="javascript:void(0)" role="menuitem">
                        <div class="media">
                          <div class="pr-10">
                            <span class="avatar avatar-sm avatar-off">
                              <img src="resources/global/portraits/3.jpg" alt="..." />
                              <i></i>
                            </span>
                          </div>
                          <div class="media-body">
                            <h6 class="media-heading">Caleb Richards</h6>
                            <div class="media-meta">
                              <time datetime="2017-06-17T12:30:30+08:00">12 hours ago</time>
                            </div>
                            <div class="media-detail">I checheck the document. But there seems</div>
                          </div>
                        </div>
                      </a>
                      <a class="list-group-item dropdown-item" href="javascript:void(0)" role="menuitem">
                        <div class="media">
                          <div class="pr-10">
                            <span class="avatar avatar-sm avatar-busy">
                              <img src="resources/global/portraits/4.jpg" alt="..." />
                              <i></i>
                            </span>
                          </div>
                          <div class="media-body">
                            <h6 class="media-heading">June Lane</h6>
                            <div class="media-meta">
                              <time datetime="2017-06-16T18:38:40+08:00">2 days ago</time>
                            </div>
                            <div class="media-detail">Lorem ipsum Id consectetur et minim</div>
                          </div>
                        </div>
                      </a>
                      <a class="list-group-item dropdown-item" href="javascript:void(0)" role="menuitem">
                        <div class="media">
                          <div class="pr-10">
                            <span class="avatar avatar-sm avatar-away">
                              <img src="resources/global/portraits/5.jpg" alt="..." />
                              <i></i>
                            </span>
                          </div>
                          <div class="media-body">
                            <h6 class="media-heading">Edward Fletcher</h6>
                            <div class="media-meta">
                              <time datetime="2017-06-15T20:34:48+08:00">3 days ago</time>
                            </div>
                            <div class="media-detail">Dolor et irure cupidatat commodo nostrud nostrud.</div>
                          </div>
                        </div>
                      </a>
                    </div>
                  </div>
                </div>
                <div class="dropdown-menu-footer" role="presentation">
                  <a class="dropdown-menu-footer-btn" href="javascript:void(0)" role="button">
                    <i class="icon md-settings" aria-hidden="true"></i>
                  </a>
                  <a class="dropdown-item" href="javascript:void(0)" role="menuitem">
                    See all messages
                  </a>
                </div>
              </div>
            </li>
            <li class="nav-item" id="toggleChat">
              <a class="nav-link" data-toggle="site-sidebar" href="javascript:void(0)" title="Chat"
                data-url="../../site-sidebar.tpl">
                <i class="icon md-comment" aria-hidden="true"></i>
              </a>
            </li>
          </ul>
          <!-- End Navbar Toolbar Right -->
        </div>
        <!-- End Navbar Collapse -->
    
        <!-- Site Navbar Seach -->
        <div class="collapse navbar-search-overlap" id="site-navbar-search">
          <form role="search">
            <div class="form-group">
              <div class="input-search">
                <i class="input-search-icon md-search" aria-hidden="true"></i>
                <input type="text" class="form-control" name="site-search" placeholder="Search...">
                <button type="button" class="input-search-close icon md-close" data-target="#site-navbar-search"
                  data-toggle="collapse" aria-label="Close"></button>
              </div>
            </div>
          </form>
        </div>
        <!-- End Site Navbar Seach -->
      </div>
    </nav>    <div class="site-menubar">
      <div class="site-menubar-body">
        <div>
          <div>
            <ul class="site-menu" data-plugin="menu">
              <li class="site-menu-item">
                <a class="animsition-link" href="../../index.html">
                        <i class="site-menu-icon md-view-dashboard" aria-hidden="true"></i>
                        <span class="site-menu-title">Dashboard</span>
                    </a>
              </li>
              <li class="site-menu-item has-sub">
                <a href="javascript:void(0)">
                        <i class="site-menu-icon md-view-compact" aria-hidden="true"></i>
                        <span class="site-menu-title">Layouts</span>
                    </a>
                <ul class="site-menu-sub">
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../layouts/menu-collapsed.html">
                      <span class="site-menu-title">Menu Collapsed</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../layouts/grids.html">
                      <span class="site-menu-title">Grid Scaffolding</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../layouts/layout-grid.html">
                      <span class="site-menu-title">Layout Grid</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../layouts/headers.html">
                      <span class="site-menu-title">Different Headers</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../layouts/panel-transition.html">
                      <span class="site-menu-title">Panel Transition</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../layouts/boxed.html">
                      <span class="site-menu-title">Boxed Layout</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../layouts/two-columns.html">
                      <span class="site-menu-title">Two Columns</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../layouts/bordered-header.html">
                      <span class="site-menu-title">Bordered Header</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../layouts/menubar-flipped.html">
                      <span class="site-menu-title">Menubar Flipped</span>
                    </a>
                  </li>
                  <li class="site-menu-item has-sub">
                    <a href="javascript:void(0)">
                      <span class="site-menu-title">Page Aside</span>
                      <span class="site-menu-arrow"></span>
                    </a>
                    <ul class="site-menu-sub">
                      <li class="site-menu-item">
                        <a class="animsition-link" href="../../layouts/aside-left-static.html">
                          <span class="site-menu-title">Left Static</span>
                        </a>
                      </li>
                      <li class="site-menu-item">
                        <a class="animsition-link" href="../../layouts/aside-right-static.html">
                          <span class="site-menu-title">Right Static</span>
                        </a>
                      </li>
                      <li class="site-menu-item">
                        <a class="animsition-link" href="../../layouts/aside-left-fixed.html">
                          <span class="site-menu-title">Left Fixed</span>
                        </a>
                      </li>
                      <li class="site-menu-item">
                        <a class="animsition-link" href="../../layouts/aside-right-fixed.html">
                          <span class="site-menu-title">Right Fixed</span>
                        </a>
                      </li>
                    </ul>
                  </li>
                </ul>
              </li>
              <li class="site-menu-item has-sub">
                <a href="javascript:void(0)">
                        <i class="site-menu-icon md-google-pages" aria-hidden="true"></i>
                        <span class="site-menu-title">Pages</span>
                    </a>
                <ul class="site-menu-sub">
                  <li class="site-menu-item has-sub">
                    <a href="javascript:void(0)">
                      <span class="site-menu-title">Errors</span>
                      <span class="site-menu-arrow"></span>
                    </a>
                    <ul class="site-menu-sub">
                      <li class="site-menu-item">
                        <a class="animsition-link" href="../../pages/error-400.html">
                          <span class="site-menu-title">400</span>
                        </a>
                      </li>
                      <li class="site-menu-item">
                        <a class="animsition-link" href="../../pages/error-403.html">
                          <span class="site-menu-title">403</span>
                        </a>
                      </li>
                      <li class="site-menu-item">
                        <a class="animsition-link" href="../../pages/error-404.html">
                          <span class="site-menu-title">404</span>
                        </a>
                      </li>
                      <li class="site-menu-item">
                        <a class="animsition-link" href="../../pages/error-500.html">
                          <span class="site-menu-title">500</span>
                        </a>
                      </li>
                      <li class="site-menu-item">
                        <a class="animsition-link" href="../../pages/error-503.html">
                          <span class="site-menu-title">503</span>
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../pages/faq.html">
                      <span class="site-menu-title">FAQ</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../pages/gallery.html">
                      <span class="site-menu-title">Gallery</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../pages/gallery-grid.html">
                      <span class="site-menu-title">Gallery Grid</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../pages/search-result.html">
                      <span class="site-menu-title">Search Result</span>
                    </a>
                  </li>
                  <li class="site-menu-item has-sub">
                    <a href="javascript:void(0)">
                      <span class="site-menu-title">Maps</span>
                      <span class="site-menu-arrow"></span>
                    </a>
                    <ul class="site-menu-sub">
                      <li class="site-menu-item">
                        <a class="animsition-link" href="../../pages/map-google.html">
                          <span class="site-menu-title">Google Maps</span>
                        </a>
                      </li>
                      <li class="site-menu-item">
                        <a class="animsition-link" href="../../pages/map-vector.html">
                          <span class="site-menu-title">Vector Maps</span>
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../pages/maintenance.html">
                      <span class="site-menu-title">Maintenance</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../pages/forgot-password.html">
                      <span class="site-menu-title">Forgot Password</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../pages/lockscreen.html">
                      <span class="site-menu-title">Lockscreen</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../pages/login.html">
                      <span class="site-menu-title">Login</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../pages/register.html">
                      <span class="site-menu-title">Register</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../pages/login-v2.html">
                      <span class="site-menu-title">Login V2</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../pages/register-v2.html">
                      <span class="site-menu-title">Register V2</span>
                      <div class="site-menu-label">
                        <span class="badge badge-info badge-round">new</span>
                      </div>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../pages/login-v3.html">
                      <span class="site-menu-title">Login V3</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../pages/register-v3.html">
                      <span class="site-menu-title">Register V3</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../pages/user.html">
                      <span class="site-menu-title">User List</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../pages/invoice.html">
                      <span class="site-menu-title">Invoice</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../pages/blank.html">
                      <span class="site-menu-title">Blank Page</span>
                    </a>
                  </li>
                  <li class="site-menu-item has-sub">
                    <a href="javascript:void(0)">
                      <span class="site-menu-title">Email</span>
                      <span class="site-menu-arrow"></span>
                    </a>
                    <ul class="site-menu-sub">
                      <li class="site-menu-item">
                        <a class="animsition-link" href="../../pages/email-articles.html">
                          <span class="site-menu-title">Articles</span>
                        </a>
                      </li>
                      <li class="site-menu-item">
                        <a class="animsition-link" href="../../pages/email-welcome.html">
                          <span class="site-menu-title">Welcome</span>
                        </a>
                      </li>
                      <li class="site-menu-item">
                        <a class="animsition-link" href="../../pages/email-post.html">
                          <span class="site-menu-title">Post</span>
                        </a>
                      </li>
                      <li class="site-menu-item">
                        <a class="animsition-link" href="../../pages/email-thumbnail.html">
                          <span class="site-menu-title">Thumbnail</span>
                        </a>
                      </li>
                      <li class="site-menu-item">
                        <a class="animsition-link" href="../../pages/email-news.html">
                          <span class="site-menu-title">News</span>
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../pages/code-editor.html">
                      <span class="site-menu-title">Code Editor</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../pages/profile.html">
                      <span class="site-menu-title">Profile</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../pages/profile-v2.html">
                      <span class="site-menu-title">Profile V2</span>
                      <div class="site-menu-label">
                        <span class="badge badge-info badge-round">new</span>
                      </div>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../pages/profile-v3.html">
                      <span class="site-menu-title">Profile V3</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../pages/site-map.html">
                      <span class="site-menu-title">Sitemap</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../pages/project.html">
                      <span class="site-menu-title">Project</span>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="site-menu-item has-sub">
                <a href="javascript:void(0)">
                        <i class="site-menu-icon md-palette" aria-hidden="true"></i>
                        <span class="site-menu-title">Basic UI</span>
                    </a>
                <ul class="site-menu-sub">
                  <li class="site-menu-item has-sub">
                    <a href="javascript:void(0)">
                      <span class="site-menu-title">Panel</span>
                      <span class="site-menu-arrow"></span>
                    </a>
                    <ul class="site-menu-sub">
                      <li class="site-menu-item">
                        <a class="animsition-link" href="../../uikit/panel-structure.html">
                          <span class="site-menu-title">Panel Structure</span>
                        </a>
                      </li>
                      <li class="site-menu-item">
                        <a class="animsition-link" href="../../uikit/panel-actions.html">
                          <span class="site-menu-title">Panel Actions</span>
                        </a>
                      </li>
                      <li class="site-menu-item">
                        <a class="animsition-link" href="../../uikit/panel-portlets.html">
                          <span class="site-menu-title">Panel Portlets</span>
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../uikit/buttons.html">
                      <span class="site-menu-title">Buttons</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../uikit/cards.html">
                      <span class="site-menu-title">Cards</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../uikit/dropdowns.html">
                      <span class="site-menu-title">Dropdowns</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../uikit/icons.html">
                      <span class="site-menu-title">Icons</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../uikit/list.html">
                      <span class="site-menu-title">List</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../uikit/tooltip-popover.html">
                      <span class="site-menu-title">Tooltip &amp; Popover</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../uikit/modals.html">
                      <span class="site-menu-title">Modals</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../uikit/tabs-accordions.html">
                      <span class="site-menu-title">Tabs &amp; Accordions</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../uikit/images.html">
                      <span class="site-menu-title">Images</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../uikit/badges.html">
                      <span class="site-menu-title">Badges</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../uikit/progress-bars.html">
                      <span class="site-menu-title">Progress Bars</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../uikit/carousel.html">
                      <span class="site-menu-title">Carousel</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../uikit/typography.html">
                      <span class="site-menu-title">Typography</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../uikit/colors.html">
                      <span class="site-menu-title">Colors</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../uikit/utilities.html">
                      <span class="site-menu-title">Utilties</span>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="site-menu-item has-sub">
                <a href="javascript:void(0)">
                        <i class="site-menu-icon md-format-color-fill" aria-hidden="true"></i>
                        <span class="site-menu-title">Advanced UI</span>
                    </a>
                <ul class="site-menu-sub">
                  <li class="site-menu-item hidden-sm-down site-tour-trigger">
                    <a href="javascript:void(0)">
                      <span class="site-menu-title">Tour</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../advanced/animation.html">
                      <span class="site-menu-title">Animation</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../advanced/highlight.html">
                      <span class="site-menu-title">Highlight</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../advanced/lightbox.html">
                      <span class="site-menu-title">Lightbox</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../advanced/scrollable.html">
                      <span class="site-menu-title">Scrollable</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../advanced/rating.html">
                      <span class="site-menu-title">Rating</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../advanced/context-menu.html">
                      <span class="site-menu-title">Context Menu</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../advanced/alertify.html">
                      <span class="site-menu-title">Alertify</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../advanced/masonry.html">
                      <span class="site-menu-title">Masonry</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../advanced/treeview.html">
                      <span class="site-menu-title">Treeview</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../advanced/toastr.html">
                      <span class="site-menu-title">Toastr</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../advanced/maps-vector.html">
                      <span class="site-menu-title">Vector Maps</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../advanced/maps-google.html">
                      <span class="site-menu-title">Google Maps</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../advanced/sortable-nestable.html">
                      <span class="site-menu-title">Sortable &amp; Nestable</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../advanced/bootbox-sweetalert.html">
                      <span class="site-menu-title">Bootbox &amp; Sweetalert</span>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="site-menu-item has-sub">
                <a href="javascript:void(0)">
                        <i class="site-menu-icon md-puzzle-piece" aria-hidden="true"></i>
                        <span class="site-menu-title">Structure</span>
                    </a>
                <ul class="site-menu-sub">
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../structure/alerts.html">
                      <span class="site-menu-title">Alerts</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../structure/ribbon.html">
                      <span class="site-menu-title">Ribbon</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../structure/pricing-tables.html">
                      <span class="site-menu-title">Pricing Tables</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../structure/overlay.html">
                      <span class="site-menu-title">Overlay</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../structure/cover.html">
                      <span class="site-menu-title">Cover</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../structure/timeline-simple.html">
                      <span class="site-menu-title">Simple Timeline</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../structure/timeline.html">
                      <span class="site-menu-title">Timeline</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../structure/step.html">
                      <span class="site-menu-title">Step</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../structure/comments.html">
                      <span class="site-menu-title">Comments</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../structure/media.html">
                      <span class="site-menu-title">Media</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../structure/chat.html">
                      <span class="site-menu-title">Chat</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../structure/testimonials.html">
                      <span class="site-menu-title">Testimonials</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../structure/nav.html">
                      <span class="site-menu-title">Nav</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../structure/navbars.html">
                      <span class="site-menu-title">Navbars</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../structure/blockquotes.html">
                      <span class="site-menu-title">Blockquotes</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../structure/pagination.html">
                      <span class="site-menu-title">Pagination</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../structure/breadcrumbs.html">
                      <span class="site-menu-title">Breadcrumbs</span>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="site-menu-item has-sub">
                <a href="javascript:void(0)">
                        <i class="site-menu-icon md-widgets" aria-hidden="true"></i>
                        <span class="site-menu-title">Widgets</span>
                    </a>
                <ul class="site-menu-sub">
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../widgets/statistics.html">
                      <span class="site-menu-title">Statistics Widgets</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../widgets/data.html">
                      <span class="site-menu-title">Data Widgets</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../widgets/blog.html">
                      <span class="site-menu-title">Blog Widgets</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../widgets/chart.html">
                      <span class="site-menu-title">Chart Widgets</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../widgets/social.html">
                      <span class="site-menu-title">Social Widgets</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../widgets/weather.html">
                      <span class="site-menu-title">Weather Widgets</span>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="site-menu-item has-sub">
                <a href="javascript:void(0)">
                        <i class="site-menu-icon md-comment-alt-text" aria-hidden="true"></i>
                        <span class="site-menu-title">Forms</span>
                    </a>
                <ul class="site-menu-sub">
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../forms/general.html">
                      <span class="site-menu-title">General Elements</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../forms/material.html">
                      <span class="site-menu-title">Material Elements</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../forms/advanced.html">
                      <span class="site-menu-title">Advanced Elements</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../forms/layouts.html">
                      <span class="site-menu-title">Form Layouts</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../forms/wizard.html">
                      <span class="site-menu-title">Form Wizard</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../forms/validation.html">
                      <span class="site-menu-title">Form Validation</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../forms/masks.html">
                      <span class="site-menu-title">Form Masks</span>
                    </a>
                  </li>
                  <li class="site-menu-item has-sub">
                    <a href="javascript:void(0)">
                      <span class="site-menu-title">Editors</span>
                      <span class="site-menu-arrow"></span>
                    </a>
                    <ul class="site-menu-sub">
                      <li class="site-menu-item">
                        <a class="animsition-link" href="../../forms/editor-summernote.html">
                          <span class="site-menu-title">Summernote</span>
                        </a>
                      </li>
                      <li class="site-menu-item">
                        <a class="animsition-link" href="../../forms/editor-markdown.html">
                          <span class="site-menu-title">Markdown</span>
                        </a>
                      </li>
                      <li class="site-menu-item">
                        <a class="animsition-link" href="../../forms/editor-ace.html">
                          <span class="site-menu-title">Ace Editor</span>
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../forms/image-cropping.html">
                      <span class="site-menu-title">Image Cropping</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../forms/file-uploads.html">
                      <span class="site-menu-title">File Uploads</span>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="site-menu-item has-sub">
                <a href="javascript:void(0)">
                        <i class="site-menu-icon md-border-all" aria-hidden="true"></i>
                        <span class="site-menu-title">Tables</span>
                    </a>
                <ul class="site-menu-sub">
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../tables/basic.html">
                      <span class="site-menu-title">Basic Tables</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../tables/bootstrap.html">
                      <span class="site-menu-title">Bootstrap Tables</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../tables/floatthead.html">
                      <span class="site-menu-title">floatThead</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../tables/responsive.html">
                      <span class="site-menu-title">Responsive Tables</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../tables/editable.html">
                      <span class="site-menu-title">Editable Tables</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../tables/jsgrid.html">
                      <span class="site-menu-title">jsGrid</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../tables/footable.html">
                      <span class="site-menu-title">FooTable</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../tables/datatable.html">
                      <span class="site-menu-title">DataTables</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../tables/jqtabledit.html">
                      <span class="site-menu-title">Jquery Tabledit</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../tables/table-dragger.html">
                      <span class="site-menu-title">Table Dragger</span>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="site-menu-item has-sub">
                <a href="javascript:void(0)">
                        <i class="site-menu-icon md-chart" aria-hidden="true"></i>
                        <span class="site-menu-title">Chart</span>
                    </a>
                <ul class="site-menu-sub">
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../charts/chartjs.html">
                      <span class="site-menu-title">Chart.js</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../charts/gauges.html">
                      <span class="site-menu-title">Gauges</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../charts/flot.html">
                      <span class="site-menu-title">Flot</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../charts/peity.html">
                      <span class="site-menu-title">Peity</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../charts/sparkline.html">
                      <span class="site-menu-title">Sparkline</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../charts/morris.html">
                      <span class="site-menu-title">Morris</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../charts/chartist.html">
                      <span class="site-menu-title">Chartist.js</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../charts/rickshaw.html">
                      <span class="site-menu-title">Rickshaw</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../charts/pie-progress.html">
                      <span class="site-menu-title">Pie Progress</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../charts/c3.html">
                      <span class="site-menu-title">C3</span>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="site-menu-item has-sub active open">
                <a href="javascript:void(0)">
                        <i class="site-menu-icon md-apps" aria-hidden="true"></i>
                        <span class="site-menu-title">Apps</span>
                    </a>
                <ul class="site-menu-sub">
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../apps/contacts/contacts.html">
                      <span class="site-menu-title">Contacts</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../apps/calendar/calendar.html">
                      <span class="site-menu-title">Calendar</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../apps/notebook/notebook.html">
                      <span class="site-menu-title">Notebook</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../apps/taskboard/taskboard.html">
                      <span class="site-menu-title">Taskboard</span>
                    </a>
                  </li>
                  <li class="site-menu-item has-sub">
                    <a href="javascript:void(0)">
                      <span class="site-menu-title">Documents</span>
                      <span class="site-menu-arrow"></span>
                    </a>
                    <ul class="site-menu-sub">
                      <li class="site-menu-item">
                        <a class="animsition-link" href="../../apps/documents/articles.html">
                          <span class="site-menu-title">Articles</span>
                        </a>
                      </li>
                      <li class="site-menu-item">
                        <a class="animsition-link" href="../../apps/documents/categories.html">
                          <span class="site-menu-title">Categories</span>
                        </a>
                      </li>
                      <li class="site-menu-item">
                        <a class="animsition-link" href="../../apps/documents/article.html">
                          <span class="site-menu-title">Article</span>
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../apps/forum/forum.html">
                      <span class="site-menu-title">Forum</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../apps/message/message.html">
                      <span class="site-menu-title">Message</span>
                    </a>
                  </li>
                  <li class="site-menu-item active">
                    <a class="animsition-link" href="../../apps/projects/projects.html">
                      <span class="site-menu-title">Projects</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../apps/mailbox/mailbox.html">
                      <span class="site-menu-title">Mailbox</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../apps/media/overview.html">
                      <span class="site-menu-title">Media</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../apps/work/work.html">
                      <span class="site-menu-title">Work</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../apps/location/location.html">
                      <span class="site-menu-title">Location</span>
                    </a>
                  </li>
                  <li class="site-menu-item">
                    <a class="animsition-link" href="../../apps/travel/travel.html">
                      <span class="site-menu-title">Travel</span>
                    </a>
                  </li>
                </ul>
              </li>
            </ul>      
          </div>
        </div>
      </div>
    </div>

    <div class="page" id = "projectDetailedView">
      <div class="page-header">
        <h1 class="page-title">Projects</h1>
        <div class="page-header-actions">
          <form>
            <div class="input-search input-search-dark">
              <i class="input-search-icon md-search" aria-hidden="true"></i>
              <input type="text" class="form-control" name="" placeholder="Search...">
            </div>
          </form>
        </div>
      </div>
      <div class="page-content">
        <div class="projects-sort">
          <span class="projects-sort-label">Sorted by : </span>
          <div class="inline-block dropdown">
            <span id="projects-menu" data-toggle="dropdown" aria-expanded="false" role="button">
              Dropdown
              <i class="icon md-chevron-down" aria-hidden="true"></i>
            </span>
            <div class="dropdown-menu animation-scale-up animation-top-left animation-duration-250"
              aria-labelledby="projects-menu" role="menu">
              <a class="dropdown-item" href="javascript:void(0)" role="menuitem" tabindex="-1">Sort One</a>
              <a class="active dropdown-item" href="javascript:void(0)" role="menuitem" tabindex="-1">Sort Two</a>
              <a class="dropdown-item" href="javascript:void(0)" role="menuitem" tabindex="-1">Sort Three</a>
            </div>
          </div>
        </div>
        <div class="projects-wrap">
          <ul class="blocks blocks-100 blocks-xxl-5 blocks-lg-4 blocks-md-3 blocks-sm-2"
            data-plugin="animateList" data-child=">li" id = "allProject">
          <%--   <c:forEach items="${allProject}" var="index">
            <li  class = "animation-scale-up" style = "animation-fill-mode : backwards; animation-duration: 250ms; animation-delay : 0ms;">
 					<div class="panel">
 					<figure class="overlay overlay-hover animation-hover"><img class="caption-figure overlay-figure" src="resources/global/photos/placeholder.png">
 						<figcaption class="overlay-panel overlay-background overlay-fade text-center vertical-align">
 							<div class="btn-group">
 								<div class="dropdown float-left">
 									<button type="button" class="btn btn-icon btn-pure btn-default" title="Setting"><i class="icon md-settings" aria-hidden="true"></i></button>
 									<div class="dropdown-menu" role="menu">
 										<a class="dropdown-item" href="">Copy</a>
 										<a class="dropdown-item" href="">Rename</a>
 									</div>
 								</div>
 								<button type="button" class="btn btn-icon btn-pure btn-default" title="Delete"
 									data-tag="project-delete"><i class="icon md-delete" aria-hidden="true"></i></button>
 							</div>
 							<button type="button" class="btn btn-inverse project-button" value = "${index}" >View Project</button>
 						</figcaption>
 						</figure>
 						<div class="time float-right"> ${allProject[index].createdDate}</div>
 						<div class="text-truncate">${allProject[index].projectName}</div>
  					</div>
 				</li>
 				</c:forEach>
            --%>
          </ul> 
        </div>

        <nav>
          <ul class="pagination pagination-no-border">
          <table class = "display"></table>
           <li class="disabled page-item">
              <a class="page-link" href="javascript:void(0)" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
              </a>
            </li>
           
            <li class="active page-item"><a class="page-link" href="javascript:void(0)">1 <span class="sr-only">(current)</span></a></li>
            <li class="page-item"><a class="page-link" href="javascript:void(0)">2</a></li>
            <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>
            <li class="page-item"><a class="page-link" href="javascript:void(0)">4</a></li>
            <li class="page-item"><a class="page-link" href="javascript:void(0)">5</a></li>
            <li class="page-item">
              <a class="page-link" href="javascript:void(0)" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
              </a>
            </li> 
          </ul>
        </nav>
      </div>
    </div>

    <!-- Site Action -->
    <div id = "create">
 	<div class="site-action" data-target="#addProjectForm" data-toggle="modal" data-plugin="actionBtn">
       <button type="button" data-action="add" class="site-action-toggle btn-raised btn btn-success btn-floating">
        <i class="icon md-plus" aria-hidden="true"></i>
      </button>
      </div>
    </div>
    <!-- End Site Action -->

    <!-- Add Project Form -->
    <div class="modal fade" id="addProjectForm" aria-hidden="true" aria-labelledby="addProjectForm"
      role="dialog" tabindex="-1">
     <div class="modal-dialog modal-simple">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" aria-hidden="true" data-dismiss="modal">×</button>
            <h4 class="modal-title">Create New Project</h4>
          </div>
          <div class="modal-body">
         
              <div class="form-group">
                <label class="form-control-label mb-15"  for="name">Project name:</label>
                <input type="text" class="form-control" id="projectName" name="name" placeholder="Project name">
              </div>
              <div class="form-group">
                <label class="form-control-label mb-15" for="name">Project description:</label>
                <textarea class="form-control mb-sm" id = "projectDescription" placeholder="Project description." rows="4"></textarea>
              </div>
              <div class="form-group">
                <label class="form-control-label mb-15" for="name">Choice people to your project:</label>
                <select multiple="multiple" id = "memberSelect" class="plugin-selective"></select>
              </div> 
          </div>
          <div class="modal-footer text-right">
            <button class="btn btn-primary" data-dismiss="modal" type="button" id = "createProjectButton">Creat</button>
            <a class="btn btn-sm btn-white btn-pure" data-dismiss="modal" href="javascript:void(0)">Cancel</a>
          </div>
        </div>
      </div>
    </div>
    <!-- End Add Project Form -->


    <!-- Footer -->
    <footer class="site-footer">
      <div class="site-footer-legal">© 2018 <a href="http://themeforest.net/item/remark-responsive-bootstrap-admin-template/11989202">Remark</a></div>
      <div class="site-footer-right">
        Crafted with <i class="red-600 icon md-favorite"></i> by <a href="https://themeforest.net/user/creation-studio">Creation Studio</a>
      </div>
    </footer>
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
        <script src="resources/global/vendor/jquery-selective/jquery-selective.min.js"></script>
        <script src="resources/global/vendor/bootbox/bootbox.js"></script>
    
    <!-- Scripts -->
    <script src="resources/global/js/Component.js"></script>
    <script src="resources/global/js/Plugin.js"></script>
    <script src="resources/global/js/Base.js"></script>
    <script src="resources/global/js/Config.js"></script>
    
    <script src="resources/assets/js/Section/Menubar.js"></script>
    <script src="resources/assets/js/Section/Sidebar.js"></script>
    <script src="resources/assets/js/Section/PageAside.js"></script>
    <script src="resources/assets/js/Plugin/menu.js"></script>
    
    <!-- Config -->
    <script src="resources/global/js/config/colors.js"></script>
    <script src="resources/assets/js/config/tour.js"></script>
    <script>Config.set('assets', '../../../assets');</script>
    
    <!-- Page -->
    <script src="resources/assets/js/Site.js"></script>
    <script src="resources/global/js/Plugin/asscrollable.js"></script>
    <script src="resources/global/js/Plugin/slidepanel.js"></script>
    <script src="resources/global/js/Plugin/switchery.js"></script>
        <script src="resources/global/js/Plugin/animate-list.js"></script>
        <script src="resources/global/js/Plugin/bootbox.js"></script>
        <script src="resources/assets/js/Site.js"></script>
	 <script src="resources/assets/js/App/Projects.js"></script>
    
  	<script src="resources/assets/examples/js/apps/projects.js"></script>
  

  </body> 
  
  
</html>
