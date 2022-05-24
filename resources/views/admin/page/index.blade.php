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
                        @if(count($items) > 0)
                            <table class="table table-hover table-striped datatable">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>إسم الصفحة</th>
                                    <th>التحكم</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($items as $item)
                                    <tr>
                                        <td>{{ $item->id}}</td>
                                        <td>{{ $item->name}}</td>
                                        <td>
                                            <a href="{{route('dashboard.page.show', $item->id)}}"
                                               class="btn btn-xs btn-success">عرض</a>
                                            <a href="{{route('dashboard.page.edit', $item->id)}}"
                                               class="btn btn-xs btn-primary">تعديل</a>
                                        </td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                        @else
                            <h1 class="text-center">لا يوجد </h1>
                        @endif

                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
