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

    <script src="${pageContext.request.contextPath}/resources/js/modernizr.foundation.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/ligature.css">

    <!-- Google fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300|Playfair+Display:400italic'
          rel='stylesheet' type='text/css'/>

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

                <li><a href="${pageContext.request.contextPath}/">Главная</a></li>

                <li>
                    <a href="${pageContext.request.contextPath}/allarchive">Архив</a>
                </li>

                <li class="active"><a href="#">Статья</a></li>

                <li>
                    <a href="${pageContext.request.contextPath}/admin">Задачи для отдела</a>
                </li>

                <li>
                    <a href="${pageContext.request.contextPath}/aboutus">Об отделе</a>
                </li>

            </ul>


            <script type="text/javascript">
                //<![CDATA[
                $('ul#menu-header').nav - bar();
                //]]>
            </script>

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
<c:if test="${!empty allnews}">
    <c:forEach items="${allnews}" var="news">
        <header>

            <div class="row">

                <article>

                    <div class="twelve columns">
                        <h1>${news[0].title}</h1>
                    </div>

                </article>


            </div>

        </header>

        <!-- ######################## Section ######################## -->

        <section class="section_light">


            <div class="row">

                    ${news[0].article}
                        <span class="lsf-icon" title="calender"><f:formatDate type="date" value="${news[0].dateCreate}"
                                                                              pattern="dd/MM/yyyy"/></span>
                        <span class="lsf-icon" title="user" style="margin-left:15px"><a
                                href="${pageContext.request.contextPath}/author/${news[1].name}"> ${news[1].name}</a></span>
                        <span class="lsf-icon" title="tags" style="margin-left:15px">
                        <c:forEach items="${tags}" var="tag">
                            <a class="label" href="${pageContext.request.contextPath}/tags/${tag.name}">${tag.name}</a>
                        </c:forEach>
                        </span>


                    <%--<div class="post_meta">--%>

                    <%--</div>--%>

                <script type="text/javascript">(function () {
                    if (window.pluso)if (typeof window.pluso.start == "function") return;
                    if (window.ifpluso == undefined) {
                        window.ifpluso = 1;
                        var d = document, s = d.createElement('script'), g = 'getElementsByTagName';
                        s.type = 'text/javascript';
                        s.charset = 'UTF-8';
                        s.async = true;
                        s.src = ('https:' == window.location.protocol ? 'https' : 'http') + '://share.pluso.ru/pluso-like.js';
                        var h = d[g]('body')[0];
                        h.appendChild(s);
                    }
                })();</script>
                <br>
                <div class="pluso" data-background="transparent"
                     data-options="big,square,line,horizontal,counter,theme=06"
                     data-services="vkontakte,odnoklassniki,facebook,twitter,google,moimir,email,print"></div>

                        <!-- hit.ua invisible part -->
                        <a href='http://hit.ua/?x=137209' target='_blank'>
                            <script language="javascript" type="text/javascript"><!--
                            Cd=document;Cr="&"+Math.random();Cp="&s=1";
                            Cd.cookie="b=b";if(Cd.cookie)Cp+="&c=1";
                            Cp+="&t="+(new Date()).getTimezoneOffset();
                            if(self!=top)Cp+="&f=1";
                            //--></script>
                            <script language="javascript1.1" type="text/javascript"><!--
                            if(navigator.javaEnabled())Cp+="&j=1";
                            //--></script>
                            <script language="javascript1.2" type="text/javascript"><!--
                            if(typeof(screen)!='undefined')Cp+="&w="+screen.width+"&h="+
                                    screen.height+"&d="+(screen.colorDepth?screen.colorDepth:screen.pixelDepth);
                            //--></script>
                            <script language="javascript" type="text/javascript"><!--
                            Cd.write("<sc"+"ript src='http://c.hit.ua/hit?i=137209&g=0&x=3"+Cp+Cr+
                                    "&r="+escape(Cd.referrer)+"&u="+escape(window.location.href)+"'></sc"+"ript>");
                            //--></script>
                            <noscript>
                                <img src='http://c.hit.ua/hit?i=137209&amp;g=0&amp;x=2' border='0'/>
                            </noscript></a>
                        <!-- / hit.ua invisible part -->

                        <!-- hit.ua visible part -->
                        <script language="javascript" type="text/javascript"><!--
                        if (typeof(hitua) == 'object') document.write("<table cellpadding='0' cellspacing='0' border='0' style='display: inline'><tr><td><div style='width: 86px; height: 29px; padding: 0px; margin: 0px; border: solid #777 1px; background-color: #444'><a href='http://hit.ua/?x=" + hitua.site_id + "' target='_blank' style='float: left; padding: 3px; font: bold 8px tahoma; text-decoration: none; color: #ccc' title='hit.ua'>STATISTICS</a><div style='padding: 3px; float: right; text-align: right; font: 7.1px tahoma; color: #ccc' title='Now online, visitors, pageviews today'>" + hitua.online_count + "<br>" + hitua.uid_count + "<br>" + hitua.hit_count + "</div></div></td></tr></table>");
                        //--></script>
                        <!-- / hit.ua visible part -->



                        <div id="disqus_thread"></div>
                <script type="text/javascript">
                    /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
                    var disqus_shortname = 'risingsunnews'; // Required - Replace '<example>' with your forum shortname

                    /* * * DON'T EDIT BELOW THIS LINE * * */
                    (function () {
                        var dsq = document.createElement('script');
                        dsq.type = 'text/javascript';
                        dsq.async = true;
                        dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
                        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
                    })();
                </script>
                <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments
                    powered by Disqus.</a></noscript>

            </div>
        </section>

    </c:forEach>
</c:if>


<!-- ######################## Scripts ######################## -->

<!-- Included JS Files (Compressed) -->
<script src="${pageContext.request.contextPath}/resources/js/foundation.min.js" type="text/javascript"></script>
<!-- Initialize JS Plugins -->
<script src="${pageContext.request.contextPath}/resources/js/app.js" type="text/javascript"></script>
</body>
</html>