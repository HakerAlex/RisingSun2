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
    <title>Прогрессфарм | Задачи</title>

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
            <li><a href="#">ОРГАНИЗАЦИИ</a></li>
            <li><a href="#"> РЕДАКТИРОВАНИЕ ОРГАНИЗАЦИИ</a></li>
            <li class="active">ОРГАНИЗАЦИИ</li>
        </ol>
        <!-- //breadcrumb-->

        <div id="content">

            <div class="row">

                <div class="col-lg-12">

                    <section class="panel">
                        <header class="panel-heading">
                            <h2><strong>ТАБЛИЦА</strong> ОРГАНИЗАЦИИ </h2>
                        </header>

                        <div class="panel-body">
                            <%--<div class="table-responsive">--%>
                                <table class="display" data-provide="data-table">
                                    <thead>
                                    <tr>
                                        <%--<th class="text-center">No.</th>--%>
                                        <th class="text-center">Название</th>
                                        <th width="10%">Действия</th>
                                    </tr>
                                    </thead>
                                    <tbody align="center">
                                    <c:forEach items="${organizations}" var="organization">
                                        <tr>
                                            <%--<td>${user[0].id}</td>--%>
                                            <td valign="middle">${organization.name}</td>
                                            <td align="center">
                                        <span class="tooltip-area">
                                            <a href="${pageContext.request.contextPath}/editorganization/${organization.id}" class="btn btn-default btn-sm" title="Редактировать"><i
                                                    class="fa fa-pencil"></i></a></span>
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
<script type="text/javascript">
    jQuery(document).ready(function() {
        $('table[data-provide="data-table"]').dataTable();
    });
</script>

<script type="text/javascript">
    $('table[data-provide="data-table"]')
            .removeClass( 'display' )
            .addClass('table table-striped table-bordered');
</script>
</body>
</html>
