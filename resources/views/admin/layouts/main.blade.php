@include('admin.layouts.header')
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <div class="col-md-3 left_col hidden-print">
            <div class="left_col scroll-view">
                <div class="navbar nav_title" style="border: 0;">
                    <a href="{{ route('dashboard.home') }}" class="site_title">
                        <img src="{{asset('assets/logo.png')}}" alt="" class="img img-fluid" style="width: 35px">
                        <span>{{config('app.name')}}</span>
                    </a>
                </div>

                <div class="clearfix"></div>

                @if(Auth::guard('admin')->user()->supervisor != 1)
                <!-- sidebar menu admin-->
                @include('admin.layouts.sidebar')
                <!-- /sidebar menu admin-->
                @else
                    @include('admin.layouts.contractorSidebar')
                @endif
                <!-- /menu footer buttons -->
                @include('admin.layouts.menu-footer-buttons')
                <!-- /menu footer buttons -->
            </div>
        </div>

        <!-- top navigation -->
        @include('admin.layouts.top-navigation')
    <!-- /top navigation -->
        <!-- /header content -->

        <!-- page content -->
        <div class="right_col" role="main">
            @yield('content')
        </div>
        <!-- /page content -->

@include('admin.layouts.footer')
