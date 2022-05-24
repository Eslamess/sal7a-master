<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
    <div class="menu_section">
        <ul class="nav side-menu">

            <li><a href="{{route('dashboard.home')}}"><i class="fa fa-home"></i> الرئيسية </a></li>

            <li>
                <a><i class="fa fa-chain"></i> العمال <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li>
                        <a href="{{route('dashboard.contractorAgent.index')}}"><i class="fa fa-eye"></i>
                            <span>عرض الكل</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{route('dashboard.contractorAgent.create')}}"><i class="fa fa-eye"></i>
                            <span>اضافة عميل</span>
                        </a>
                    </li>
                </ul>
            </li>

            <li>
                <a><i class="fa fa-chain"></i> الطلبات <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li>
                        <a href="{{route('dashboard.contractorOrder.index')}}"><i class="fa fa-eye"></i>
                            <span>عرض الكل</span>
                        </a>
                    </li>
                </ul>
            </li>



        </ul>
    </div>
</div>
