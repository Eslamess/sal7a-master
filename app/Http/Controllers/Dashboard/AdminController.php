<?php

namespace App\Http\Controllers\Dashboard;

use App\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
use Illuminate\View\View;

class AdminController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Factory|View
     */
    public function index()
    {
        $admins = Admin::all();
        return view('admin.admin.index')->with('admins', $admins);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Factory|View
     */
    public function create()
    {
        return view('admin.admin.form');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return RedirectResponse
     * @throws ValidationException
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|min:3',
            'username' => 'required|unique:admins|min:3',
            'email' => 'required|email|unique:admins',
            'password' => 'required|min:6|confirmed'
        ]);

        $userData = $request->all('name', 'username', 'email', 'password');
        $userData['password'] = Hash::make($userData['password']);

        $admin = Admin::create($userData);

        return redirect()->route('dashboard.admin.index')->with('success', 'تم إضافة مدير جديد بنجاح');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param Admin $admin
     * @return Factory|View
     */
    public function edit(Admin $admin)
    {
        return view('admin.admin.form')->with('admin', $admin);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param Admin $admin
     * @return RedirectResponse
     * @throws ValidationException
     */
    public function update(Request $request, Admin $admin)
    {
        $this->validate($request, [
            'name' => 'required|min:3',
            'username' => 'required|min:3|unique:admins,id,' . $admin->id,
            'email' => 'required|email|unique:admins,id,' . $admin->id,
        ]);

        $userData = $request->all('name', 'username', 'email', 'password');

        if ($request->input('password')) {
            $this->validate($request, [
                'password' => 'required|min:6|confirmed'
            ]);
            $userData = $request->all('name', 'username', 'email', 'password');
            $userData['password'] = Hash::make($userData['password']);
        }

        $admin = Admin::find($admin->id)->update($userData);

        return redirect()->route('dashboard.admin.index')->with('success', 'تم تعديل بيانات بنجاح');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Admin $admin
     * @return RedirectResponse
     */
    public function destroy(Admin $admin)
    {
        $admin = Admin::find($admin->id)->delete();
        return redirect()->route('dashboard.admin.index')->with('error', 'تم حذف المدير');
    }
}
