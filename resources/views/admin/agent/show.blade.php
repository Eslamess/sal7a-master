@extends('admin.layouts.main')
@section('content')
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3><i class="fa fa-hospital-o"></i> <span>العمال</span></h3>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">
                        @include('admin.layouts.messages')
                        <div class="profile" style="
    width: 100%;
    text-align: center;
">
                            <img src="{{ $agent->image}}" style="
    width: 200px;
    height: 200px;
    border-radius: 50%;
    text-align: center;
">
                        </div>
                        <table class="table table-hover table-striped datatable">
                            <tbody>
                            <tr>
                                <th>#</th>
                                <td>{{ $agent->id}}</td>
                            </tr>
                            <tr>
                                <th>الإسم</th>
                                <td>{{ $agent->name}}</td>
                            </tr>
                            <tr>
                                <th>البريد الإلكترونى</th>
                                <td><a href="mailto:{{ $agent->email}}">{{ $agent->email}}</a></td>
                            </tr>
                            <tr>
                                <th>الهاتف</th>
                                <td><a href="tel:{{$agent->phone}}">{{$agent->phone}}</a></td>
                            </tr>
                            <tr>
                                <th>القسم</th>
                                <td>
                                    {{$agent->category->name}}
                                </td>
                            </tr>
                            <tr>
                                <th>اجمالي الطلبات</th>
                                <td>
                                    {{$agent->order->count()}}
                                </td>
                            </tr>
                            <tr>
                                <th>اجمالي مبلغ الزيارات</th>
                                <td>
                                    {{$agent->total }} <span >ريال</span>
                                </td>
                            </tr>
                            <tr>
                                <th>المدينة</th>
                                <td>{{$agent->area->name}}</td>
                            </tr>
                            <tr>
                                <th>التقيم</th>
                                <td step="0.1">   @for ($i = 1; $i <= number_format($agent->rate,0); $i++)
                                        <span><i style="color: gold" class="fa fa-star"></i></span>
                                    @endfor
                                    {{number_format($agent->rate,1)}} </td>
                            </tr>
                            <tr>
                                <th>السن</th>
                                <td>{{$agent->age}} <span >سنة </span></td>
                            </tr>
                            <tr>
                                <th>خط طول</th>
                                <td>{{$agent->longitude}}</td>
                            </tr>
                            <tr>
                                <th>خط عرض</th>
                                <td>{{$agent->latitude}}</td>
                            </tr>
                            <tr>
                                <th>حالة العضوية</th>
                                <td>
                                    {{$agent->getStatus()}}
                                </td>
                            </tr>
                            <tr>
                                <th>التحكم</th>

                                <td>
                                    @if($agent->status == 'new' || $agent->status == 'banned')
                                        <form action="{{route('dashboard.agent.status')}}" method="post" style="display: inline">
                                            @csrf
                                            <input type="hidden" name="status" value="active">
                                            <input type="hidden" name="agent_id" value="{{$agent->id}}">
                                            <button type="submit" class="btn btn-xs btn-success">تفعيل العضوية</button>
                                        </form>
                                    @else
                                        <form action="{{route('dashboard.agent.status')}}" method="post" style="display: inline">
                                            @csrf
                                            <input type="hidden" name="status" value="banned">
                                            <input type="hidden" name="agent_id" value="{{$agent->id}}">
                                            <button type="submit" class="btn btn-xs btn-danger">إيقاف العضوية</button>
                                        </form>
                                    @endif

                                    <form action="{{route("dashboard.agent.destroy", $agent)}}" method="post"
                                          style="display:inline;">
                                        @csrf
                                        @method('delete')
                                        <button type="button" class="btn btn-danger btn-xs btn-delete">حذف
                                        </button>
                                    </form>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="profile" style="
    width: 100%;
    text-align: center;
    padding-bottom: 20px;
">
            <h3>مستندات العميل </h3>
            @foreach($agent->documents_data as $image)
            <img src="{{ $image}}" style="
                width: 600px;
    height: 600px;
    text-align: center;
 ">
                @endforeach
                @foreach($agent->national_data as $image)
                    <img src="{{ $image}}" style="
           width: 600px;
    height: 600px;
    text-align: center;
">
                @endforeach
        </div>
    </div>
@endsection
