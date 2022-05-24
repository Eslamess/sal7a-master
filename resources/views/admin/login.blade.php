<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>لوحة التحكم | تسجيل الدخول</title>

    <!-- Bootstrap -->
    <link href="{{ url('assets/dashboard') }}/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="{{ url('assets/dashboard') }}/vendors/bootstrap-rtl/dist/css/bootstrap-rtl.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="{{ url('assets/dashboard') }}/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="{{ url('assets/dashboard') }}/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="{{ url('assets/dashboard') }}/vendors/animate.css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="{{ url('assets/dashboard') }}/build/css/custom.css" rel="stylesheet">

    <script
        src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
        crossorigin="anonymous"></script>


    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">

    <script src="https://www.gstatic.com/firebasejs/7.0.0/firebase-app.js"></script>

    <!-- TODO: Add SDKs for Firebase products that you want to use
         https://firebase.google.com/docs/web/setup#available-libraries -->
    <script src="https://www.gstatic.com/firebasejs/7.0.0/firebase-analytics.js"></script>

    <script src="https://www.gstatic.com/firebasejs/6.3.4/firebase-messaging.js"></script>
    <script src="{{url('js/firebase.js')}}"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/notify/0.4.2/notify.min.js"></script>

    <link rel="manifest" type="text/css" href="{{url('js/manifest.json')}}">

<script>

</script>

</head>

<body class="login">
<div>
    <div class="login_wrapper">
        <div class="animate form login_form">
            <section class="login_content">
                <form action="{{ route('dashboard.login') }}" method="post">
                    @csrf
                    <h1>تسجيل الدخول</h1>

                    @if(Session::has('errors'))
                        <div class="alert alert-danger">
                            {{Session::get('errors')->first()}}
                        </div>
                    @endif

                    <div>
                        <input type="text" class="form-control" name="email" placeholder="اسم المستخدم" required=""/>
                    </div>

                    <input type="hidden" class="form-control" id="web_token" name="web_token"/>
                    <div>
                        <input type="password" class="form-control" name="password" placeholder="كلمة المرور"
                               required=""/>
                    </div>
                    <div>
                        <button class="btn btn-default submit">تسجيل الدخول</button>
                    </div>
                </form>
            </section>
        </div>
    </div>
</div>
</body>
</html>
