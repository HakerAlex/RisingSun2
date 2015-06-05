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
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/ico/favicon.ico">
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

<!-- ######################## Main Menu ######################## -->

<nav>

    <div class="twelve columns header_nav_fullwidth">
        <div class="ten columns" style="padding-top:8px">

            <ul id="menu-header" class="nav-bar horizontal">

                <li><a href="${pageContext.request.contextPath}/">Home</a></li>

                <li>
                    <a href="${pageContext.request.contextPath}/allarchive">Archive</a>
                </li>

                <li class="active"><a href="#">Search</a></li>

            </ul>



            <script type="text/javascript">
                //<![CDATA[
                $('ul#menu-header').nav - bar();
                //]]>
            </script>

        </div>

        <div class="two columns" style="padding-top:8px">
            <form class="searching" method="post" action="${pageContext.request.contextPath}/search" commandName="search">
                <input tabindex="1" id="autocomplete" name="value" type="search" placeholder="Type and hit Enter">
            </form>
        </div>
    </div>

</nav>
        
<!-- ######################## Header (featured posts) ######################## -->
     
      
<!-- ######################## Section ######################## -->

<section>

    <div class="section_main">

        <div class="row">

            <section class="eight columns">

                <c:if test = "${!empty searchr}">
                    <h2>${searchr}</h2>
                </c:if>
                <c:if test="${!empty allnews}">
                    <c:forEach items="${allnews}" var="news">
                        <article class="blog_post">

                            <div class="three columns">

                                <c:if test="${empty news.image}">
                                    <a href="${pageContext.request.contextPath}/news/${news.namePage}" class="th"><img src="${pageContext.request.contextPath}/resources/img/sunr.jpg" alt="desc"/>
                                    </a>
                                </c:if>

                                <c:if test="${!empty news.image}">
                                    <a href="${pageContext.request.contextPath}/news/${news.namePage}" class="th"><img src="${news.image}" alt="desc">
                                    </a>
                                </c:if>

                            </div>

                            <div class="nine columns">
                                <a href="${pageContext.request.contextPath}/news/${news.namePage}"><h3>${news.title}</h3></a>
                                <p> ${news.article}...</p>
                                <span class="lsf-icon" title="calender"><f:formatDate type="date" value="${news.dateCreate}"
                                                                                                                   pattern="dd/MM/yyyy"/></span>
								<span class="lsf-icon" title="user"><a
                                        href="${pageContext.request.contextPath}/author/${news.usersByAuthor.name}"> ${news.usersByAuthor.name}</a></span>
                            </div>



                        </article>
                    </c:forEach>
                </c:if>
            </section>


        </div>

    </div>

</section>


<!-- ######################## Section ######################## -->


      
 

<!-- ######################## Scripts ######################## --> 

    <!-- Included JS Files (Compressed) -->
    <script src="${pageContext.request.contextPath}/resources/js/foundation.min.js" type="text/javascript"></script>
    <!-- Initialize JS Plugins -->
     <script src="${pageContext.request.contextPath}/resources/js/app.js" type="text/javascript"></script>
</body>
</html>