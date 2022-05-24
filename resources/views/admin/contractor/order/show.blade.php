@extends('admin.layouts.main')
@section('content')
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3><i class="fa fa-hospital-o"></i> <span>طلب</span></h3>
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
                                <td>{{ $order->id}}</td>
                            </tr>
                            <tr>
                                <th>تاريخ الطلب</th>
                                <td>{{ $order->created_at}}</td>
                            </tr>
                            <tr>
                                <th>القسم</th>
                                <td>{{$order->category->name}}</td>
                            </tr>
                            <tr>
                                <th>المستخدم</th>
                                <td>
                                    {{ $order->user->name}}
                                </td>
                            </tr>
                            <tr>
                                <th>العامل</th>
                                <td>
                                    <a href="{{route('dashboard.contractorAgent.show', $order->agent)}}">{{ $order->agent->name}}</a>
                                </td>
                            </tr>
                            <tr>
                                <th>الكود</th>
                                <td>
                                    {{ $order->qr_code}}
                                </td>
                            </tr>
                            <tr>
                                <th>التقييم</th>
                                <td>
                                    @for ($i = 1; $i <= number_format($order->rate,0); $i++)
                                        <span><i style="color: gold" class="fa fa-star"></i></span>
                                    @endfor
                                    {{number_format($order->rate,1)}}
                                </td>
                            </tr>
                            <tr>
                                <th>التعليق</th>
                                <td>
                                    {{ $order->agent->rate_count}}
                                </td>
                            </tr>
                            <tr>
                                <th>المدينة</th>
                                <td>{{$order->city->name}}</td>
                            </tr>
                            <tr>
                                <th>العنوان</th>
                                <td>
                                    {{$order->address}}
                                </td>
                            </tr>
                            <tr>
                                <th>المكان</th>
                                <td>
                                    <a href="{{"https://www.google.com/maps/@".$order->latitude.",".$order->longitude.",15z"}}"
                                       target="_blank">
                                        <span>عرض</span>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <th>وقت الزيارة</th>
                                <td>
                                    {{$order->date}} {{$order->time}}
                                </td>
                            </tr>
                            <tr>
                                <th>العروض</th>
                                <td>
                                    @if($order->offer)
                                        {{$order->offer->name}}
                                    @endif
                                </td>
                            </tr>
                            <tr>
                                <th>مصاريف الزيارة</th>
                                <td>
                                    {{$order->visit_fees}} <span>ريال</span>
                                </td>
                            </tr>
                            <tr>
                                <th>تكلفة التصليح</th>
                                <td>
                                    {{$order->cost}} <span style="color: #c5c527">ريال</span>
                                </td>
                            </tr>
                            <tr>
                                <th>خصم</th>
                                <td>
                                    @if($order->dissount)
                                        {{$order->dissount}} <span>ريال</span>
                                    @endif
                                </td>
                            </tr>
                            <tr>
                                <th>حالة الطلب</th>
                                <td>
                                    {{$order->status}}
                                </td>
                            </tr>
                            <tr>
                                <th>التحكم</th>
                                <td>
                                    <form action="{{route("dashboard.contractorOrder.destroy", $order)}}" method="post"
                                          style="display:inline;">
                                        @csrf
                                        @method('delete')
                                        <button type="button" class="btn btn-danger btn-xs btn-delete">حذف
                                        </button>
                                    </form>
                                    <button type="button" class="btn btn-dark btn-xs" data-toggle="modal"
                                            data-target="#status">تغيير حالة الطلب
                                    </button>
                                    <button type="button" class="btn btn-dark btn-xs" data-toggle="modal"
                                            data-target="#agent">تعيين عامل
                                    </button>
                                </td>

                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="status" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">حاله الطلب</h4>
                </div>
                <div class="modal-body">
                    <form action="{{route('dashboard.contractorOrder.edit',$order)}}" method="PUT"
                          class="form-horizontal form-label-left">
                        @csrf
                        <div class="form-group">
                            <label>الحالة</label>
                            <input value="{{$order->id}}" name="id" hidden>
                            <select name="status" class="form-control">
                                <option value="new">جديد</option>
                                <option value="on_way">العامل في الطريق</option>
                                <option value="arrived">تم وصول العامل</option>
                                <option value="checked">تم المعاينة</option>
                                <option value="approved">تم الموافقة</option>
                                <option value="rejected">تم الرفض</option>
                                <option value="completed">تم التنفيذ</option>
                                <option value="paid">تم الدفع</option>
                                <option value="not_paid">لم يتم الدفع</option>
                                <option value="cancelled">توقف</option>

                            </select>
                            <br>
                            <div class="form-">
                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                    <button type="submit" class="btn btn-primary">حفظ</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">اغلاق</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="agent" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">تعين عامل</h4>
                </div>
                <div class="modal-body">
                    @if(isset($agents))
                    <form action="{{route('dashboard.contractorOrder.edit',$order)}}" method="PUT"
                          class="form-horizontal form-label-left">
                        @csrf
                        <div class="form-group">

                            <label> اقرب العمال للعميل</label>
                            <input value="{{$order->id}}" name="id" hidden>
                            <select name="agent" class="form-control">

                                @foreach($agents as $agent)
                                <option value="{{$agent->id}}">{{$agent->name}}</option>
                             @endforeach

                            </select>
                            <br>
                            <div class="form-">
                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                    <button type="submit" class="btn btn-primary">حفظ</button>
                                </div>
                            </div>
                        </div>
                    </form>
                        @else
                        <h4>عفوا لا يتوافر عمال</h4>
                    @endif
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">اغلاق</button>
                </div>
            </div>
        </div>
    </div>


@endsection
