@extends('admin.layouts.main')
@section('content')
    <div class="">
        <div class="page-title">
            <div class="title_left">

                <h3>{{isset($offer)?'تعديل خصم '.$offer->name_ar: 'إضافة خصم'}}</h3>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">
                        <br/>
                        <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left"
                              action="{{isset($offer)?route('dashboard.offers.update',$offer):route('dashboard.offers.store')}}"
                              method="post" enctype="multipart/form-data">
                            @include('admin.layouts.messages')
                            @csrf
                            {{isset($offer)?method_field('PUT'):''}}

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">
                                    الاسم عربي
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" required="required"
                                           class="form-control col-md-7 col-xs-12" id="name" name="name_ar"
                                           value="@if(old('name')){{old('name')}}@elseif(isset($offer->name_ar)){{$offer->name_ar}}@endif">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name_en">
                                    الاسم انكليزي
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" required="required"
                                           class="form-control col-md-7 col-xs-12" id="name_en" name="name_en"
                                           value="@if(old('email')){{old('email')}}@elseif(isset($offer->name_en)){{$offer->name_en}}@endif">
                                </div>
                            </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name_en">
                                        الوصف عربي
                                    </label>
                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                        <textarea required="required"
                                               class="form-control col-md-7 col-xs-12" id="name_en" name="text_ar"
                                              >@if(isset($offer->text_ar)){{$offer->text_ar}}@endif</textarea>
                                    </div>
                                </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name_en">
                                    الوصف انكليزي
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                        <textarea required="required"
                                                  class="form-control col-md-7 col-xs-12" id="name_en" name="text_en"
                                                  >@if(isset($offer->text_en)){{$offer->text_en}}@endif</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name_en">
                                    كود الكوبون
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" required="required"
                                           class="form-control col-md-7 col-xs-12" id="name_en" name="coupon"
                                           value="@if(old('phone')){{old('phone')}}@elseif(isset($offer->coupon)){{$offer->coupon}}@endif">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name_en">
                                    قيمة الكوبون
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" required="required"
                                           class="form-control col-md-7 col-xs-12" id="name_en" name="discount"
                                           value="@if(old('password')){{old('password')}}@elseif(isset($offer->discount)){{$offer->discount}}@endif">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name_en">
                                    نوع الكوبون
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <select name="type" class="form-control" required="required">
                                        <option @if(isset($offer->type) && $offer->type=="amount")
                                                {{'selected'}}
                                                @endif
                                                value="amount">ريال</option>
                                        <option @if(isset($offer->type) && $offer->type=="percentage")
                                                {{'selected'}}
                                                @endif value="percentage">%</option>

                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name_en">
                                    تاريخ البدأ
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="date" required="required"
                                           class="form-control col-md-7 col-xs-12" id="name_en" name="start_date"
                                           value="@if(old('national_id')){{old('national_id')}}@elseif(isset($offer->start_date)){{$offer->start_date}}@endif">

                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name_en">
                                    تاريخ النهاية
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="date" required="required"
                                           class="form-control col-md-7 col-xs-12" id="name_en" name="end_date"
                                           value="@if(old('national_id')){{old('national_id')}}@elseif(isset($offer->end_date)){{$offer->end_date}}@endif">

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
