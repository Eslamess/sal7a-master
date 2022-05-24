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
                        @if(count($agents) > 0)
                            <table class="table table-hover table-striped datatable">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>الإسم</th>
                                    <th>البريد الالكترونى</th>
                                    <th>التحكم</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($agents as $item)
                                    <tr>
                                        <td>{{ $item->id}}</td>
                                        <td>{{ $item->name}}</td>
                                        <td><a href="mailto:{{ $item->email}}">{{ $item->email}}</a></td>
                                        <td>
                                            <a href="{{route('dashboard.agent.show', $item)}}"
                                               class="btn btn-xs btn-success">عرض</a>
                                            <form action="{{route("dashboard.agent.destroy", $item)}}" method="post"
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
