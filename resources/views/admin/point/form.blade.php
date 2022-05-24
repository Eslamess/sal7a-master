@extends('admin.layouts.main')
@section('content')
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>تعديل النقاط </h3>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">
                        <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left"
                              action="{{route('dashboard.point.update', $point->id)}}"
                              method="post" enctype="multipart/form-data" autocomplete="off">
                            @include('admin.layouts.messages')
                            @csrf
                            @method('PUT')
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label for="content_ar">عدد النقاط</label>
                                        <input name="point_value" id="content_ar" rows="8"
                                               class="form-control" value="{{$point->point_value}}">
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label for="content_ar">قيمة النقاط</label>
                                        <input name="credit_value" id="content_ar" rows="8"
                                               class="form-control" value="{{$point->credit_value}}">
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label for="content_ar">عدد النقاط لكل طلب</label>
                                        <input name="point_per_order" id="content_ar" rows="8"
                                               class="form-control" value="{{$point->point_per_order}}">
                                    </div>
                                </div>
                            </div>

                            <input type="submit" class="btn btn-success" value="حفظ">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
