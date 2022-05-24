<!DOCTYPE html>
<html lang="en" dir="rtl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>صلحها</title>
    <link rel="icon" type="image/ico" href="{{asset('assets/logo.png')}}"/>
    <link rel="stylesheet" href="{{asset('css/libs/normalize.css')}}"/>
    <link rel="stylesheet" href="{{asset('css/libs/hover-min.css')}}"/>
    <link rel="stylesheet" href="{{asset('css/libs/animate.css')}}"/>
    <link rel="stylesheet" href="{{asset('css/libs/bootstrap.min.css')}}"/>
    <link rel="stylesheet" href="{{asset('css/main.css')}}"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
          integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Cairo&amp;display=swap"/>
<!--[if lt IE 9]>
    <script src="{{asset('js/libs/html5shiv.min.js')}}"></script><![endif]-->
</head>
<body>
<section class="navbar-section">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light text-center"><a class="navbar-brand" href="{{route('user.home')}}"> <img
                    class="ml-4" src="{{asset('assets/logo.png')}}"/></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="hvr-underline-from-center nav-link" href="{{route('user.home')}}">الصفحة
                            الرئيسية</a></li>
                    <li class="nav-item"><a class="hvr-underline-from-center nav-link" href="{{route('user.about')}}">عن
                            صلحها</a></li>
                    <li class="nav-item"><a class="hvr-underline-from-center nav-link" href="{{route('user.contact')}}">إتصل
                            بنا</a></li>
                </ul>
                <ul class="list-unstyled row social-icons mr-auto justify-content-center">
                    <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                    <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                    <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                    <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                    <li><a href="#"><i class="fab fa-google-plus-g"></i></a></li>
                </ul>
            </div>
        </nav>
    </div>
</section>

@yield('content')

<section class="footer-section text-center">
    <div class="container">
        <div class="footer-content">
            <div class="row">
                <div class="col-lg-4">
                    <div class="contact-section mb-3">
                        <ul class="list-unstyled text-right">
                            <li><i class="fas fa-phone fa-lg"></i>+966543933383</li>
                            <li><i class="fas fa-phone fa-lg"></i>01084839899</li>
                            <li><i class="far fa-envelope fa-lg"></i>sl7ha.com@gmail.com</li>
                            <li><i class="fas fa-map-marker-alt fa-lg"></i>18 شارع الشيخ على محمود - مصر الجديدة .</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="links-section mb-3"><img class="wow fadeInUp" src="{{asset('assets/logo.png')}}"
                                                         data-wow-duration="2s"/>
                        <ul class="list-unstyled">
                            <li><a class="hvr-float-shadow" href="#"><i class="fab fa-facebook-f"></i></a></li>
                            <li><a class="hvr-float-shadow" href="#"><i class="fab fa-twitter"></i></a></li>
                            <li><a class="hvr-float-shadow" href="#"><i class="fab fa-instagram"></i></a></li>
                            <li><a class="hvr-float-shadow" href="#"><i class="fab fa-linkedin-in"></i></a></li>
                            <li><a class="hvr-float-shadow" href="#"><i class="fab fa-google-plus-g"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="download-section">
                        <h5>حمل التطبيق الآن!</h5><a href="#"><img src="{{asset('assets/google.png')}}"/></a><a href="#"><img
                                src="{{asset('assets/app.png')}}"/></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright">
            <p class="text-center">جميع الحقوق محفوظة لشركة Dtag</p>
        </div>
    </div>
</section>
<script src="{{asset('js/libs/jquery-3.4.1.min.js')}}"></script>
<script src="{{asset('js/libs/bootstrap.bundle.min.js')}}"></script>
<script src="{{asset('js/libs/jquery.nicescroll.min.js')}}"></script>
<script src="{{asset('js/main.js')}}"></script>
<script src="{{asset('js/libs/wow.min.js')}}"></script>
<script>new WOW().init();</script>
</body>
</html>
