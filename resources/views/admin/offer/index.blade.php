@extends('admin.layouts.main')
@section('content')
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3><i class="fa fa-hospital-o"></i> <span>الخصومات</span></h3>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">
                        @include('admin.layouts.messages')
                        @if(count($offers) > 0)
                            <table class="table table-hover table-striped datatable">
                                <thead>
                                <tr>
                                <th>#</th>
                                <th>الاسم</th>
                                <th>الكوبون</th>
                                <th>القيمه</th>
                                <th>البدأ</th>
                                <th>الانتهاء</th>
                                <th>التحكم</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($offers as $item)
                                    <tr>
                                        <td>{{ $item->id}}</td>
                                        <td>{{ $item->name_ar}}</td>
                                        <td>{{ $item->coupon}}</td>
                                        <td>{{ $item->discount}}
                                            {{ $item->type == 'amount'? 'ريال':'%'}}
                                        </td>
                                        <td>{{ $item->start_date}}</td>
                                        <td>{{ $item->end_date}}</td>
                                        <td>
                                            <a href="{{route('dashboard.offers.edit', $item)}}"
                                               class="btn btn-xs btn-primary">تعديل</a>
                                            <form action="{{route("dashboard.offers.destroy", $item)}}" method="post"
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
