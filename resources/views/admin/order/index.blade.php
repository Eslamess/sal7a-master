@extends('admin.layouts.main')
@section('content')
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3><i class="fa fa-hospital-o"></i> <span>الطلبات</span></h3>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">
                        @include('admin.layouts.messages')
                        @if(count($orders) > 0)
                            <table class="table table-hover table-striped datatable">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>تاريخ الطلب</th>
                                    <th>القسم</th>
                                    <th>المستخدم</th>
                                    <th>العامل</th>
                                    <th>المدينة</th>
                                    <th>التقيم</th>
                                    <th>السعر</th>

                                    <th>حالة الطلب</th>
                                    <th>التحكم</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($orders as $item)
                                    <tr>
                                        <td>{{ $item->id}}</td>
                                        <td>{{ $item->created_at}}</td>
                                        <td>
                                            @if($item->category)
                                                {{ $item->category->name}}
                                            @endif
                                        </td>
                                        <td>
                                            @if($item->user)
                                                <a href="{{route('dashboard.user.show', $item->user)}}">{{ $item->user->name}}</a>
                                            @endif
                                        </td>
                                        <td>
                                            @if($item->agent)
                                                <a href="{{route('dashboard.agent.show', $item->agent)}}">{{ $item->agent->name}}</a>
                                            @endif
                                        </td>
                                        <td>
                                            @if($item->city)
                                                {{ $item->city->name}}
                                            @endif
                                        </td>
                                        <td>    @for ($i = 1; $i <= number_format($item->rate,0); $i++)
                                                <span><i style="color: gold" class="fa fa-star"></i></span>
                                            @endfor
                                            {{number_format($item->rate,1)}}</td>
                                        <td>{{ $item->cost}} ريال </td>

                                        <td>{{ $item->status}}</td>
                                        <td>
                                            <a href="{{route('dashboard.order.show', $item)}}"
                                               class="btn btn-xs btn-success">عرض</a>
                                            <form action="{{route("dashboard.order.destroy", $item)}}" method="post"
                                                  style="display:inline;">
                                                @csrf
                                                @method('delete')
                                                <button type="button" class="btn btn-danger btn-xs btn-delete">حذف
                                                </button>
                                            </form>
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
