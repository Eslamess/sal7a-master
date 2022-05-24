@extends('admin.layouts.main')
@section('content')

    <div class="content">
        <!-- card -->
        <div class="card">

            <div class="icon"><i class=" md-36">{{$agents->user_count}}</i></div>
            <p class="title">عميل</p>
            <p class="text">عدد العملاء المتاحين لديك</p>

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

            <div class="icon"><i class="material-icons md-36">{{number_format($agents->user_rate)}}<span style="font-size: 10px">نجمات</span></i></div>
            <p class="title">تقيم العملاء</p>
            <p class="text">اجمالي تقيم العملاء</p>

        </div>
        <!-- end card -->



    </div>
    </div>

    <style>


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
