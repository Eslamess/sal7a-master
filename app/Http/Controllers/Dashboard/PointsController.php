<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Point;
use Illuminate\Http\Request;

class PointsController extends Controller
{
    //


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */


    /**
     * Show the form for editing the specified resource.
     *
     * @param \App\Agent $agent
     * @return \Illuminate\Http\Response
     */
    public function edit($agent)
    {
        //
        $point=Point::find(1);
        return view('admin.point.form',compact('point'));

    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Agent $agent
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Point $point)
    {
        //
        $this->validate($request, [
            'point_value' => 'required|numeric',
            'credit_value' => 'required|numeric',
            'point_per_order' => 'required|numeric'
        ]);
        $inputs = $request->all('point_value', 'credit_value','point_per_order');
        $user = Point::find(1);
        $user->update($inputs);
       return redirect()->back()->with('success', 'تم تعديل النقاط');
    }



}
