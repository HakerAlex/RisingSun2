<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8" />

  <!-- Set the viewport width to device width for mobile -->
  <meta name="viewport" content="width=device-width" />

  <title>Rising sun news</title>
  
  <!-- Included CSS Files (Uncompressed) -->
  <!--
  <link rel="stylesheet" href="stylesheets/foundation.css">
  -->
  
  <!-- Included CSS Files (Compressed) -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/foundation.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/app.css">

  <script src="${pageContext.request.contextPath}/resources/js/modernizr.foundation.js"></script>
  
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/ligature.css">
  
  <!-- Google fonts -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300|Playfair+Display:400italic' rel='stylesheet' type='text/css' />

  <!-- IE Fix for HTML5 Tags -->
  <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->

</head>
<body>


        <div class="twelve columns header_nav_fullwidth">
        
           <div class="ten columns" style="padding-top:8px">
            <ul id="menu-header" class="nav-bar horizontal">
            
            <li class="active"><a href="/">Home</a></li>

            <li class="has-flyout">
                <a href="#">Archive</a><a href="#" class="flyout-toggle"></a>

                <ul class="flyout">

                    <c:if test = "${!empty archive}">
                        <c:forEach items = "${archive}" var = "arch">
                            <li class="has-flyout"><a href="/archive/${arch}"><f:formatDate type="date" value="${arch}" pattern="MM-yyyy" /></a></li>
                        </c:forEach>
                    </c:if>

                </ul>

            </li>


            </ul>



               <script type="text/javascript">
           //<![CDATA[
           $('ul#menu-header').nav-bar();
            //]]>
            </script>
		   </div>
            <div class="two columns" style="padding-top:8px">
               <form class="searching" method="post" action="${pageContext.request.contextPath}/search" commandName="search">
                    <input tabindex="1" id="autocomplete" name="value" type="search" placeholder="Type and hit Enter">
               </form>
            </div>

         </div>



        <!-- END Header -->
        
        <div style="clear: both"></div>
        
       <div class="twelve columns">

        
		<div id="container">


            <c:if test = "${!empty allnews}">
            <c:forEach items = "${allnews}" var = "news">

			<div class='box photo col2'>

                <c:if test="${empty news[1].image}">
                    <a href="news/${news[1].namePage}"><img src="${pageContext.request.contextPath}/resources/img/sunr.jpg" alt="desc"/>
                    </a>
                </c:if>

                <c:if test="${!empty news[1].image}">
                    <a href="news/${news[1].namePage}"><img src="${news[1].image}" alt="desc">
                    </a>
                </c:if>


                <h4><strong><a href="news/${news[1].namePage}">${news[1].title}</a></strong></h4>
                <p>${news[1].article}...</p>

                <div class="post_meta">
                    <span class="lsf-icon" title="calender"><f:formatDate type="date" value="${news[1].dateCreate}" pattern="dd/MM/yyyy" /></span>
                    <span class="lsf-icon" title="user" style="margin-left:15px"><a href="/author/${news[2].name}"> ${news[2].name}</a></span>
                </div>
            </div>


            </c:forEach>
            </c:if>

		</div> <!-- end Masonry container -->
        
        </div>
        


<!-- ######################## Scripts ######################## --> 


		<!-- end page wrap) -->
		<!-- Included JS Files (Compressed) -->
		<script src="${pageContext.request.contextPath}/resources/js/foundation.min.js" type="text/javascript">
		</script>
		<!-- Initialize JS Plugins -->
		<script src="${pageContext.request.contextPath}/resources/js/app.js" type="text/javascript">
		</script>
		<!-- Masonry for galleries -->
		<script src="${pageContext.request.contextPath}/resources/js/masonry.js" type="text/javascript">
		</script>
		<script type="text/javascript">
//<![CDATA[
      $(function(){
        var $container = $('#container');
        $container.imagesLoaded( function(){
          $container.masonry({
            itemSelector : '.box',
                        isFitWidth: true,
                        isAnimated: true
          });
        });
      });
  //]]>
  </script>
		<!-- END Masonry -->
		</body>
		</html>