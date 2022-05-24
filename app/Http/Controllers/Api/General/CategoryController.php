<?php

namespace App\Http\Controllers\Api\General;

use App\Category;
use App\Http\Controllers\Controller;
use App\Libraries\ApiResponse;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function index()
    {
        $cities = Category::all();
        return ApiResponse::data(['categories' => $cities]);
    }
}
