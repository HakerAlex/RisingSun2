
  <!--
  /////////////////////////////////////////////////////////////////////////
  //////////     HEADER  CONTENT     ///////////////
  //////////////////////////////////////////////////////////////////////
  -->
  <div id="header">

    <div class="logo-area clearfix">
      <a href="#" class="logo"></a>
    </div>
    <!-- //logo-area-->

    <div class="tools-bar">

      <ul class="nav navbar-nav nav-main-xs">
        <li><a href="#" class="icon-toolsbar nav-mini"><i class="fa fa-bars"></i></a></li>
      </ul>

      <ul class="nav navbar-nav navbar-right tooltip-area">
        <li><a href="#menu-right" data-toggle="tooltip" title="Right Menu" data-container="body" data-placement="left"><i class="fa fa-align-right"></i></a></li>
        <li><a href="#" class="nav-collapse avatar-header" data-toggle="tooltip" title="Show / hide  menu" data-container="body" data-placement="bottom">
          <img alt="" src="${pageContext.request.contextPath}/resources/assets/img/avatar.png"  class="circle">
        </a>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">
            <em><strong>Hi</strong>,
              <sec:authorize access="isAuthenticated()">
                <sec:authentication property="principal.username"/>
              </sec:authorize> </em> <i class="dropdown-icon fa fa-angle-down"></i>
          </a>
          <ul class="dropdown-menu pull-right icon-right arrow">

            <sec:authorize access="isAuthenticated()">
              <li><a href="/j_spring_security_logout"><i class="fa fa-sign-out"></i> Signout </a></li>
            </sec:authorize>

          </ul>
          <!-- //dropdown-menu-->
        </li>
        <li class="visible-lg">
          <a href="#" class="h-seperate fullscreen" data-toggle="tooltip" title="Full Screen" data-container="body"  data-placement="left">
            <i class="fa fa-expand"></i>
          </a>
        </li>
      </ul>
    </div>
    <!-- //tools-bar-->

  </div>
  <!-- //header-->


  <!--
  /////////////////////////////////////////////////////////////////////////
  //////////     SLIDE LEFT CONTENT     //////////
  //////////////////////////////////////////////////////////////////////
  -->
  <%--<div id="nav">--%>
    <%--<div id="nav-scroll">--%>
      <%--<div class="avatar-slide">--%>

								<%--<span class="easy-chart avatar-chart" data-color="theme-inverse" data-line-width="1" data-size="118">--%>
										<%--<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/avatar.png" class="circle">--%>
								<%--</span>--%>
        <%--<!-- //avatar-chart-->--%>

        <%--<div class="avatar-detail">--%>
          <%--<p><strong>Hi</strong>,--%>
            <%--<sec:authorize access="isAuthenticated()">--%>
              <%--<sec:authentication property="principal.username"/>--%>
            <%--</sec:authorize></p>--%>
        <%--</div>--%>
        <%--<!-- //avatar-detail-->--%>


        <%--<!-- //avatar-link-->--%>

      <%--</div>--%>



    <%--</div>--%>
    <%--<!-- //nav-scroller-->--%>
  <%--</div>--%>
  <!-- //nav-->


  <!--
  /////////////////////////////////////////////////////////////////////////
  //////////     TOP SEARCH CONTENT     ///////
  //////////////////////////////////////////////////////////////////////
  -->
  <%--<div class="widget-top-search">--%>
    <%--<span class="icon"><a href="#" class="close-header-search"><i class="fa fa-times"></i></a></span>--%>
    <%--<form id="top-search">--%>
      <%--<h2><strong>Quick</strong> Search</h2>--%>
      <%--<div class="input-group">--%>
        <%--<input  type="text" name="q" placeholder="Find something..." class="form-control" />--%>
							<%--<span class="input-group-btn">--%>
							<%--<button class="btn" type="button" title="With Sound"><i class="fa fa-microphone"></i></button>--%>
							<%--<button class="btn" type="button" title="Visual Keyboard"><i class="fa fa-keyboard-o"></i></button>--%>
							<%--<button class="btn" type="button" title="Advance Search"><i class="fa fa-th"></i></button>--%>
							<%--</span>--%>
      <%--</div>--%>
    <%--</form>--%>
  <%--</div>--%>





<!-- //wrapper-->

