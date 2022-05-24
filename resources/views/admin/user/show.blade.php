@extends('admin.layouts.main')
@section('content')
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3><i class="fa fa-hospital-o"></i> <span>المستخدمين</span></h3>
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
                                <td>{{ $user->id}}</td>
                            </tr>
                            <tr>
                                <th>الإسم</th>
                                <td>{{ $user->name}}</td>
                            </tr>
                            <tr>
                                <th>البريد الإلكترونى</th>
                                <td><a href="mailto:{{ $user->email}}">{{ $user->email}}</a></td>
                            </tr>
                            <tr>
                                <th>الهاتف</th>
                                <td><a href="tel:{{$user->phone}}">{{$user->phone}}</a></td>
                            </tr>
                            <tr>
                                <th>عددد النقاط</th>
                                <td>{{$user->points}}
                                    <span >نقاط</span>
                                </td>
                            </tr>
                            <tr>
                                <th>المحفظة</th>
                                <td>{{$user->credits}}
                                    <span >ريال</span>
                                </td>
                            </tr>
                            <tr>
                                <th>العنوان</th>
                                <td>{{$user->address}}</td>
                            </tr>
                            <tr>
                                <th>اجمالي الطلبات</th>
                                <td>
                                    {{$user->order->count()}}
                                </td>
                            </tr>
                            <tr>
                                <th>اجمالي مبلغ الزيارات</th>
                                <td>
                                    {{$user->total }} <span >ريال</span>
                                </td>
                            </tr>
                            <tr>
                                <th>المدينة</th>
                                <td>{{$user->area->name}}</td>
                            </tr>
{{--                            <tr>--}}
{{--                                <th>التقيم</th>--}}
{{--                                <td>{{number_format($user->rate,1)}} <span style="color: #c5c527">/ 5 </span></td>--}}
{{--                            </tr>--}}
                            <tr>
                                <th>خط طول</th>
                                <td>{{$user->longitude}}</td>
                            </tr>
                            <tr>
                                <th>خط عرض</th>
                                <td>{{$user->latitude}}</td>
                            </tr>
                            <tr>
                                <th>حالة العضوية</th>
                                <td>
                                    {{$user->getStatus()}}
                                </td>
                            </tr>
                            <tr>
                                <th>التحكم</th>

                                <td>
                                    @if($user->status == 'new' || $user->status == 'banned')
                                        <form action="{{route('dashboard.user.status')}}" method="post" style="display: inline">
                                            @csrf
                                            <input type="hidden" name="status" value="active">
                                            <input type="hidden" name="user_id" value="{{$user->id}}">
                                            <button type="submit" class="btn btn-xs btn-success">تفعيل العضوية</button>
                                        </form>
                                    @else
                                        <form action="{{route('dashboard.user.status')}}" method="post" style="display: inline">
                                            @csrf
                                            <input type="hidden" name="status" value="banned">
                                            <input type="hidden" name="user_id" value="{{$user->id}}">
                                            <button type="submit" class="btn btn-xs btn-danger">إيقاف العضوية</button>
                                        </form>
                                    @endif

                                    <form action="{{route("dashboard.user.destroy", $user)}}" method="post"
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
    </div>
@endsection
