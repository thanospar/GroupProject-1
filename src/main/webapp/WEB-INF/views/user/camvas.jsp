<div id="offcanvas-usage" uk-offcanvas>
                <div class="uk-offcanvas-bar">

                    <button class="uk-offcanvas-close" type="button" uk-close></button>

                    <div class="uk-navbar-left">

                        <a class="uk-navbar-item uk-logo" href="#">Boox</a>
                    </div>
                    <ul class="uk-nav-default uk-nav-parent-icon uk-padding-small" uk-nav>
                        <li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: desktop"></span> Dashboard</a></li>
                    </ul>
                    <ul class="uk-nav-default uk-nav-parent-icon uk-padding-small" uk-nav>
                        <li class="uk-nav-header">Users</li>
                        <li class="uk-parent"><a href="#"><span class="uk-margin-small-right" uk-icon="icon: users"></span> Users</a>

                            <ul class="uk-nav-sub">
                                <li><a href="<c:url value='/user/newuser' />">Add new</a></li>
                                <li><a href="#">All Users</a></li>
                            </ul>
                        </li>

                        <li class="uk-nav-header">Shop</li>
                        <li class="uk-parent"><a href="#"><span class="uk-margin-small-right" uk-icon="icon:  tag"></span> Products </a>

                            <ul class="uk-nav-sub">
                                <li><a href="#">Add new</a></li>
                                <li><a href="#">View all</a></li>
                                <li class="uk-nav-sub"><a href="#"><span class="uk-margin-small-right" uk-icon="icon: grid"></span> Category </a>


                                </li>
                                <li class="uk-nav-sub"><a href="#"><span class="uk-margin-small-right" uk-icon="icon: grid"></span> Authors </a>

                                </li>

                                <li class="uk-parent"><a href="#"><span class="uk-margin-small-right" uk-icon="icon: grid"></span> Publishers</a>


                                </li>

                                <li class="uk-parent"><a href="#"><span class="uk-margin-small-right" uk-icon="icon: grid"></span> Quantity</a>


                                </li>

                            </ul>
                        </li>
                        <li class="uk-parent"><a href="#"><span class="uk-margin-small-right" uk-icon="icon:  cart"></span> Orders </a>

                            <ul class="uk-nav-sub">
                                <li><a href="#">Add new</a></li>
                                <li><a href="#">View all</a></li>
                            </ul>
                        </li>
                        <li class="uk-nav-divider"></li>
                        <li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: sign-out"></span> Log out</a></li>
                    </ul>



                </div>
            </div>
