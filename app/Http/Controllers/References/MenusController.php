<?php

namespace App\Http\Controllers\References;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\References\Menu; // model of table
use App\Http\Resources\Reference; //required always for json encoding
use Carbon\Carbon; //data
use Illuminate\Support\Facades\Validator; //validation
use Auth;

class MenusController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $menu = Menu::where('is_deleted', 0)->orderBy('menu_id', 'desc')->get();
        return Reference::collection($menu);;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        Validator::make($request->all(),
        [
            'menu_code' => 'required',
            'menu_name' => 'required'
        ]
    )->validate();

    $menu = new Menu();
    $menu->menu_code = $request->input('menu_code');
    $menu->menu_name = $request->input('menu_name');
    $menu->menu_desc = $request->input('menu_desc');
    $menu->sort_key = $request->input('sort_key');
    $menu->created_datetime = Carbon::now();
    $menu->created_by = Auth::user()->user_id;

    $menu->save();

    //return json based from the resource data
    return ( new Reference( $menu ))
            ->response()
            ->setStatusCode(201);
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
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $menu = Menu::findOrFail($id);

        return ( new Reference( $menu ) )
            ->response()
            ->setStatusCode(200);
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
        $menu = Menu::findOrFail($id);
        
        Validator::make($request->all(),
            [
                'menu_code' => 'required',
                'menu_name' => 'required'
            ]
        )->validate();

        
        $menu->menu_code = $request->input('menu_code');
        $menu->menu_name = $request->input('menu_name');
        $menu->menu_desc = $request->input('menu_desc');
        $menu->sort_key = $request->input('sort_key');
        $menu->modified_datetime = Carbon::now();
        $menu->modified_by = Auth::user()->user_id;


        //update  based on the http json body that is sent
        $menu->save();

        return ( new Reference( $menu ) )
            ->response()
            ->setStatusCode(200);
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
    }
    public function delete($id)
    {   
        $menu = Menu::findOrFail($id);

        $menu->is_deleted = 1;
        $menu->deleted_datetime = Carbon::now();
        $menu->deleted_by = Auth::user()->user_id;

        //update classification based on the http json body that is sent
        $menu->save();

        return ( new Reference( $menu ) )
            ->response()
            ->setStatusCode(200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function checkIfUsed($id)
    {
        $exists = 'false';

        // if(ContractInfo::where('department_id', '=', $id)
        //     ->where('is_deleted', 0)
        //     ->exists()) {
        //     $exists = 'true';
        // }
        return $exists;
        }
}