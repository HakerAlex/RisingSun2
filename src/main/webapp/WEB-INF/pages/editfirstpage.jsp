<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<head>

  <!-- Meta information -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

  <!-- Title-->
  <title>RISING SUN | Admin panel</title>

  <!-- Favicons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144"
        href="${pageContext.request.contextPath}/resources/assets/ico/apple-touch-icon-144-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="114x114"
        href="${pageContext.request.contextPath}/resources/assets/ico/apple-touch-icon-114-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="72x72"
        href="${pageContext.request.contextPath}/resources/assets/ico/apple-touch-icon-72-precomposed.png">
  <link rel="apple-touch-icon-precomposed"
        href="${pageContext.request.contextPath}/resources/assets/ico/apple-touch-icon-57-precomposed.png">
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/ico/favicon.ico">

  <!-- CSS Stylesheet-->
  <link type="text/css" rel="stylesheet"
        href="${pageContext.request.contextPath}/resources/assets/css/bootstrap/bootstrap.min.css"/>
  <link type="text/css" rel="stylesheet"
        href="${pageContext.request.contextPath}/resources/assets/css/bootstrap/bootstrap-themes.css"/>
  <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/style.css"/>

  <!-- Styleswitch if  you don't chang theme , you can delete -->
  <link type="text/css" rel="alternate stylesheet" media="screen" title="style1"
        href="${pageContext.request.contextPath}/resources/assets/css/styleTheme1.css"/>
  <link type="text/css" rel="alternate stylesheet" media="screen" title="style2"
        href="${pageContext.request.contextPath}/resources/assets/css/styleTheme2.css"/>
  <link type="text/css" rel="alternate stylesheet" media="screen" title="style3"
        href="${pageContext.request.contextPath}/resources/assets/css/styleTheme3.css"/>
  <link type="text/css" rel="alternate stylesheet" media="screen" title="style4"
        href="${pageContext.request.contextPath}/resources/assets/css/styleTheme4.css"/>

</head>
<body  class="leftMenu nav-collapse in">
<div id="wrapper">
  <%@ include file="../pages/admin/template.jsp" %>

    <div id="main">

        <ol class="breadcrumb">
            <li><a href="#">FIRST PAGE</a></li>
            <li><a href="${pageContext.request.contextPath}/tablefirstpage"> EDIT FIRST PAGE</a></li>
            <li class="active">FIRST PAGE</li>
        </ol>
        <!-- //breadcrumb-->

        <div id="content">

            <div class="row">

                <div class="col-lg-8">
                <section class="panel">
                    <header class="panel-heading">
                        <h2><strong>EDIT</strong> FIRST PAGE</h2>
                    </header>
                    <div class="panel-body">
                        <form id="formID" class="form-horizontal" method="post" action="${pageContext.request.contextPath}/updatefirstpage" commandName="updatefirstpage" data-collabel="3" data-alignlabel="right"  data-parsley-validate>

                            <div class="form-group">
                                <label class="control-label">No.</label>
                                <div class="input-icon"> <i class="fa fa-map-marker ico"></i>
                                    <input class="form-control rounded " name="id" type="text" value="${firstpage.id}"  readonly >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label">Title</label>
                                <div class="input-icon"> <i class="fa fa-map-marker ico"></i>
                                    <input class="form-control rounded " name="title" type="text" value="${firstpage.articlesByArticleId.title}"  readonly >
                                </div>
                            </div>


                            <div class="form-group">
                                    <label class="control-label">Raiting </label>
                                <br>
                                <div class="form-group">
                                    <div class="cp-slider-wrapper" data-color="green" data-max="100" data-range="min"
                                         data-value="${firstpage.raiting}">
                                        <input type="hidden" name="raiting" id="raiting"  align="center"/>
                                        <nav>
                                            <a href="#" class="cp-prev"><i class="fa fa-chevron-left"></i></a>
                                            <a href="#" class="cp-next"><i class="fa fa-chevron-right"></i></a>
                                        </nav>
                                    </div>
                                </div>
                            </div>


                            <div class="form-group">
                                    <label class="control-label">Feature</label>
                                    <div>
                                        <c:if test="${firstpage.feature==true}">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" name="feature" id="feature" checked>
                                            </label>
                                        </c:if>

                                        <c:if test="${firstpage.feature==false}">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" name="feature" id="feature">
                                            </label>
                                        </c:if>

                                    </div>
                            </div>

                            <footer class="panel-footer">
                                <button type="submit" class="btn btn-theme">Update</button>
                            </footer>
                        </form>
                    </div>
                </section>
                </div>
            </div>
            <!-- //content > row-->

        </div>
        <!-- //content-->


    </div>



  <%@ include file="../pages/admin/templatefoot.jsp" %>
</div>




<!-- Jquery Library -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/assets/js/jquery.ui.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/assets/plugins/bootstrap/bootstrap.min.js"></script>
<!-- Modernizr Library For HTML5 And CSS3 -->
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/assets/js/modernizr/modernizr.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/assets/plugins/mmenu/jquery.mmenu.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/styleswitch.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/styleswitch.js"></script>
<!-- Library 10+ Form plugins-->
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/assets/plugins/form/form.js"></script>
<!-- Datetime plugins -->
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/assets/plugins/datetime/datetime.js"></script>
<!-- Library Chart-->
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/assets/plugins/chart/chart.js"></script>
<!-- Library  5+ plugins for bootstrap -->
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/assets/plugins/pluginsForBS/pluginsForBS.js"></script>
<!-- Library 10+ miscellaneous plugins -->
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/assets/plugins/miscellaneous/miscellaneous.js"></script>
<!-- Library Themes Customize-->
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/assets/js/caplet.custom.js"></script>

<script type="text/javascript">
    $(function() {
        $('#my-select').multiSelect();
    });
</script>


<script type="text/javascript">

    $(document).ready(function () {


        $(".cp-slider-wrapper").each(function(i) {
            var slider=$(this), update=slider.find("input[type='hidden']"), data=slider.data();
            slider.modernSlider({
                total: data.max || 100,
                value: data.value,
                width: data.width || "100%",
                range: data.range,
                sliderOpened: data.opened,
                onSlide: function(value) {
                    update.val(value);
                }
            });
            var sliderChange=slider.find("a.ui-slider-handle");
            sliderChange.css({ "background-color":$.fillColor(slider) });
        });

    });
</script>

</body>
</html>
