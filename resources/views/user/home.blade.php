@extends('layout.app')

@section('content')
    <div class="home-page">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-md-10">
                    <div class="home-content text-center">
                        <div class="content"><img class="logo wow fadeInUp" src="{{asset('assets/logo.png')}}"
                                                  data-wow-duration="2s"/>
                            <h3 class="mt-5 mb-3">عندك مشكلة؟ صلحها!</h3>
                            <p> نحن شركة متخصصة في توفير عمالة مدربة على أعمال الصبانة وتقديم الخدمات فى تخصصات محددة
                                وفق أعلى درجات الجودة.</p>
                            <h5>حمل التطبيق الآن !</h5>
                            <div class="home-links mt-4"><a href="#"><img src="{{asset('assets/google.png')}}"/></a><a href="#"><img
                                        src="{{asset('assets/app.png')}}"/></a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <section class="our-services text-center">
        <div class="container">
            <header class="mt-5 mb-5">
                <h3 class="wow fadeInUp" data-wow-duration="2s"> <strong>خدماتنا</strong></h3>
            </header>
            <article>
                <div class="row">
                    <div class="col-lg-3 col-6">
                        <div class="service">
                            <div class="service-content"><img src="assets/electricity.png"/></div>
                            <h4 class="mt-3">كهرباء</h4>
                        </div>
                    </div>
                    <div class="col-lg-3 col-6">
                        <div class="service">
                            <div class="service-content"><img src="assets/laptop@3x.png"/></div>
                            <h4 class="mt-3">حاسوب وشبكات</h4>
                        </div>
                    </div>
                    <div class="col-lg-3 col-6">
                        <div class="service">
                            <div class="service-content"><img src="assets/painting.png"/></div>
                            <h4 class="mt-3">دهانات وديكور</h4>
                        </div>
                    </div>
                    <div class="col-lg-3 col-6">
                        <div class="service">
                            <div class="service-content"><img src="assets/carpenter.png"/></div>
                            <h4 class="mt-3">نجارة وألومونيوم</h4>
                        </div>
                    </div>
                    <div class="col-lg-3 col-6">
                        <div class="service">
                            <div class="service-content"><img src="assets/welder.png"/></div>
                            <h4 class="mt-3">حدادة</h4>
                        </div>
                    </div>
                    <div class="col-lg-3 col-6">
                        <div class="service">
                            <div class="service-content"><img src="assets/door.png"/></div>
                            <h4 class="mt-3">أبواب وشبابيك</h4>
                        </div>
                    </div>
                    <div class="col-lg-3 col-6">
                        <div class="service">
                            <div class="service-content"><img src="assets/broom.png"/></div>
                            <h4 class="mt-3">نظافة </h4>
                        </div>
                    </div>
                    <div class="col-lg-3 col-6">
                        <div class="service">
                            <div class="service-content"><img src="assets/air-conditioner.png"/></div>
                            <h4 class="mt-3">تبريد وتكييف</h4>
                        </div>
                    </div>
                    <div class="col-lg-3 col-6">
                        <div class="service">
                            <div class="service-content"><img src="assets/plump.png"/></div>
                            <h4 class="mt-3">سباكة</h4>
                        </div>
                    </div>
                    <div class="col-lg-3 col-6">
                        <div class="service">
                            <div class="service-content"><img src="assets/landscape.png"/></div>
                            <h4 class="mt-3">تنسيق حدائق</h4>
                        </div>
                    </div>
                    <div class="col-lg-3 col-6">
                        <div class="service">
                            <div class="service-content"><img src="assets/floor.png"/></div>
                            <h4 class="mt-3">أرضيات</h4>
                        </div>
                    </div>
                    <div class="col-lg-3 col-6">
                        <div class="service">
                            <div class="service-content"><img src="assets/spray.png"/></div>
                            <h4 class="mt-3">مبيدات</h4>
                        </div>
                    </div>
                </div>
            </article>
        </div>
    </section>
@endsection
