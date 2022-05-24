<!DOCTYPE html>
<html lang="fa" dir="ltr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="fontiran.com:license" content="Y68A9">
    <link rel="icon" href="{{ url('assets/dashboard') }}/build/images/favicon.ico" type="image/ico"/>
    <title> {{config('app.name')}} </title>
<!-- Bootstrap -->
    <link href="{{ url('assets/dashboard') }}/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="{{ url('assets/dashboard') }}/vendors/bootstrap-rtl/dist/css/bootstrap-rtl.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="{{ url('assets/dashboard') }}/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="{{ url('assets/dashboard') }}/vendors/nprogress/nprogress.css" rel="stylesheet">

    <link href="{{ url('assets/dashboard') }}/build/css/owl.carousel.min.css" rel="stylesheet">
    <link href="{{ url('assets/dashboard') }}/build/css/owl.theme.default.min.css" rel="stylesheet">
    <!-- bootstrap-progressbar -->
    <link href="{{ url('assets/dashboard') }}/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
          rel="stylesheet">
    <!-- iCheck -->
    <script
        src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
        crossorigin="anonymous"></script>
    <link href="{{ url('assets/dashboard') }}/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="{{ url('assets/dashboard') }}/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet"/>
    <!-- Custom Theme Style -->
    <link href="{{ url('assets/dashboard') }}/build/css/custom.min.css" rel="stylesheet">
    <link href="{{ url('assets/dashboard') }}/build/css/cart.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.18/datatables.min.css"/>
    <script src="https://www.gstatic.com/firebasejs/7.0.0/firebase-app.js"></script>
    <!-- TODO: Add SDKs for Firebase products that you want to use
         https://firebase.google.com/docs/web/setup#available-libraries -->
    <script src="https://www.gstatic.com/firebasejs/7.0.0/firebase-analytics.js"></script>

    <script src="https://www.gstatic.com/firebasejs/6.3.4/firebase-messaging.js"></script>

    <link rel="manifest" type="text/css" href="{{url('js/manifest.json')}}">
    <script src="{{ url('js/firebase.js') }}" ></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/notify/0.4.2/notify.min.js"></script>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">





    <style>
        .modals {
            background: #e7e5e5;
            display: flex;
            direction: rtl;
            margin: 20px 30px;
            border-radius: 100px 100px;
            box-shadow: 4px 6px 7px #8e8a8a78;
        }

        .modals .modalImg img {
            width: 100%;
            border-radius: 0px 100px 100px 0px;
            position: relative;
            /*top: 2px*/
        }

        .modals .modalImg, .modals .modalDetails {
            width: 50%
        }

        .modals .modalDetails {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            line-height: 0px
        }
    </style>

</head>
<!-- /header content -->
