@extends('admin.layouts.main')
@section('content')
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3><i class="fa fa-hospital-o"></i> <span>المدن</span></h3>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">
                        @include('admin.layouts.messages')
                        @if(count($cities) > 0)
                            <table class="table table-hover datatable">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>إسم المدينة</th>
                                    <th>إسم المدينة انكليزي</th>
                                    <th>المدينة الام</th>
                                    <th>التحكم</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($cities as $item)
                                    <tr style="font-weight: bolder; color: red">
                                        <td>{{ $item->id}}</td>
                                        <td>{{ $item->name}}</td>
                                        <td>{{ $item->name_en}}</td>
                                        <td></td>
                                        <td>
                                            <a href="{{route('dashboard.city.edit', $item)}}"
                                               class="btn btn-xs btn-primary">تعديل</a>
                                         

                                        </td>
                                    </tr>
                                    @foreach($item->areas as $area)
                                        <tr>
                                            <td>{{ $area->id}}</td>
                                            <td>-- {{ $area->name}}</td>
                                            <td>-- {{ $area->name_en}}</td>
                                            <td>{{ $area->city->name}}</td>
                                            <td>

                                                <a href="{{route('dashboard.city.edit', $area)}}"
                                                   class="btn btn-xs btn-primary">تعديل</a>

                                            </td>
                                        </tr>
                                    @endforeach
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
