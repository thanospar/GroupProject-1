 <div>
                        <nav id= "navbar" class="uk-navbar-container tm-navbar-container uk-card uk-card-default" uk-navbar>

                            <div class="uk-navbar-left ">

                                <div class="uk-navbar-item  uk-hidden@m ">
                                    <a class="uk-navbar-toggle " uk-navbar-toggle-icon href="#" uk-toggle="target: #offcanvas-usage"></a>
                                </div>

                            </div>

                            <div class="uk-navbar-right">

                                <ul class="uk-navbar-nav">

                                    <li>
                                        <a href="#"><span uk-icon="user" style="color:green;"></span> <security:authorize access="isAuthenticated()">
  Hello,   <security:authentication property="principal.username" /> 
</security:authorize> </a>
                                        <div class="uk-navbar-dropdown">
                                            <ul class="uk-nav uk-navbar-dropdown-nav">
                                                <li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: user"></span> Profile</a></li>
                                                <li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: cog"></span> Settings</a></li>
                                                <li class="uk-nav-divider"></li>
                                                <li><a href="<c:url value="/user/logout" />" ><span class="uk-margin-small-right" uk-icon="icon: sign-out"></span> Log out</a></li>
                                            </ul>
                                        </div>

                                    </li>

                                </ul>

                            </div>
                        </nav>

                    </div>
