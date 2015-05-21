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
            <li><a href="#">USERS</a></li>
            <li><a href="${pageContext.request.contextPath}/tableuser"> EDIT USER</a></li>
            <li class="active">USERS</li>
        </ol>
        <!-- //breadcrumb-->

        <div id="content">

            <div class="row">

                <div class="col-lg-8">
                <section class="panel">
                    <header class="panel-heading">
                        <h2><strong>EDIT</strong> USER</h2>
                    </header>
                    <div class="panel-body">
                        <form id="formID" class="form-horizontal" method="post" action="${pageContext.request.contextPath}/updateuser" commandName="updateuser" data-collabel="3" data-alignlabel="right"  data-parsley-validate>
                            <div class="form-group">
                                <label class="control-label">No.</label>
                                <div class="input-icon"> <i class="fa fa-map-marker ico"></i>
                                    <input class="form-control rounded " name="id" type="text" value="${user.id}"  readonly >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label">Full name</label>
                                <div class="input-icon"> <i class="fa fa-user ico"></i>
                                    <input class="form-control rounded" name="name" parsley-required="true" parsley-minlength="4"  parsley-validation-minlength="3"  parsley-trigger="change" type="text" placeholder="Full name" value="${user.name}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label">Login</label>
                                <div class="input-icon"> <i class="fa fa-user ico"></i>
                                    <input class="form-control rounded" name="username" parsley-required="true" parsley-minlength="4"  parsley-validation-minlength="3" parsley-trigger="change" type="text" placeholder="Login" value="${user.username}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Password</label>
                                <div class="input-icon"> <i class="fa fa-key ico"></i>
                                    <input class="form-control rounded" name="password" parsley-required="true" parsley-minlength="6" parsley-validation-minlength="3" parsley-trigger="change" type="password" placeholder="Password" value="${user.password}">
                                </div>
                            </div>

                            <div class="form-group">
                                <ul>
                                    <li>
                                        <c:if test="${user.status=='ACTIVE'}">
                                        <div class="ios-switch theme-inverse pull-right">
                                            <div class="switch"><input type="checkbox" name="status" checked></div>
                                        </div>
                                        <label class="control-label">Status <span>ON</span></label>
                                        </c:if>

                                        <c:if test="${user.status!='ACTIVE'}">
                                            <div class="ios-switch theme-inverse pull-right">
                                                <div class="switch"><input type="checkbox" name="status" ></div>
                                            </div>
                                            <label class="control-label">Status <span>OFF</span></label>
                                        </c:if>


                                    </li>
                                </ul>
                            </div>
                                <div class="form-group">
                                    <label class="control-label">Credentials left: all rules, right: user rules </label>
                                    <div>
                                        <select multiple="multiple" id="my-select" name="select[]" parsley-required="true" parsley-error-container="div#select-com-error">
                                            <c:forEach items="${rules}" var="rule">
                                                <option value="${rule.id}" selected="selected">${rule.nameRule}</option>
                                            </c:forEach>

                                            <c:forEach items="${allrules}" var="rule">
                                                <option value="${rule.id}" >${rule.nameRule}</option>
                                            </c:forEach>
                                        </select>
                                        <div id="select-com-error"></div>
                                    </div>
                                </div><!-- //form-group-->
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

</body>
</html>
