<?php

namespace App\Http\Controllers\Dashboard;

use App\Agent;
use App\Category;
use App\Http\Controllers\Controller;
use App\Libraries\ApiResponse;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function index()
    {
        $categories = Category::with('agent','order')->get();
        foreach($categories as $getData){
            $getData['agent_count']=$getData->agent->count();
            $getData['order_count']=$getData->order->count();
        }
        return view('admin.category.index')->with('categories', $categories);
    }

    public function create()
    {
        return view('admin.category.form');
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'name_en' => 'required',
            'icon'=>'required',
            'visit_fees'=>'required|numeric',
        ]);

        $inputs = $request->all(['name', 'name_en','icon','visit_fees']);
        $image = $request->file('icon');
        $image_name = pathinfo($image->getClientOriginalName(), PATHINFO_FILENAME);
        $image_ext = $image->getClientOriginalExtension();
        $image_store_name = $image_name . '_' . time() . '.' . $image_ext;
        $image->storeAs('/public/category', $image_store_name);
        $inputs['icon'] = '/storage/category/' . $image_store_name;

        $category = Category::create($inputs);

        return redirect()->route('dashboard.category.index')->with('success', 'تم إضافة خدمة جديدة');
    }

    public function edit(Category $category)
    {
        return view('admin.category.form')->with('category', $category);
    }

    public function update(Request $request, Category $category)
    {
        $this->validate($request, [
            'name' => 'required',
            'name_en' => 'required',
            'icon'=>'nullable',
            'visit_fees'=>'required|numeric',
        ]);

       $inputs = $request->all(['name', 'name_en','icon','visit_fees']);

        if($request->file('icon')) {
            $image = $request->file('icon');
            $image_name = pathinfo($image->getClientOriginalName(), PATHINFO_FILENAME);
            $image_ext = $image->getClientOriginalExtension();
            $image_store_name = $image_name . '_' . time() . '.' . $image_ext;
            $image->storeAs('/public/category', $image_store_name);
            $inputs['icon'] = '/storage/category/' . $image_store_name;
            $pathes = explode("/",$category->icon );
            $mainPath = explode("public",public_path() );
            @unlink( $mainPath[0].'storage/app/public/'.$pathes[2].'/' .$pathes[3] );
            $category = Category::updateOrCreate(['id' => $category->id], $inputs);
        return redirect()->route('dashboard.category.index')->with('success', 'تم تعديل الخدمة بنجاح');

    }else{
            $category = Category::updateOrCreate(['id' => $category->id], $inputs);
            return redirect()->route('dashboard.category.index')->with('success', 'تم تعديل الخدمة بنجاح');
        }

    }
}
