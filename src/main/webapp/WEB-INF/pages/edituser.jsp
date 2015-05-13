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
<body>
<div id="wrapper">
  <%@ include file="../pages/admin/template.jsp" %>


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

</body>
</html>
