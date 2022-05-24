@extends('admin.layouts.main')
@section('content')
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3><i class="fa fa-hospital-o"></i> <span>الخدمات</span></h3>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">
                        @include('admin.layouts.messages')
                        @if(count($categories) > 0)
                            <table class="table table-hover datatable">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th colspan="2">إسم الخدمة</th>
                                    <th></th>
                                    <th>عددالفنيين</th>
                                    <th>عددالزيارات</th>
                                    <th>تكاليف الزياره</th>
                                    <th>التحكم</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($categories as $item)
                                    <tr>
                                        <td>{{ $item->id}}</td>
                                        <td>{{ $item->name}}</td>
                                        <td>{{ $item->name_en}}</td>
                                        <td></td>
                                        <td>{{ $item->agent_count}}</td>
                                        <td>{{ $item->order_count}}</td>
                                        <td>{{ $item->visit_fees}}</td>
                                        <td>
                                            <a href="{{route('dashboard.category.edit', $item)}}"
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
