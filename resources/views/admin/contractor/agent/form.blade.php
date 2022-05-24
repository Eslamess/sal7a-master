@extends('admin.layouts.main')
@section('content')
    <div class="">
        <div class="page-title">
            <div class="title_left">

                <h3>{{isset($agent)?'تعديل عامل '.$agent->name: 'إضافة عامل'}}</h3>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">
                        <br/>
                        <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left"
                              action="{{isset($agent)?route('dashboard.contractorAgent.update',$agent):route('dashboard.contractorAgent.store')}}"
                              method="post" enctype="multipart/form-data">
                            @include('admin.layouts.messages')
                            @csrf
                            {{isset($agent)?method_field('PUT'):''}}

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">
                                    إسم العامل
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" required="required"
                                           class="form-control col-md-7 col-xs-12" id="name" name="name"
                                           value="@if(old('name')){{old('name')}}@elseif(isset($agent->name)){{$agent->name}}@endif">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name_en">
                                    البريد
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="email" required="required"
                                           class="form-control col-md-7 col-xs-12" id="name_en" name="email"
                                           value="@if(old('email')){{old('email')}}@elseif(isset($agent->email)){{$agent->email}}@endif">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name_en">
                                    رقم الهاتف
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" required="required"
                                           class="form-control col-md-7 col-xs-12" id="name_en" name="phone"
                                           value="@if(old('phone')){{old('phone')}}@elseif(isset($agent->phone)){{$agent->phone}}@endif">
                                </div>
                            </div>
                            @if(!isset($agent))

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name_en">
                                    كلمةالسر
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="password" required="required"
                                           class="form-control col-md-7 col-xs-12" id="name_en" name="password"
                                           value="">
                                </div>
                            </div>
@endif
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name_en">
                                    تاريخ الميلاد
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="date" required="required"
                                           class="form-control col-md-7 col-xs-12" id="name_en" name="birthday"
                                           value="@if(old('birthday')){{old('birthday')}}@elseif(isset($agent->birthday)){{$agent->birthday}}@endif">
                                </div>
                            </div>
                            @if(!isset($agent))

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name_en">
                                    الصورة الشخصية
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    @if(isset($agent->image))
                                        <img style="    background-color: #337ab7;
    margin-bottom: 10px;" src="{{url($agent->image)}}">
                                    @endif
                                    <input type="file"
                                           class="form-control col-md-7 col-xs-12" id="name_en" name="image"
                                        {{isset($agent)?'':'required'}} >
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name_en">
                                    الرقم القومي
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" required="required"
                                           class="form-control col-md-7 col-xs-12" id="name_en" name="national_id2"
                                           value="@if(old('national_id')){{old('national_id')}}@elseif(isset($agent->national_id)){{$agent->national_id}}@endif">

                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name_en">
                                    صورة البطاقة
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    @if(isset($agent->national_id2))
                                        <img style="    background-color: #337ab7;
    margin-bottom: 10px;" src="{{url($agent->national_id2)}}">
                                    @endif
                                    <input multiple  type="file"
                                           class="form-control col-md-7 col-xs-12" id="name_en"  name="national_id[]"
                                        {{isset($agent)?'':'required'}} >
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name_en">
                                    صور المستندات
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    @if(isset($agent->national_id2))
                                        <img style="    background-color: #337ab7;
    margin-bottom: 10px;" src="{{url($agent->national_id2)}}">
                                    @endif
                                    <input multiple type="file"
                                           class="form-control col-md-7 col-xs-12" id="name_en" name="documents_images[]"
                                        {{isset($agent)?'':'required'}} >
                                </div>
                            </div>
                            @endif
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name_en">
                                    المدينة
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <select name="city_id" class="form-control" required="required">

                                        @foreach($cities as $city)
                                            <option value="{{$city->id}}" @if(isset($agent->city_id) && $agent->city_id==$city->id){{'selected'}}@endif>{{$city->name}}</option>
                                        @endforeach

                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name_en">
                                    القسم
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <select name="category_id" class="form-control" required="required">

                                        @foreach($category as $category)
                                            <option value="{{$category->id}}" @if(isset($agent->category_id) && $agent->category_id==$category->id){{'selected'}}@endif>{{$category->name}}</option>
                                        @endforeach

                                    </select>
                                </div>
                            </div>
{{--                            <div class="form-group">--}}
{{--                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name_en">--}}
{{--                                    المنطقة--}}
{{--                                </label>--}}
{{--                                <div class="col-md-9 col-sm-9 col-xs-12">--}}
{{--                                    <input id='loc' type='text'  value=''/>--}}
{{--                                    <br/>--}}
{{--                                    <div style=" height: 500px;border: 1px solid #000;" id="map"></div>--}}
{{--                                </div>--}}
{{--                            </div>--}}
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
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBRXtJVCcyuJdDAkXdwPQdO8mvtVumM4FE"
            type="text/javascript"></script>

    <script>
        //the maps api is setup above
        window.onload = function() {

            var latlng = new google.maps.LatLng(19.9974533,73.7898023); //Set the default location of map

            var map = new google.maps.Map(document.getElementById('map'), {

                center: latlng,

                zoom: 11, //The zoom value for map

                mapTypeId: google.maps.MapTypeId.ROADMAP

            });

            var marker = new google.maps.Marker({

                position: latlng,

                map: map,

                title: 'حرك العلامة لتحديد المكان!', //The title on hover to display

                draggable: true //this makes it drag and drop

            });

            google.maps.event.addListener(marker, 'dragend', function(a) {

                console.log(a);

                document.getElementById('loc').value = a.latLng.lat().toFixed(4) + ', ' + a.latLng.lng().toFixed(4); //Place the value in input box



            });

        };
    </script>
@endsection
