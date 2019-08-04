    <!-- nav bar -->
    <div uk-sticky="media: 960" class="uk-navbar-container tm-navbar-container uk-sticky uk-active uk-sticky-fixed"
        style="position: fixed; top: 0px; width: 1265px;">
        <div class="uk-container uk-container-expand">
            <nav class="uk-navbar">
                <div class="uk-navbar-center"><a href="" class="uk-navbar-item uk-logo"><img src="<c:url value='/static/images/booklogo.png' />" class="uk-margin-small-right" style="height:75px;">
                    </a></div>
                    <div class="uk-navbar-left">
                            <ul class="uk-navbar-nav">
                                
                       
                                <li> <a class="uk-navbar-toggle" uk-navbar-toggle-icon href="#" uk-toggle="target: #offcanvas-push" ></a>
                                </li>
                                
                                
                            </ul>
                          
                        </div>
                <div class="uk-navbar-right">
                    <ul class="uk-navbar-nav ">
                        
                
                        <li><a href="<c:url value="/user/" />" uk-icon="icon: user"></a>
                        </li>
                        <li><a  href="<c:url value='/cart/{{toBuy}}' />" uk-icon="icon: cart"><span class="uk-badge" id="buyCount"></span></a>
                       

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
        <li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: receiver"></span>Contact</a></li>
    </ul>
</div>
    </div>
</div>
