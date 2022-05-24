@extends('admin.layouts.main')
@section('content')
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3><i class="fa fa-hospital-o"></i> <span> تقيمات الطلبات</span></h3>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">
                        @include('admin.layouts.messages')
                        @if(count($data) > 0)
                            <table class="table table-hover datatable">
                                <thead>

                                <tr>
                                    <th>#</th>
                                    <th >العميل</th>
                                    <th>العامل</th>
                                    <th>التقييم</th>
                                    <th style="width: 40% !important;">التعليق</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($data as $item)
                                    <tr>
                                        <td>{{ $item->id}}</td>
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
                                            @for ($i = 1; $i <= number_format($item->rate,0); $i++)
                                                <span><i style="color: gold" class="fa fa-star"></i></span>
                                            @endfor
                                            {{number_format($item->rate,1)}}

                                        </td>
                                        <td>{{ $item->comment}}</td>


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
