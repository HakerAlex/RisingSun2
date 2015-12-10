<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en"> <!--<![endif]-->
<head>
    <meta charset="utf-8"/>

    <!-- Set the viewport width to device width for mobile -->
    <meta name="viewport" content="width=device-width"/>

    <title>Прогрессфарм: ИТ-отдел</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/ico/favicon.ico">
    <!-- Included CSS Files (Uncompressed) -->
    <!--
    <link rel="stylesheet" href="stylesheets/foundation.css">
    -->

    <!-- Included CSS Files (Compressed) -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/foundation.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/app.css">


    <%--<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css/demo.css" />--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css/style.css" />

    <script src="${pageContext.request.contextPath}/resources/js/modernizr.foundation.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/ligature.css">

    <!-- Google fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300|Playfair+Display:400italic'
          rel='stylesheet' type='text/css'/>

    <noscript>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css/noscript.css" />
    </noscript>



    <!-- IE Fix for HTML5 Tags -->
    <!--[if lt IE 9]>
    <!--<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>-->
    <%--<![endif]-->--%>


</head>

<body>

<!-- ######################## Main Menu ######################## -->

<nav>

    <div class="twelve columns header_nav_fullwidth">
        <div class="ten columns" style="padding-top:8px">

            <ul id="menu-header" class="nav-bar horizontal">

                <li><a href="${pageContext.request.contextPath}/">Главная</a></li>

                <li>
                    <a href="${pageContext.request.contextPath}/allarchive">Архив</a>
                </li>

                <li>
                    <a href="${pageContext.request.contextPath}/admin">Задачи для отдела</a>
                </li>

                <li class="active"> <a href="#">Об отделе</a> </li>

            </ul>


          </div>

        <div class="two columns" style="padding-top:8px">
            <form class="searching" method="post" action="${pageContext.request.contextPath}/search"
                  commandName="search">
                <input tabindex="1" id="autocomplete" name="value" type="search" placeholder="Введите текст и Enter">
            </form>
        </div>
    </div>

</nav>
<!-- END main menu -->

<!-- ######################## Header ######################## -->

        <header>

            <div class="row">

                <article>

                    <div class="twelve columns">
                        <h1>Прогрессфарм: Общая информация об ИТ-отделе</h1>
                    </div>

                </article>


            </div>

        </header>

        <!-- ######################## Section ######################## -->

        <section class="section_light">
            <%--<div class="row">--%>
                   <div class="container">
                    <div class="wrapper">
                        <div id="ei-slider" class="ei-slider">
                            <ul class="ei-slider-large">
                                <c:forEach items="${listPhoto}" var="photo">
                                <li>
                                    <img src="${photo.firstpath}" alt="${photo.title}"/>
                                    <div class="ei-title">
                                        <h2>${photo.firststring}</h2>
                                        <h3>${photo.secondstring}</h3>
                                    </div>
                                </li>

                                </c:forEach>
                            </ul><!-- ei-slider-large -->


                            <ul class="ei-slider-thumbs">

                                <li class="ei-slider-element">Текущая</li>

                                <c:forEach items="${listPhoto}" var="photo">
                                    <li><a href="#">${photo.title}</a><img src="${photo.secondpath}" alt="${photo.title}" /></li>
                                </c:forEach>

                            </ul><!-- ei-slider-thumbs -->
                        </div><!-- ei-slider -->

                    </div><!-- wrapper -->
                </div>
               <%--</div>--%>
        </section>

<section>

    <div class="section_main">

        <div class="row">

            <section class="twenty columns">

                <article class="blog_post">

                    <div class="three columns">
                        <a href="#" class="th"><img src="${pageContext.request.contextPath}/resources/img/sunr.jpg" alt="desc"/></a>
                    </div>
                    <div class="nine columns">
                        <h3>Начальник ИТ-отдела</h3>
                        <h4>Потемкин Алексей</h4>

                        <p> Vivamus tortor tellus, rutrum sit amet mollis vel, imperdiet consectetur orci. Mauris
                            pharetra congue enim, et sagittis lectus congue ut. Cum sociis natoque penatibus.</p>
                    </div>

                </article>
            </section>

        </div>

    </div>
</section>


<!-- ######################## Scripts ######################## -->

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/js/jquery.eislideshow.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/js/jquery.easing.1.3.js"></script>
<script type="text/javascript">
    $(function() {
        $('#ei-slider').eislideshow({
            animation			: 'center',
            autoplay			: true,
            slideshow_interval	: 3000,
            titlesFactor		: 0
        });
    });
</script>
</body>
</html>