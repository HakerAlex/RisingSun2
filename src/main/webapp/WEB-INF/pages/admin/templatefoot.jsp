<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!--
//////////////////////////////////////////////////////////////
//////////     LEFT NAV MENU     //////////
///////////////////////////////////////////////////////////
-->
<nav id="menu"  data-search="close">
  <ul>

  <sec:authorize access="hasRole('Admin')">
    <li><span><i class="icon fa fa-smile-o"></i> ПОЛЬЗОВАТЕЛИ</span>
      <ul>
        <li><a href="${pageContext.request.contextPath}/tableuser"><i class="icon  fa fa-th"></i> РЕДАКТИРОВАТЬ ПОЛЬЗОВАТЕЛЯ </a></li>
        <li><a href="${pageContext.request.contextPath}/adduser"><i class="icon  fa fa-rocket"></i> ДОБАВИТЬ ПОЛЬЗОВАТЕЛЯ </a></li>
      </ul>
    </li>
  </sec:authorize>


    <li><span><i class="icon  fa fa-inbox"></i> СТАТЬИ</span>
      <ul>
        <li><a href="${pageContext.request.contextPath}/tablearticles"><i class="icon  fa fa-th"></i> РЕДАКТИРОВАТЬ СТАТЬЮ </a></li>
        <sec:authorize access="hasRole('Admin') or hasRole('Editor') or hasRole('Author')">
          <li><a href="${pageContext.request.contextPath}/addarticles"><i class="icon  fa fa-rocket"></i> ДОБАВИТЬ СТАТЬЮ </a></li>
        </sec:authorize>
      </ul>
    </li>


  <sec:authorize access="hasRole('Admin')">
    <li><span><i class="icon  fa fa-cutlery"></i> ОРГАНИЗАЦИИ</span>
      <ul>
        <li><a href="${pageContext.request.contextPath}/tableorganization"><i class="icon  fa fa-th"></i> РЕДАКТИРОВАТЬ ОРГАНИЗАЦИЮ </a></li>
        <li><a href="${pageContext.request.contextPath}/addorganization"><i class="icon  fa fa-rocket"></i> ДОБАВИТЬ ОРГАНИЗАЦИЮ </a></li>
      </ul>
    </li>
  </sec:authorize>

    <sec:authorize access="hasRole('Admin') or hasRole('Editor')">
    <li><span><i class="icon  fa fa-laptop"></i> ПЕРВАЯ СТРАНИЦА</span>
      <ul>

          <li><a href="${pageContext.request.contextPath}/tablefirstpage"><i class="icon  fa fa-rocket"></i> РЕДАКТИРОВАТЬ ПЕРВУЮ СТРАНИЦУ </a></li>
      </ul>
    </li>
    </sec:authorize>
  </ul>
</nav>
<!-- //nav left menu-->


<!--
/////////////////////////////////////////////////////////////////
//////////     RIGHT NAV MENU     //////////
/////////////////////////////////////////////////////////////
-->
<nav id="menu-right">
  <ul>
    <li class="Label label-lg">Цветовые темы</li>
    <li>
							<span class="text-center">
								<div id="style1" class="color-themes col1"></div>
								<div id="style2" class="color-themes col2" ></div>
								<div id="style3" class="color-themes col3" ></div>
								<div id="style4" class="color-themes col4" ></div>
								<div id="none" class="color-themes col5" ></div>
							</span>
    </li>
  </ul>
</nav>
<!-- //nav right menu-->
