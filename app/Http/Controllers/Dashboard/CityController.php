<?php

namespace App\Http\Controllers\Dashboard;

use App\City;
use App\Http\Controllers\Controller;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Validation\ValidationException;
use Illuminate\View\View;

class CityController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Factory|View
     */
    public function index()
    {
        $cities = City::where('parent_id', '=', null)->get();
        $areas = City::where('parent_id', '!=', null)->orderBY('parent_id')->get();

        return view('admin.city.index')
            ->with('cities', $cities)
            ->with('areas', $areas);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Factory|View
     */
    public function create()
    {
        $cities = City::where('parent_id', '=', null)->get();
        return view('admin.city.form')->with('cities', $cities);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     * @throws ValidationException
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'name_en' => 'required',
            'parent_id' => 'exists:cities,id|nullable'
        ]);

            $inputs = $request->all(['name', 'name_en', 'parent_id']);


        $city = City::create($inputs);

        return redirect()->route('dashboard.city.index')->with('success', 'تم إضافة جديدة بنجاح');
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param City $city
     * @return Factory|View
     */
    public function edit(City $city)
    {
        $cities = City::where('parent_id', '=', null)->get();
        return view('admin.city.form')
            ->with('cities', $cities)
            ->with('city', $city);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param City $city
     * @return void
     * @throws ValidationException
     */
    public function update(Request $request, City $city)
    {
        $this->validate($request, [
            'name' => 'required',
            'name_en' => 'required',
            'parent_id' => 'exists:cities,id|nullable'
        ]);


            $inputs = $request->all(['name', 'name_en', 'parent_id']);

        $city = City::updateOrCreate(['id' => $city->id], $inputs);

        return redirect()->route('dashboard.city.index')->with('success', 'تم تعديل المدينة بنجاح');
    }
}
