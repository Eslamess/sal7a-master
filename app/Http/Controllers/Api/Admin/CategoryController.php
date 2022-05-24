<?php

namespace App\Http\Controllers\Api\Admin;

use App\Category;
use App\Http\Controllers\Controller;
use App\Libraries\ApiResponse;
use App\Libraries\ApiValidator;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function create(Request $request)
    {

        $validate = ApiValidator::validate([
            'name' => 'required',
            'name_en' => 'required',
            'icon' => 'required|image'
        ]);

        if ($validate) {
            return ApiResponse::errors($validate);
        }

        $inputs = $request->all('name', 'name_en');

        $icon = $request->file('icon');

        $filename = pathinfo($icon->getClientOriginalName(), PATHINFO_FILENAME);
        $extension = $icon->getClientOriginalExtension();
        $icon->storeAs('public/category', str_replace(' ', '', $filename).time().'.'.$extension);

        $inputs['icon'] = '/storage/category/'.str_replace(' ', '', $filename).time().'.'.$extension;

        $category = Category::create($inputs);
        return ApiResponse::data(['category' => $category]);
    }
}
