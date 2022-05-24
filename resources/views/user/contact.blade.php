@extends('layout.app')

@section('content')
    <section class="breadcrumb-section mt-2">
        <div class="container">
            <div class="about-content">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{route('user.home')}}">الصفحة الرئيسية</a></li>
                        <li class="breadcrumb-item active" aria-current="page">إتصل بينا</li>
                    </ol>
                </nav>
            </div>
        </div>
    </section>
    <section class="contact mb-5">
        <div class="container">
            <header class="mt-5 mb-5 text-center">
                <h3 class="wow fadeInUp" data-wow-duration="2s"><strong>إتصل بنا</strong></h3>
            </header>
            <article class="text-right">
                <div class="row">
                    <div class="col-md-6">
                        <div class="contact-data">
                            <header>
                                <h4> <span>بينات الاتصال</span></h4>
                                <p class="mt-3">نحن شركة متخصصة فى توفير عمالة مدربة على اغمال الصيانة وتقديم الخدمات فى تخصصات محددة وفق اعلى درجات الجودة</p>
                            </header>
                            <article>
                                <ul class="list-unstyled">
                                    <li><i class="far fa-building"></i>حفر الباطن - المملكة العربية السعودية.</li>
                                    <li><i class="fas fa-map-marker-alt fa-lg"></i>القاهره الجديده - مصر.</li>
                                    <li><i class="fas fa-phone fa-lg"></i>+966543933383</li>
                                    <li><i class="fas fa-phone fa-lg"></i>01084839899</li>
                                    <li><i class="far fa-envelope fa-lg"></i>sl7ha.com@gmail.com</li>
                                    <li><i class="far fa-envelope fa-lg"></i>sl7ha.com@gmail.com</li>
                                </ul>
                            </article>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="contact-form">
                            <header>
                                <h4> <span>راسلنا</span></h4>
                            </header>
                            <article>
                                <form class="mt-4">
                                    <div class="form-group">
                                        <input class="form-control" id="formGroupExampleInput" type="text" placeholder="الإسم" required="required"/>
                                    </div>
                                    <div class="form-group mt-3">
                                        <input class="form-control" id="formGroupExampleInput" type="email" placeholder="البريد" required="required"/>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" id="formGroupExampleInput" type="text" placeholder="الموضوع" required="required"/>
                                    </div>
                                    <div class="form-group">
                                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="5" placeholder="الرسالة" required="required"></textarea>
                                    </div>
                                    <div class="form-group text-center">
                                        <button type="submit">إرسال</button>
                                    </div>
                                </form>
                            </article>
                        </div>
                    </div>
                </div>
            </article>
        </div>
    </section>
@endsection
