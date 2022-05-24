
@extends('admin.layouts.main')
@section('content')
    @include('admin.layouts.messages')
    <div class="content">
        <!-- card -->
        <div class="card">

            <div class="icon"><i class=" md-36">{{$agents}}</i></div>
            <p class="title">عامل</p>
            <p class="text">عدد العمال المتاحين</p>

        </div>
        <!-- end card -->
        <!-- card -->
        <div class="card">
            <div class="icon"><i class="material-icons md-36">{{$contractors}}</i></div>
            <p class="title">وكيل</p>
            <p class="text">اجمالي عدد الوكلاء</p>
        </div>
        <!-- end card -->
        <!-- card -->
        <div class="card">

            <div class="icon"><i class="material-icons md-36">{{$orders}}</i></div>
            <p class="title">الطلبات</p>
            <p class="text">اجمالي عدد الطلبات</p>

        </div>
        <!-- end card -->
        <!-- card -->
        <div class="card">
            <div class="icon"><i class="material-icons md-36">{{$users}}</i></div>
            <p class="title">مستخدم</p>
            <p class="text">اجمالي عدد المستخدمين</p>
        </div>
        <!-- end card -->



    </div>
    <div class="content " style="display: block" >
        <div class="panel panel-primary" >
            <div class="panel-heading text-center">تقيم الكلي للتطبيق</div>
            <div class="panel-body text-center">
                @for ($i = 1; $i <= number_format($rate->appRate,0); $i++)
                    <span><i style="color: gold" class="fa fa-star"></i></span>
                @endfor
{{number_format($rate->appRate,0)}}

            </div>
        </div>
        <div class="panel panel-success" style=" display: inline-block;
    width: 45%;
    float: right;
    margin-left: 18px;">
            <div class="panel-heading">طلبات مكتملة</div>
            <div class="panel-body">
                <table class="table ">
                    <thead>
                    <tr>
                        <th></th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>اجمالي تكلفه</td>
                            <td>  {{$ordersCompleted->totalCost}}  ريال </td>
                        </tr>
                        <tr>
                            <td>عدد الطلبات</td>
                            <td>{{$ordersCompleted->totalCount}}</td>
                        </tr>
                    </tbody>
                </table>

            </div>
        </div>
        <div class="panel panel-warning" style="  display: inline-block;
        width: 50%;">
            <div class="panel-heading">اكثر العملاء تقيما</div>
            <div class="panel-body">
                @if($topAgents)
                    <table class="table table-hover table-striped ">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>الاسم</th>
                            <th>الوكيل</th>
                            <th>التقييم</th>

                        </tr>
                        </thead>
                        <tbody>
                        @foreach($topAgents as $agent)
                            <tr>
                                <td>{{ $agent->id}}</td>
                                <td><a href="{{route('dashboard.agent.show',$agent)}}">{{ $agent->name}}</a></td>
                                @if(isset($agent->admin))
                                <td>{{ $agent->admin->name}} </td>
                                    @else
                                    <td>مستقل</td>
                                @endif
                                <td>
                                    @for ($i = 1; $i <= number_format($agent->rate,0); $i++)
                                        <span><i style="color: gold" class="fa fa-star"></i></span>
                                    @endfor
                                    {{number_format($agent->rate,1)}}
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>

                @endif
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">عمال بأنتظار التفعيل</div>
            <div class="panel-body">
                @if($waitingAgents)
                <table class="table table-hover table-striped datatable">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>الاسم</th>
                        <th>تفعيل</th>

                    </tr>
                    </thead>
                    <tbody>
                    @foreach($waitingAgents as $agent)
                        <tr>
                            <td>{{ $agent->id}}</td>
                            <td>{{ $agent->name}}</td>
                            <td> <a href="/dashboard/changeStatue/{{$agent->id}}"
                                    class="btn btn-xs btn-primary">تفعيل</a></td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
                    @else
                    <p>لايوجد عملاء بأنتظار الموافقه</p>
                    @endif
            </div>
        </div>


    </div>


    <style>
#DataTables_Table_0_filter{
    float: right;
}
.panel-success>.panel-heading {
    color: #fff;
    background-color: #3c763d;
    border-color: #d6e9c6;
}
.panel-warning>.panel-heading {
    color: #fff;
    background-color: #efcc15;
    border-color: #faebcc;
}
#DataTables_Table_0_filter input{
    width: 135px;
}
        .content {

            width: 100%;
            padding: 0 4%;

            margin: 0 auto;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        @media screen and (max-width: 767px) {
            .content {
                padding-top: 300px;
                flex-direction: column;
            }
        }

        .card {
            width: 100%;
            max-width: 300px;
            min-width: 200px;
            height: 125px;
            background-color: #292929;
            margin: 10px;
            border-radius: 10px;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.24);
            border: 2px solid rgba(7, 7, 7, 0.12);
            font-size: 16px;
            transition: all 0.3s ease;
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            cursor: pointer;
            transition: all 0.3s ease;
        }





        .card .title {
            width: 100%;
            margin: 0;
            text-align: center;
            color: white;
            font-weight: 600;
            text-transform: uppercase;

        }

        .card .text {
            width: 80%;
            margin: 0 auto;
            font-size: 13px;
            text-align: center;

            color: white;
            font-weight: 200;
            letter-spacing: 2px;
            opacity: 0;
            max-height: 0;
            transition: all 0.3s ease;
        }
        .icon i{
            font-size: 50px;
            color: #008dc6;
        }

        .card:hover {
            height: 150px;
        }

        .card:hover .info {
            height: 90%;
        }

        .card:hover .text {
            transition: all 0.3s ease;
            opacity: 1;
            max-height: 40px;
        }





    </style>
@endsection
