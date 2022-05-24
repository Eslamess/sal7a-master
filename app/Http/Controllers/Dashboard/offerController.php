<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Offer;
use App\User;
use Illuminate\Http\Request;

class offerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $offers=Offer::all();
        return view('admin.offer.index')->with('offers',$offers);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {

        return view('admin.offer.form');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $this->validate($request, [
            'name_ar' => 'required',
            'name_en' => 'required',
            'start_date' => 'required|before:end_date',
            'end_date' => 'required|after:start_date',
            'coupon' => 'required',
            'type' => 'required|in:amount,percentage',
            'discount' => 'required|numeric',
            'text_en' => 'required',
            'text_ar' => 'required',
        ]);
        $request['status']='active';

        $inputs = $request->all();
        $offer = Offer::create($inputs);



        if($offer){
            $this->sendNotifi('عروض صلحها','يوجد عرض جديد بأنتظارك!'
                ,0,'user','offer',$offer->id,User::all());
            return redirect()->route('dashboard.offers.index')->with('success', 'تم اضافة الخصم');

        }
        else
            return redirect()->route('dashboard.offers.index')->with('error', 'حدث خطأ');

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        $offer=Offer::find($id);
        return view('admin.offer.form')->with('offer',$offer);

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        $this->validate($request, [
            'name_ar' => 'required',
            'name_en' => 'required',
            'start_date' => 'required|before:end_date',
            'end_date' => 'required|after:start_date',
            'coupon' => 'required',
            'type' => 'required|in:amount,percentage',
            'discount' => 'required|numeric',
            'text_en' => 'required',
            'text_ar' => 'required',
        ]);
        $offer = Offer::find($id);
        if($request->input('end_date')>= date('Y/m/d')){
            $request['status']='active';

        }
        $inputs = $request->all();

        $offer->update($inputs);
        if($offer){
            $this->sendNotifi('عروض صلحها',$offer->name_ar.'تم تمديد وقت العرض '
                ,0,'user','offer',$id,User::all());
            return redirect()->route('dashboard.offers.index')->with('success', 'تم تعديل الخصم');

        }
        else
            return redirect()->route('dashboard.offers.index')->with('error', 'حدث خطأ');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        $user = Offer::find($id)->delete();
        return redirect()->route('dashboard.offers.index')->with('error', 'تم حذف الخصم');

    }

}
