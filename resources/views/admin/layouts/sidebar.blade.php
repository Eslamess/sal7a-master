<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
    <div class="menu_section">
        <ul class="nav side-menu">

            <li><a href="{{route('dashboard.home')}}"><i class="fa fa-home"></i> الرئيسية </a></li>

            <li>
                <a><i class="fa fa-user-secret"></i> المديرين <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li>
                        <a href="{{route('dashboard.admin.index')}}"><i class="fa fa-eye"></i>
                            <span>عرض الكل</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{route('dashboard.admin.create')}}"><i class="fa fa-plus"></i>
                            <span>اضافه مدير </span>
                        </a>
                    </li>

                </ul>
            </li>

            <li>
                <a><i class="fa fa-users"></i> الوكلاء <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li>
                        <a href="{{route('dashboard.contractor.index')}}"><i class="fa fa-eye"></i>
                            <span>عرض الكل</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{route('dashboard.contractor.create')}}"><i class="fa fa-plus"></i>
                            <span>اضافه وكيل </span>
                        </a>
                    </li>

                </ul>
            </li>
            <li>
                <a><i class="fa fa-user-plus"></i> الأعضاء <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li>
                        <a href="{{route('dashboard.user.index')}}"><i class="fa fa-eye"></i>
                            <span>عرض الكل</span>
                        </a>
                    </li>
                </ul>
            </li>

            <li>
                <a><i class="fa fa-user-circle"></i> العمال <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li>
                        <a href="{{route('dashboard.agent.index')}}"><i class="fa fa-eye"></i>
                            <span>عرض الكل</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{route('dashboard.agent.create')}}"><i class="fa fa-plus"></i>
                            <span>اضافة عميل</span>
                        </a>
                    </li>
                </ul>
            </li>

            <li>
                <a><i class="fa fa-shopping-cart"></i> الطلبات <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li>
                        <a href="{{route('dashboard.order.index')}}"><i class="fa fa-eye"></i>
                            <span>عرض الكل</span>
                        </a>
                    </li>
                </ul>
            </li>

            <li>
                <a><i class="fa fa-building"></i> المدن <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li>
                        <a href="{{route('dashboard.city.index')}}"><i class="fa fa-eye"></i>
                            <span>عرض الكل</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{route('dashboard.city.create')}}"><i class="fa fa-plus"></i>
                            <span>إضافة مدينة</span>
                        </a>
                    </li>
                </ul>
            </li>

            <li>
                <a><i class="fa fa-server"></i> الخدمات <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li>
                        <a href="{{route('dashboard.category.index')}}"><i class="fa fa-eye"></i>
                            <span>عرض الكل</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{route('dashboard.category.create')}}"><i class="fa fa-plus"></i>
                            <span>إضافة خدمة</span>
                        </a>
                    </li>
                </ul>
            </li>

            <li>
                <a><i class="fa fa-pagelines"></i> الصفحات <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li>
                        <a href="{{route('dashboard.page.index')}}"><i class="fa fa-eye"></i>
                            <span>عرض الكل</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a><i class="fa fa-star"></i> التقييمات <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li>
                        <a href="{{route('dashboard.rateings')}}"><i class="fa fa-chevron-down"></i>
                            <span>الطلبات</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{route('dashboard.apprateings')}}"><i class="fa fa-chevron-down"></i>
                            <span>التطبيق</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a><i class="fa fa-money"></i> الخصومات <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li>
                        <a href="{{route('dashboard.offers.index')}}"><i class="fa fa-eye"></i>
                            <span>عرض الكل</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{route('dashboard.offers.create')}}"><i class="fa fa-plus"></i>
                            <span>اضافة خصم</span>
                        </a>
                    </li>

                </ul>
            </li>
            <li>
                <a href="{{route('dashboard.point.edit',1)}}"><i class="fa fa-dot-circle-o"></i>
                    <span>النقاط</span>
                </a>
            </li>
        </ul>
    </div>
</div>
