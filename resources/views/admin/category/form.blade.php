@extends('admin.layouts.main')
@section('content')
    <div class="">
        <div class="page-title">
            <div class="title_left">

                <h3>{{isset($category)?'تعديل الخدمة '.$category->name: 'إضافة خدمة'}}</h3>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">
                        <br/>
                        <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left"
                              action="{{isset($category)?route('dashboard.category.update',$category):route('dashboard.category.store')}}"
                              method="post" enctype="multipart/form-data">
                            @include('admin.layouts.messages')
                            @csrf
                            {{isset($category)?method_field('PUT'):''}}

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">
                                    إسم الخدمة (عربى)
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" required="required"
                                           class="form-control col-md-7 col-xs-12" id="name" name="name"
                                           value="@if(isset($category->name)){{$category->name}}@endif">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name_en">
                                    إسم الخدمة (إنجليزى)
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" required="required"
                                           class="form-control col-md-7 col-xs-12" id="name_en" name="name_en"
                                           value="@if(old('name_en')){{old('name_en')}}@elseif(isset($category->name_en)){{$category->name_en}}@endif">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name_en">
                                  الايقونة
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    @if(isset($category->icon))
                                    <img style="     max-width: 150px;
    max-height: 150px;   background-color: #337ab7;
    margin-bottom: 10px;" src="{{url($category->icon)}}">
                                    @endif
                                    <input type="file"
                                           class="form-control col-md-7 col-xs-12" id="name_en" name="icon"
                                           {{isset($category)?'':'required'}} >
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name_en">
                                    تكاليف الزيارة
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" required="required"
                                           class="form-control col-md-7 col-xs-12" id="name_en" name="visit_fees"
                                           value="@if(old('visit_fees')){{old('visit_fees')}}@elseif(isset($category->visit_fees)){{$category->visit_fees}}@endif">
                                </div>
                            </div>
                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                    <button type="submit" class="btn btn-primary">حفظ</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
