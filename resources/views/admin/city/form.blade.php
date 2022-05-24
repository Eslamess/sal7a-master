@extends('admin.layouts.main')
@section('content')
    <div class="">
        <div class="page-title">
            <div class="title_left">

                <h3>{{isset($city)?'تعديل المدينة '.$city->name: 'إضافة مدينة'}}</h3>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">
                        <br/>
                        <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left"
                              action="{{isset($city)?route('dashboard.city.update',$city):route('dashboard.city.store')}}"
                              method="post" enctype="multipart/form-data">
                            @include('admin.layouts.messages')
                            @csrf
                            {{isset($city)?method_field('PUT'):''}}

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">
                                    إسم المدينة (عربى)
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" required="required"
                                           class="form-control col-md-7 col-xs-12" id="name" name="name"
                                           value="@if(old('name')){{old('name')}}@elseif(isset($city->name)){{$city->name}}@endif">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name_en">
                                    إسم المدينة (إنكليزى)
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" required="required"
                                           class="form-control col-md-7 col-xs-12" id="name_en" name="name_en"
                                           value="@if(old('name_en')){{old('name_en')}}@elseif(isset($city->name_en)){{$city->name_en}}@endif">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="parent_id">
                                    إسم المدينة الام
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <select name="parent_id" id="parent_id" class="form-control">
                                        <option value="">تعين كامدينة أم</option>
                                        @foreach($cities as $cityX)
                                            <option value="{{$cityX->id}}" {{(isset($city)&&$city->parent_id==$cityX->id)?'selected':''}}>{{$cityX->name}}</option>
                                        @endforeach
                                    </select>
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
