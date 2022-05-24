<?php

namespace App\Http\Controllers\Dashboard;

use App\User;
use App\Http\Controllers\Controller;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
use Illuminate\View\View;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Factory|View
     */
    public function index()
    {
        $users = User::all();
        return view('admin.user.index')->with('users', $users);
    }

    /**
     * @param User $user
     * @return Factory|View
     */
    public function show(User $user)
    {
        $total=0;
        foreach ($user->order as $order){
            $total+=$order->cost;
        }
        $user['total']=$total;
        return view('admin.user.show')->with('user', $user);
    }

    public function destroy(User $user)
    {
        $user = User::find($user->id)->delete();
        return redirect()->route('dashboard.user.index')->with('error', 'تم حذف العضو');
    }

    public function updateStatus(Request $request)
    {
        $this->validate($request, [
            'status' => 'required|in:new,active,banned',
            'user_id' => 'required|exists:users,id'
        ]);

        User::findorfail($request->input('user_id'))->update([
            'status' => $request->input('status')
        ]);

        return redirect()->route('dashboard.user.show', $request->input('user_id'))->with('success', 'تم تغيير حالة العضوية');
    }
}
