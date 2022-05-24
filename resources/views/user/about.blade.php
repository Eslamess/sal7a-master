@extends('layout.app')

@section('content')
    <section class="breadcrumb-section mt-2">
        <div class="container">
            <div class="about-content">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{route('user.home')}}">الصفحة الرئيسية</a></li>
                        <li class="breadcrumb-item active" aria-current="page">عن صلحها</li>
                    </ol>
                </nav>
            </div>
        </div>
    </section>
    <section class="about-us mb-5">
        <div class="container">
            <header class="mt-5 mb-5 text-center">
                <h3 class="wow fadeInUp" data-wow-duration="2s"><strong>عن صلحها</strong></h3>
            </header>
            <article class="text-right">
                <div class="row">
                    <div class="col-md-6">
                        <div class="img-section"><img src="assets/images2.jpg"/></div>
                    </div>
                    <div class="col-md-6">
                        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                            <div class="panel panel-default">
                                <div class="panel-heading" id="headingOne" role="tab">
                                    <h4 class="panel-title one" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne"><a> عن صلحها  </a><i class="fas fa-chevron-up"></i></h4>
                                </div>
                                <div class="panel-collapse collapse in show" id="collapseOne" role="tabpanel" aria-labelledby="headingOne">
                                    <div class="panel-body">هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما.</div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" id="headingTwo" role="tab">
                                    <h4 class="panel-title two mt-3 collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo"><a>المجالات </a><i class="fas fa-chevron-up"></i></h4>
                                </div>
                                <div class="panel-collapse collapse show" id="collapseTwo" role="tabpanel" aria-labelledby="headingTwo">
                                    <div class="panel-body">هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما.</div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" id="headingThree" role="tab">
                                    <h4 class="panel-title three mt-3 collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree"><a> لماذا تختار صلحها </a><i class="fas fa-chevron-up"></i></h4>
                                </div>
                                <div class="panel-collapse collapse show" id="collapseThree" role="tabpanel" aria-labelledby="headingThree">
                                    <div class="panel-body">هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما.</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </article>
        </div>
    </section>
@endsection
