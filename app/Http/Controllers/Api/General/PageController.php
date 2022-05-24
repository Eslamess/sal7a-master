<?php

namespace App\Http\Controllers\Api\General;

use App\Http\Controllers\Controller;
use App\Libraries\ApiResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PageController extends Controller
{

    public function show(Request $request)
    {
        $name = $request->input('name');

        $page = DB::table('pages')->where('name', $name)->first();
        if ($page)
            return ApiResponse::data($page);
        else
            return ApiResponse::errors(['page' => 'page not found']);
    }
}
