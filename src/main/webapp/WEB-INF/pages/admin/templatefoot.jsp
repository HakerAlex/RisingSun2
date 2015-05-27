<!--
//////////////////////////////////////////////////////////////
//////////     LEFT NAV MENU     //////////
///////////////////////////////////////////////////////////
-->
<nav id="menu"  data-search="close">
  <ul>

  <sec:authorize access="hasRole('Admin')">
    <li><span><i class="icon fa fa-smile-o"></i> USERS</span>
      <ul>
        <li><a href="/tableuser"><i class="icon  fa fa-th"></i> EDIT USER </a></li>
        <li><a href="/adduser"><i class="icon  fa fa-rocket"></i> ADD USER </a></li>
      </ul>
    </li>
  </sec:authorize>


    <li><span><i class="icon  fa fa-inbox"></i> ARTICLES</span>
      <ul>
        <li><a href="/tablearticles"><i class="icon  fa fa-th"></i> EDIT ARTICLE </a></li>
        <sec:authorize access="hasRole('Admin') or hasRole('Editor') or hasRole('Author')">
          <li><a href="/addarticles"><i class="icon  fa fa-rocket"></i> ADD ARCTICLE </a></li>
        </sec:authorize>
      </ul>
    </li>

    <sec:authorize access="hasRole('Admin') or hasRole('Editor')">
    <li><span><i class="icon  fa fa-laptop"></i> FIRSTPAGE</span>
      <ul>

          <li><a href="/tablefirstpage"><i class="icon  fa fa-rocket"></i> EDIT FIRST PAGE </a></li>
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
    <li class="Label label-lg">Theme color</li>
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
