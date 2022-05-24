<?php

namespace App\Http\Controllers\Dashboard;

use App\Admin;
use App\Agent;
use App\Category;
use App\City;
use App\Http\Controllers\Controller;
use App\Libraries\ApiValidator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class ContractorDataController extends Controller
{
    //
    // agent data
    public  function index(){
        $agents = Agent::where('admin_id',Auth::guard('admin')->user()->id)->get();
        return view('admin.contractor.agent.index')->with('agents', $agents);

    }
    public function create()
    {
        //
        $cities=City::all();
        $category=Category::all();
        return view('admin.contractor.agent.form',compact('cities', 'category'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $validate = ApiValidator::validate(Agent::registerRulesWeb());
        if ($validate) {
            return redirect()->route('dashboard.contractorData.index')->with('message', $validate);

        }
        $inputs = $request->all('name', 'city_id', 'phone',  'birthday', 'category_id', 'image', 'national_id2','email');
        $password = $request->input('password');
        $inputs['password'] = Hash::make($password);

        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $image_name = pathinfo($image->getClientOriginalName(), PATHINFO_FILENAME);
            $image_ext = $image->getClientOriginalExtension();
            $image_store_name = $image_name . '_' . time() . '.' . $image_ext;
            $image->storeAs('/public/agents', $image_store_name);
            $inputs['image'] = '/storage/agents/' . $image_store_name;
        }

        if ($request->hasFile('national_id')) {
            $images = $request->file('national_id');
            foreach ($images as $image) {}
            $image_name = pathinfo($image->getClientOriginalName(), PATHINFO_FILENAME);
            $image_ext = $image->getClientOriginalExtension();
            $image_store_name = $image_name . '_' . time() . '.' . $image_ext;
            $image->storeAs('/public/id', $image_store_name);

            $inputs['national_id'][] = '/storage/id/' . $image_store_name;
            $inputs['national_id']=ApiValidator::ConvertArrayImageToString($inputs['national_id']);
        }


        if ($request->hasFile('documents_images')) {

            $images = $request->file('documents_images');
            foreach ($images as $image) {
                $image_name = pathinfo($image->getClientOriginalName(), PATHINFO_FILENAME);
                $image_ext = $image->getClientOriginalExtension();

                $image_store_name = $image_name . '_' . time() . '.' . $image_ext;

                $image->storeAs('/public/documents', $image_store_name);

                $inputs['documents_images'][] = '/storage/documents/' . $image_store_name;
            }
            $inputs['documents_images']=ApiValidator::ConvertArrayImageToString($inputs['documents_images']);
        }
        $inputs['admin_id']=Auth::guard('admin')->user()->id;
        $user = Agent::create($inputs);



        $user['role'] = 'agent';
        $user['documents_images']=ApiValidator::ConvertStringImageToArray($inputs['documents_images']);
        $user['national_id']=ApiValidator::ConvertStringImageToArray($inputs['national_id']);
        return redirect()->route('dashboard.contractorData.index')->with('success', 'تم اضاقة عامل');


    }

    /**
     * Display the specified resource.
     *
     * @param \App\Agent $agent
     * @return \Illuminate\Http\Response
     */
    public function show(Agent $agent)
    {
        // dd($agent->order);
        $total=0;
        foreach ($agent->order as $order){
            $total+=$order->cost;
        }
        $agent['total']=$total;
        $agent['age']=floor((time() - strtotime($agent->birthday)) / 31556926);
        $agent['documents_data']=explode(",",$agent['documents_images']);
        $agent['national_data']=explode(",",$agent['national_id']);

        return view('admin.contractor.agent.show')->with('agent', $agent);
    }
    public function destroy($agent)
    {
        //


        $user = Agent::where('id',$agent)->delete();
        if($user)
            return redirect()->route('dashboard.contractorData.index')->with('error', 'تم حذف العضو');

    }
    public function edit(Agent $agent)
    {
        //
        $cities=City::all();
        $category=Category::all();
        return view('admin.contractor.agent.form',compact('agent','cities','category'));

    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Agent $agent
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Agent $agent)
    {
        //
        $validate = ApiValidator::validate(Agent::registerRulesWebUpdate());
        if ($validate) {
            return redirect()->route('dashboard.ContractorData.form')->with('message', $validate);
        }
        $inputs = $request->all('name', 'city_id', 'phone',  'birthday', 'category_id','email');
        if($request->input('password')) {
            $password = $request->input('password');
            $inputs['password'] = Hash::make($password);
        }

        $user = Agent::find($agent->id);
        $user->update($inputs);

        return redirect()->route('dashboard.ContractorData.index')->with('success', 'تم تعديل عامل');
    }

}
