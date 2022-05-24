<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PageController extends Controller
{
    public function index(){
        $pages = DB::table('pages')->get();
        return view('admin.page.index')->with('items', $pages);
    }

    public function show($page){
        $page = DB::table('pages')->where('id', $page)->first();
        return view('admin.page.show')->with('item', $page);
    }

    public function edit($page){
        $page = DB::table('pages')->where('id', $page)->first();
        return view('admin.page.form')->with('item', $page);
    }

    public function update($page, Request $request){
        $page = DB::table('pages')->where('id', $page)->first();
        if($page){
            DB::table('pages')->where('id', $page->id)->update([
                'content_ar' => $request->input('content_ar'),
                'content_en' => $request->input('content_en')
            ]);
        }else{
            return redirect()->route('dashboard.page.index')->with('error', 'هذة الصفحة للأسف غير موجودة');
        }

        return redirect()->route('dashboard.page.index')->with('success', 'تم تعديل الصفحة');
    }
}
