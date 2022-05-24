<?php

namespace App\Http\Controllers\Dashboard;

use App\Agent;
use App\Category;
use App\City;
use App\Http\Controllers\Controller;
use App\Libraries\ApiValidator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class ContractorAgent extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $agents = Agent::where('admin_id',Auth::guard('admin')->user()->id)->get();
        return view('admin.contractor.agent.index')->with('agents', $agents);

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
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
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $validate = ApiValidator::validate(Agent::registerRulesWeb());
        if ($validate) {
            return redirect()->route('dashboard.contractorAgent.index')->with('message', $validate);

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
        return redirect()->route('dashboard.contractorAgent.index')->with('success', 'تم اضاقة عامل');



    }

    /**
     * Display the specified resource.
     *
     * @param  Agent $agent
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        $agent=Agent::find($id);

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

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Agent $agent
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        $agent=Agent::find($id);
        $cities=City::all();
        $category=Category::all();
        return view('admin.contractor.agent.form',compact('agent','cities','category'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  Agent $agent
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        //
        $agent=Agent::find($id);
        $validate = ApiValidator::validate(Agent::registerRulesWebUpdate());
        if ($validate) {
            return redirect()->route('dashboard.contractorAgent.index')->with('message', $validate);
        }
        $inputs = $request->all('name', 'city_id', 'phone',  'birthday', 'category_id','email');
        if($request->input('password')) {
            $password = $request->input('password');
            $inputs['password'] = Hash::make($password);
        }


        $agent->update($inputs);

        return redirect()->route('dashboard.contractorAgent.index')->with('success', 'تم تعديل عامل');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Agent $agent
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        $user = Agent::where('id',$id)->delete();
        if($user)
            return redirect()->route('dashboard.contractorAgent.index')->with('error', 'تم حذف العضو');
    }
}
