<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>


<!-- Jquery Library -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/jquery.ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/plugins/bootstrap/bootstrap.min.js"></script>
<!-- Modernizr Library For HTML5 And CSS3 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/modernizr/modernizr.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/plugins/mmenu/jquery.mmenu.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/styleswitch.js"></script>
<!-- Library 10+ Form plugins-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/plugins/form/form.js"></script>
<!-- Datetime plugins -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/plugins/datetime/datetime.js"></script>
<!-- Library Chart-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/plugins/chart/chart.js"></script>
<!-- Library  5+ plugins for bootstrap -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/plugins/pluginsForBS/pluginsForBS.js"></script>
<!-- Library 10+ miscellaneous plugins -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/plugins/miscellaneous/miscellaneous.js"></script>
<!-- Library Themes Customize-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/caplet.custom.js"></script>

<head>
<!-- Meta information -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<!-- Title-->
<title>RISING SUN ADMIN</title>
<!-- Favicons -->

<!-- CSS Stylesheet-->
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap/bootstrap-themes.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/style.css" />

</head>
<body class="full-lg">
<div id="wrapper">

<div id="loading-top">
		<div id="canvas_loading"></div>
		<span>Checking...</span>
</div>

<div id="main">
		<div class="container">
				<div class="row">
						<div class="col-lg-12">
						
								<div class="account-wall">
										<section class="align-lg-center">
										<!-- <div class="site-logo"></div> -->
										<h1 class="login-title"><span>wel</span>come <small> Rising Sun Admin</small></h1>
										</section>
										<c:if test="${!empty error}" >
											<script type="text/javascript">
												$(function() {
													$.notific8('Check Username or Password again !! ', {
														life: 5000,
														horizontalEdge: "bottom",
														theme: "danger",
														heading: " ERROR :); "
													});
												});
											</script>
										</c:if>
										<form id="form-signin" class="form-signin" action="${pageContext.request.contextPath}/j_spring_security_check" method="post">
												<section>
														<div class="input-group">
																<div class="input-group-addon"><i class="fa fa-user"></i></div>
																<input  type="text" class="form-control" name="j_username" placeholder="Username">
														</div>
														<div class="input-group">
																<div class="input-group-addon"><i class="fa fa-key"></i></div>
																<input type="password" class="form-control"  name="j_password" placeholder="Password">
														</div>
														<button class="btn btn-lg btn-theme-inverse btn-block" type="submit"  id="sign-in">Sign in</button>
												</section>
										</form>
								</div>	
								<!-- //account-wall-->
								
						</div>
						<!-- //col-sm-6 col-md-4 col-md-offset-4-->
				</div>
				<!-- //row-->
		</div>
		<!-- //container-->
		
</div>
<!-- //main-->

		
</div>
<!-- //wrapper-->


<!--
////////////////////////////////////////////////////////////////////////
//////////     JAVASCRIPT  LIBRARY     //////////
/////////////////////////////////////////////////////////////////////
-->
		

<script type="text/javascript">
$(function() {
		   //Login animation to center 
			function toCenter(){
					var mainH=$("#main").outerHeight();
					var accountH=$(".account-wall").outerHeight();
					var marginT=(mainH-accountH)/2;
						   if(marginT>30){
							   $(".account-wall").css("margin-top",marginT-15);
							}else{
								$(".account-wall").css("margin-top",30);
							}
				}
				toCenter();
				var toResize;
				$(window).resize(function(e) {
					clearTimeout(toResize);
					toResize = setTimeout(toCenter(), 500);
				});
				
			//Canvas Loading
			  var throbber = new Throbber({  size: 32, padding: 17,  strokewidth: 2.8,  lines: 12, rotationspeed: 0, fps: 15 });
			  throbber.appendTo(document.getElementById('canvas_loading'));
			  throbber.start();
			  


//			$("#form-signin").submit(function(event){
//					event.preventDefault();
//					var main=$("#main");
//					//scroll to top
//					main.animate({
//						scrollTop: 0
//					}, 500);
//					main.addClass("slideDown");
//
//					$.ajax({
//						url: "/j_spring_security_check", data: $(this).serialize(), type: "POST", dataType: 'json',
//						success: function (e) {
//								debugger;
//								setTimeout(function () { main.removeClass("slideDown") }, !e.status ? 500:3000);
//								 if (!e.status) {
//									 $.notific8('Check Username or Password again !! ',{ life:5000,horizontalEdge:"bottom", theme:"danger" ,heading:" ERROR :); "});
//									return false;
//								 }
//								 setTimeout(function () { $("#loading-top span").text("Yes, account is access...") }, 500);
//								 setTimeout(function () { $("#loading-top span").text("Redirect to account page...")  }, 1500);
//								 setTimeout( "window.location.href='/dashboard'", 3100 );
//						}
//					});
//
//			});
	});
</script>
</body>
</html>