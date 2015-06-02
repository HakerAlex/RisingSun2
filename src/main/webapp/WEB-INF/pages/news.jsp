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

                <li><a href="${pageContext.request.contextPath}/">Home</a></li>

                <li class="has-flyout">
                    <a href="#">Archive</a><a href="#" class="flyout-toggle"></a>

                    <ul class="flyout">

                        <c:if test="${!empty archive}">
                            <c:forEach items="${archive}" var="arch">
                                <li class="has-flyout"><a href="${pageContext.request.contextPath}/archive/${arch}"><f:formatDate type="date"
                                                                                                value="${arch}"
                                                                                                pattern="MM-yyyy"/></a>
                                </li>
                            </c:forEach>
                        </c:if>

                    </ul>

                </li>

                <li class="active"><a href="#">Article</a></li>

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


            <div id="disqus_thread"></div>
            <script type="text/javascript">
                /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
                var disqus_shortname = 'risingsunnews'; // Required - Replace '<example>' with your forum shortname

                /* * * DON'T EDIT BELOW THIS LINE * * */
                (function() {
                    var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
                    dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
                    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
                })();
            </script>
            <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>

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