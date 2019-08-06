    <!-- nav bar -->
    <div uk-sticky="media: 960" class="uk-navbar-container tm-navbar-container uk-sticky uk-active uk-sticky-fixed"
        style="position: fixed; top: 0px; width: 1265px;">
        <div class="uk-container uk-container-expand">
            <nav class="uk-navbar">
                <div class="uk-navbar-center"><a href="<c:url value='/' />" class="uk-navbar-item uk-logo"><img src="<c:url value='/static/images/booklogo.png' />" class="uk-margin-small-right" style="height:75px;">
                    </a></div>
                    <div class="uk-navbar-left">
                            <ul class="uk-navbar-nav">
                                
                       
                                <li> <a class="uk-navbar-toggle" uk-navbar-toggle-icon href="#" uk-toggle="target: #offcanvas-push" ></a>
                                </li>
                                
                                
                            </ul>
                          
                        </div>
                <div class="uk-navbar-right">
                    <ul class="uk-navbar-nav ">
                        
                
                        <li><a href="<c:url value="/user/" />" ratio="1.2" uk-icon="icon: user"></a>
                        </li>
                        <li><a  href="<c:url value="/user/" />"  ratio="1.2" uk-icon="icon: cart"><span class="uk-badge uk-padding-bottom">2</span></a>
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
    </div>
    
    <div id="offcanvas-push" uk-offcanvas="mode: push; overlay: true">
    <div class="uk-offcanvas-bar">

        <button class="uk-offcanvas-close" type="button" uk-close></button>

        <div class="uk-width-1-2@s">
    <ul class="uk-nav-primary uk-nav-parent-icon" uk-nav>
        <li class="uk-active"><a href="<c:url value='/' />"><span class="uk-margin-small-right" uk-icon="icon: home"></span>Home</a></li>
        <li class="">
            <a href="<c:url value='/shop' />"><span class="uk-margin-small-right" uk-icon="icon: cart"></span>Shop</a>
            
        </li>
        <li class="">
            <a href="#"><span class="uk-margin-small-right" uk-icon="icon: info"></span>About</a>
            
        </li>
        <li><a href="<c:url value='/chat/' />"><span class="uk-margin-small-right" uk-icon="icon: users"></span>Chat</a></li>
    </ul>
</div>
    </div>
</div>
