@extends('admin.layouts.main')
@section('content')
    <div class="">
        <div class="page-title">
            <div class="title_left">

                <h3>{{isset($admin)?'تعديل مدير '.$admin->name: 'إضافة مدير'}}</h3>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">
                        <br/>
                        <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left"
                              action="{{isset($admin)?route('dashboard.contractor.update',$admin):route('dashboard.contractor.store')}}"
                              method="post" enctype="multipart/form-data">
                            @include('admin.layouts.messages')
                            @csrf
                            {{isset($admin)?method_field('PUT'):''}}

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">
                                    الإسم
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" required="required"
                                           class="form-control col-md-7 col-xs-12" id="name" name="name"
                                           value="@if(old('name')){{old('name')}}@elseif(isset($admin->name)){{$admin->name}}@endif">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="username">
                                    إسم المستخدم
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" required="required"
                                           class="form-control col-md-7 col-xs-12" id="username" name="username"
                                           value="@if(old('username')){{old('username')}}@elseif(isset($admin->username)){{$admin->username}}@endif">
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">
                                    البريد الالكترونى
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" required="required"
                                           class="form-control col-md-7 col-xs-12" id="email" name="email"
                                           value="@if(old('email')){{old('email')}}@elseif(isset($admin->email)){{$admin->email}}@endif">
                                </div>
                            </div>

                            <div class="form-group" {{!isset($admin)?'hidden':''}}>
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="password">
                                     كلمة المرور
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="checkbox" id="changePassword">
                                </div>
                            </div>

                            <div style="{{isset($admin)?'display:none':''}}" id="changePasswordF">
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="password">
                                        كلمة المرور
                                    </label>
                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                        <input type="password" required="required"
                                               class="form-control col-md-7 col-xs-12" id="password" name="password" {{isset($admin)?'disabled':''}}>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                           for="password_confirmation">
                                        كلمة المرور تاكيد
                                    </label>
                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                        <input type="password" required="required"
                                               class="form-control col-md-7 col-xs-12" id="password_confirmation"
                                               name="password_confirmation" {{isset($admin)?'disabled':''}}>
                                    </div>
                                </div>
                            </div>

                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                    <button type="submit" class="btn btn-primary">حفظ</button>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @push('script')
        <script>
            $('#changePassword').on('change', function () {
                if ($(this).prop('checked'))
                    $('#changePasswordF').css('display', 'block').find('input').prop('disabled', false)
                else
                    $('#changePasswordF').css('display', 'none').find('input').prop('disabled', true)
            });
        </script>
    @endpush
@endsection
