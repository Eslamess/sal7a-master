@extends('admin.layouts.main')
@section('content')
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>تعديل صفحة {{$item->name}}</h3>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">
                        <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left"
                              action="{{route('dashboard.page.update', $item->id)}}"
                              method="post" enctype="multipart/form-data" autocomplete="off">
                            @include('admin.layouts.messages')
                            @csrf
                            @method('PUT')

                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label for="content_ar">المحتوى بالعربية</label>
                                        <textarea name="content_ar" id="content_ar" rows="8"
                                                  class="form-control">{{$item->content_ar}}</textarea>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label for="content_en">المحتوى بالإنجيليزية</label>
                                        <textarea name="content_en" id="content_en" rows="8"
                                                  class="form-control" style="direction: LTR">{{$item->content_en}}</textarea>
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
