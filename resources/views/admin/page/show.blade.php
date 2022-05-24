@extends('admin.layouts.main')
@section('content')
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3><i class="fa fa-hospital-o"></i> <span>الصفحات</span></h3>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">
                        @include('admin.layouts.messages')
                        <table class="table table-hover table-striped datatable">
                            <tbody>
                            <tr>
                                <th>#</th>
                                <td>{{ $item->id}}</td>
                            </tr>
                            <tr>
                                <th>إسم الصفحة</th>
                                <td>{{ $item->name}}</td>
                            </tr>
                            <tr>
                                <th>المحتوى بالعربية</th>
                                <td>{!! nl2br($item->content_ar) !!}</td>
                            </tr>
                            <tr>
                                <th>المحتوى بالإنجليزية</th>
                                <td>{!! nl2br($item->content_en) !!}</td>
                            </tr>
                            <tr>
                                <th>التحكم</th>
                                <td>
                                    <a href="{{route('dashboard.page.edit', $item->id)}}"
                                       class="btn btn-xs btn-primary">تعديل</a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
