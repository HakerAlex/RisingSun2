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
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap/bootstrap-editable.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap/dataTables.bootstrap.css">

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
            <li><a href="#">ARTICLES</a></li>
            <li><a href="#"> EDIT ARTICLES</a></li>
            <li class="active">ARTICLES</li>
        </ol>
        <!-- //breadcrumb-->

        <div id="content">

            <div class="row">

                <div class="col-lg-12">

                    <section class="panel">
                        <header class="panel-heading">
                            <h2><strong>Table</strong> ARTICLES </h2>
                        </header>

                        <div class="panel-body">
                            <%--<div class="table-responsive">--%>
                                <table class="display" data-provide="data-table">
                                    <thead>
                                    <tr>
                                        <%--<th>No.</th>--%>
                                        <th>Title article</th>
                                        <th> Name page </th>
                                        <th> Date create </th>
                                        <th> Image </th>
                                        <th> Author </th>
                                        <th> Archive </th>
                                        <th> Action </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${articles}" var="article">
                                        <tr>
                                            <%--<td class="text-center" >${article[0].id}</td>--%>
                                            <td class="text-center" valign="middle">${article[0].title}</td>
                                            <td class="text-center" valign="middle">${article[0].namePage}</td>
                                            <td class="text-center" valign="middle">${article[0].dateCreate}</td>

                                            <td align="center" valign="middle">
                                            <c:if test="${!empty article[0].image}">
                                                <span class="label bg-success">FULL IMAGE</span>
                                            </c:if>

                                            <c:if test="${empty article[0].image}">
                                                <span class="label bg-danger">EMPTY IMAGE</span>
                                            </c:if>
                                            </td>

                                            <td class="text-center" valign="middle">${article[1].name}</td>

                                            <td class="text-center" valign="middle">
                                                <c:if test="${article[0].archive==false}">
                                                    <span class="label bg-success">ACTIVE</span>
                                                </c:if>
                                                <c:if test="${article[0].archive==true}">
                                                    <span class="label bg-danger">ARCHIVE</span>
                                                </c:if>
                                            </td>

                                            <td align="center">
                                        <span class="tooltip-area">
                                            <a href="${pageContext.request.contextPath}/editarticle/${article[0].id}" class="btn btn-default btn-sm" title="Edit"><i class="fa fa-pencil"></i></a>
                                             <sec:authorize access="hasAnyRole('Admin','Editor')">
                                                <a href="${pageContext.request.contextPath}/deletearticle/${article[0].id}" data-confirm="Are you sure you want to delete?" class="btn btn-default btn-sm" title="Delete"><i class="fa fa-trash-o"></i></a>
                                            </sec:authorize>
                                        </span>
                                            </td>


                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            <%--</div>--%>
                        </div>
                    </section>
                </div>

            </div>
            <!-- //content > row-->

        </div>
        <!-- //content-->


    </div>
    <!-- //main-->


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

<!-- Library datable -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/plugins/datable/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/plugins/datable/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/plugins/bootstrap/bootstrap-editable.js"></script>

<script type="text/javascript">
    jQuery(document).ready(function() {
        $('table[data-provide="data-table"]').dataTable();
    });
</script>

<script type="text/javascript">
    // For demo to fit into DataTables site builder...
    $('table[data-provide="data-table"]')
            .removeClass( 'display' )
            .addClass('table table-striped table-bordered');
</script>


<script type="text/javascript">

    $(document).ready(function () {


        $(".cp-slider-wrapper").each(function(i) {
            var slider=$(this), update=slider.find("input[type='hidden']"), data=slider.data();
            slider.modernSlider({
                total: data.max || 100,
                value:data.value,
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

<script>
    $(document).ready(function() {
        $('a[data-confirm]').click(function(ev) {
            var href = $(this).attr('href');

            if (!$('#dataConfirmModal').length) {
                $('body').append('<div id="dataConfirmModal" class="modal" role="dialog" aria-labelledby="dataConfirmLabel" aria-hidden="true"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button><h3 id="dataConfirmLabel">Please Confirm</h3></div><div class="modal-body"></div><div class="modal-footer"><button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button><a class="btn btn-primary" id="dataConfirmOK">OK</a></div></div>');
            }
            $('#dataConfirmModal').find('.modal-body').text($(this).attr('data-confirm'));
            $('#dataConfirmOK').attr('href', href);
            $('#dataConfirmModal').modal({show:true});
            return false;
        });
    });
</script>


</body>
</html>
