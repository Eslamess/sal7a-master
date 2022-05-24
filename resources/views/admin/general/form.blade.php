@extends('admin.layouts.main')
@section('content')
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>قنوات التواصل</h3>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">
                        <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left"
                              action="{{route('dashboard.contacts')}}"
                              method="post" enctype="multipart/form-data" autocomplete="off">
                            @include('admin.layouts.messages')
                            @csrf
                            <table class="table table-bordered">
                                <tr>
                                    <th class="text-center"><label for="phone-number">الموبايل</label></th>
                                    <td>
                                        <input type="text" id="phone-number" name="phone-number" class="form-control" value="{{\App\General::where('name', 'phone-number')->first()->value}}">
                                    </td>
                                </tr>
                                <tr>
                                    <th class="text-center"><label for="email">الإيميل</label></th>
                                    <td>
                                        <input type="text" id="email" name="email" class="form-control" value="{{\App\General::where('name', 'email')->first()->value}}">
                                    </td>
                                </tr>
                                <tr>
                                    <th class="text-center"><label for="facebook-link">الفيسبوك</label></th>
                                    <td>
                                        <input type="text" id="facebook-link" name="facebook-link" class="form-control" value="{{\App\General::where('name', 'facebook-link')->first()->value}}">
                                    </td>
                                </tr>
                                <tr>
                                    <th class="text-center"><label for="twitter-link">تويتر</label></th>
                                    <td><input type="text" id="twitter-link" name="twitter-link" class="form-control" value="{{\App\General::where('name', 'twitter-link')->first()->value}}"></td>
                                </tr>
                                <tr>
                                    <th class="text-center"><label for="instagram-link">انستقرام</label></th>
                                    <td><input type="text" id="instagram-link" name="instagram-link" class="form-control" value="{{\App\General::where('name', 'instagram-link')->first()->value}}"></td>
                                </tr>
                                <tr>
                                    <th class="text-center"><label for="snapchat-link">سناب شات</label></th>
                                    <td><input type="text" id="snapchat-link" name="snapchat-link" class="form-control" value="{{\App\General::where('name', 'snapchat-link')->first()->value}}"></td>
                                </tr>
                                <tr>
                                    <th class="text-center"><label for="youtube-link">يوتيوب</label></th>
                                    <td><input type="text" id="youtube-link" name="youtube-link" class="form-control" value="{{\App\General::where('name', 'youtube-link')->first()->value}}"></td>
                                </tr>
                            </table>

                            <input type="submit" class="btn btn-success" value="حفظ">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
