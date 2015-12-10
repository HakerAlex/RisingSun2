<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
            <li><a href="#">СТАТЬИ</a></li>
            <li><a href="${pageContext.request.contextPath}/tablearticles"> РЕДАКТИРОВАНИЕ СТАТЬИ</a></li>
            <li class="active">СТАТЬИ</li>
        </ol>
        <!-- //breadcrumb-->

        <div id="content">

            <div class="row">
                <form id="formID" class="form-horizontal" method="post"
                      action="${pageContext.request.contextPath}/updatearticle" commandName="updatearticle" data-collabel="3"
                      data-alignlabel="right" data-parsley-validate>
                    <div class="col-lg-5">
                        <section class="panel" style="height:100%">
                            <header class="panel-heading">
                                <h2><strong>РЕДАКТИРОВАНИЕ</strong> СТАТЬИ </h2>
                            </header>

                            <div class="panel-body">
                                <div class="form-group">
                                    <label class="control-label">No.</label>
                                    <div class="input-icon"> <i class="fa fa-map-marker ico"></i>
                                        <input class="form-control rounded " name="id" type="text" value="${arcticle.id}"  readonly >
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label">Заголовок</label>
                                    <div class="input-icon"> <i class="fa fa-pencil ico"></i>
                                        <input class="form-control rounded" name="title" parsley-required="true" parsley-minlength="4"  parsley-validation-minlength="3"  parsley-trigger="change" type="text" placeholder="Заголовок" value="${arcticle.title}">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label">Псевдоним страницы</label>
                                    <div class="input-icon"> <i class="fa fa-pencil ico"></i>
                                        <input class="form-control rounded" name="namepage" parsley-required="true" parsley-minlength="4"  parsley-validation-minlength="3"  parsley-trigger="change" type="text" placeholder="Псевдоним" value="${arcticle.namePage}">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label">Рисунок</label>
                                    <div class="input-icon"> <i class="fa fa-pencil ico"></i>
                                        <input class="form-control rounded" name="image"   parsley-trigger="change" type="text" placeholder="Рисунок" value="${arcticle.image}">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <ul>
                                        <li>
                                            <c:if test="${arcticle.archive==true}">
                                                <div class="ios-switch theme-inverse pull-right">
                                                    <div class="switch"><input type="checkbox" name="archive" checked></div>
                                                </div>
                                                <label class="control-label">В архиве <span>ON</span></label>
                                            </c:if>

                                            <c:if test="${arcticle.archive!=true}">
                                                <div class="ios-switch theme-inverse pull-right">
                                                    <div class="switch"><input type="checkbox" name="archive" ></div>
                                                </div>
                                                <label class="control-label">В архиве <span>OFF</span></label>
                                            </c:if>


                                        </li>
                                    </ul>
                                </div>

                                <div class="form-group">
                                    <label class="control-label">Автор</label>


                                    <c:set var="flag" value="0"/>
                                    <sec:authorize access="hasRole('Admin') or hasRole('Editor')">
                                        <c:set var="flag" value="1"/>
                                        <div>
                                            <select class="selectpicker form-control rounded" data-size="10"
                                                    data-live-search="true" name="author">
                                                <c:forEach items="${authors}" var="author">
                                                    <c:if test="${author.id!=arcticle.usersByAuthor.id}">
                                                        <option value="${author.name}" >${author.name}</option>
                                                    </c:if>

                                                    <c:if test="${author.id==arcticle.usersByAuthor.id}">
                                                        <option value="${author.name}" selected="selected">${author.name}</option>
                                                    </c:if>

                                                </c:forEach>
                                            </select>
                                        </div>
                                    </sec:authorize>


                                    <sec:authorize access="hasRole('Author') or hasRole('Corrector')">
                                        <c:if test="${flag==0}">
                                            <div class="input-icon"><i class="fa fa-user ico"></i>
                                                <input class="form-control rounded" name="author"
                                                       parsley-trigger="change" type="text" value="${arcticle.usersByAuthor.name}"
                                                       readonly>
                                            </div>
                                        </c:if>
                                    </sec:authorize>


                                </div>

                                <div class="form-group">
                                    <label class="control-label"> Дата создания </label>
                                    <div class="input-icon"> <i class="fa fa-calendar ico"></i>
                                        <input class="form-control rounded" name="dateCreate" type="text" placeholder="Дата создания" value="${arcticle.dateCreate}" readonly>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label">Теги</label>
                                    <div>
                                        <select multiple data-role="tagsinput" name="tags[]">
                                            <c:forEach items="${tags}" var="tag">
                                                <option value="${tag.name}" selected="selected">${tag.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>


                            </div>

                            <footer class="panel-footer">
                                <button type="submit" class="btn btn-theme">Обновить</button>
                            </footer>

                        </section>
                    </div>

                    <div class="col-lg-7">
                        <section class="panel" style="height: 100%">
                            <header class="panel-heading">
                                <h2><strong>РЕДАКТИРОВАТЬ</strong> ТЕКСТ СТАТЬИ </h2>
                            </header>

                            <div class="panel-body">
                                    <div class="panel-body">
                                            <div class="form-group">
                                                <div>
                                                    <textarea cols="80" id="editorCk" name="article" rows="30" style="height: 90%">${arcticle.article}</textarea>
                                                </div>
                                            </div>
                                    </div>
                            </div>

                        </section>
                    </div>

                </form>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/plugins/form/form.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/plugins/ckeditor/ckeditor.js"></script>
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
        $('table[data-provide="data-table"]').dataTable({
            "iDisplayLength": 5
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
    // Call CkEditor
    CKEDITOR.replace( 'editorCk', {
        removePlugins:'maximize, source',
        language: 'ru',
        height:350,
        entities : false,
        width:600,
        startupFocus : false,
        uiColor: '#FFFFFF'
    });
</script>

<script>
    $('input#taginputs').tagsinput();
</script>
</body>
</html>
