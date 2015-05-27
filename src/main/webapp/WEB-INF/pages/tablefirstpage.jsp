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
            <li><a href="#">FIRST PAGE</a></li>
            <li><a href="#"> EDIT FIRST PAGE</a></li>
            <li class="active">FIRST PAGE</li>
        </ol>
        <!-- //breadcrumb-->

        <div id="content">

            <div class="row">

                <div class="col-lg-6">

                    <section class="panel">
                        <header class="panel-heading">
                            <h2><strong>Table</strong> FIRST PAGE </h2>
                        </header>

                        <div class="panel-body">
                            <%--<div class="table-responsive">--%>
                                <table cellpadding="0" cellspacing="0" border="0" class="display" data-provide="data-table">
                                    <thead>
                                    <tr>
                                        <th align="center">Title article</th>
                                        <th align="center">Date create</th>
                                        <th align="center">Author</th>
                                        <th align="center">Raiting</th>
                                        <th align="center">Feature</th>
                                        <th width="15%">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${firstpages}" var="firstpage">
                                        <tr>
                                            <td align="center">${firstpage[1].title}</td>
                                            <td align="center">${firstpage[1].dateCreate}</td>
                                            <td align="center">${firstpage[2].name}</td>
                                            <td align="center"><span class="badge bg-success">${firstpage[0].raiting}</span></td>

                                            <td align="center">
                                                <c:if test="${firstpage[0].feature==false}">
                                                    <span class="label bg-success">FALSE</span>
                                                </c:if>
                                                <c:if test="${firstpage[0].feature==true}">
                                                    <span class="label bg-danger">TRUE</span>
                                                </c:if>
                                            </td>

                                            <td align="center">
                                        <span class="tooltip-area">
                                             <sec:authorize access="hasAnyRole('Admin','Editor')">
                                                <a href="/editfirstpage/${firstpage[0].id}" class="btn btn-default btn-sm" title="Edit"><i class="fa fa-pencil"></i></a>
                                                <a href="/deletefirstpage/${firstpage[0].id}" data-confirm="Are you sure you want to delete?" class="btn btn-default btn-sm" title="Delete"><i class="fa fa-trash-o"></i></a>
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


                <div class="col-lg-6">

                    <section class="panel">
                        <header class="panel-heading">
                            <h2><strong>Table</strong> ARTICLES </h2>
                        </header>

                        <div class="panel-body">
                            <%--<div class="table-responsive">--%>
                                <table class="display" data-provide="data-table">
                                    <thead>
                                    <tr>
                                        <th>Title article</th>
                                        <th>Date create</th>
                                        <th>Author</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${articles}" var="article">
                                        <tr>
                                            <td  valign="middle">${article[0].title}</td>
                                            <td  valign="middle">${article[0].dateCreate}</td>
                                            <td  valign="middle">${article[1].name}</td>
                                            <td align="center">
                                        <span class="tooltip-area">
                                             <sec:authorize access="hasAnyRole('Admin','Editor')">
                                                 <a data-toggle="modal" value="${article[0].id}" data-target="#md-normal" onclick="newVal(this)" href="#"><i class="fa fa-desktop"></i></a>
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


        <div id="md-normal" class="modal fade">
            <form id="addfirst" name="addfirst" method="post" action="${pageContext.request.contextPath}/addtofirstpage" commandname="addfirst">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                <h4 class="modal-title">Please confirm add to first page</h4>
            </div>
            <!-- //modal-header-->
            <div class="modal-body">
                <label class="control-label">Raiting </label>
                <div class="cp-slider-wrapper" data-color="green"  data-max="100" data-range="min" data-value="50">
                    <input type="hidden" name="raiting" id="raiting" />
                    <nav>
                        <a href="#" class="cp-prev"><i class="fa fa-chevron-left"></i></a>
                        <a href="#" class="cp-next"><i class="fa fa-chevron-right"></i></a>
                    </nav>
                </div>

                <div class="form-group">
                    <label class="control-label">Feature</label>
                    <div>
                        <label class="checkbox-inline">
                            <input type="checkbox" name="feature" id="feature">
                            </label>
                    </div>
                </div>
            </div>
            <!-- //modal-body-->
            <div class="modal-footer">
                <button type="button " data-dismiss="modal" class="btn btn-inverse">Cancel</button>
                <button type="submit" class="btn btn-theme" name="id" id="butOk">Add</button>
            </div>
            </form>
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
                value:50,
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


<script type="text/javascript">
    function newVal(t){
        var res = $(t).attr('value');
        $('#butOk').val(res);
        return false;
    }
</script>


</body>
</html>
