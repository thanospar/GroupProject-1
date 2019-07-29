<div class="uk-width-1-5 leftside  uk-light uk-visible@l">

                    <div class="uk-navbar-left uk-light">

                        <img class="uk-align-center " data-src="<c:url value='/static/images/booklogowhite.png' />" width="131" height="100" alt="" uk-img>
                    </div>
                    <ul class="uk-nav-default uk-nav-parent-icon uk-padding-small " uk-nav>
                        <li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: desktop"></span> Dashboard</a></li>
                    </ul
                    
                    >
                    <ul class="uk-nav-default uk-nav-parent-icon uk-padding-small" uk-nav>
                        <li class="uk-nav-header">Users</li>
                        <li class="uk-parent"><a href="#"><span class="uk-margin-small-right" uk-icon="icon: users"></span> Users</a>

                            <ul class="uk-nav-sub uk-light">
                                <li><a href="<c:url value='/user/newuser' />">Add new</a></li>
                                <li><a href="<c:url value='/user/' />">All Users</a></li>
                            </ul>
                        </li>

                        <li class="uk-nav-header">Shop</li>
                        <li class="uk-parent"><a href="#"><span class="uk-margin-small-right" uk-icon="icon:  tag"></span> Products </a>

                            <ul class="uk-nav-sub">
                                <li><a href="<c:url value='/books/formAddBook' />">Add New Book</a></li>
                                <li><a href="<c:url value='/books' />">View all</a></li>
                                <li class="uk-nav-sub"><a href="<c:url value='/categories' />"><span class="uk-margin-small-right" uk-icon="icon: grid"></span> Category </a>


                                </li>
                                <li class="uk-nav-sub"><a href="<c:url value='/authors' />"><span class="uk-margin-small-right" uk-icon="icon: grid"></span> Authors </a>

                                </li>

                                <li class="uk-parent"><a href="<c:url value='/publishers' />"><span class="uk-margin-small-right" uk-icon="icon: grid"></span> Publishers</a>


                                </li>

                                <li class="uk-parent"><a href="<c:url value='/books' />"><span class="uk-margin-small-right" uk-icon="icon: grid"></span> Quantity</a>


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
                        <li><a href="<c:url value="/user/logout" />" ><span class="uk-margin-small-right" uk-icon="icon: sign-out"></span> Log out</a></li>
                    </ul>



                </div>
