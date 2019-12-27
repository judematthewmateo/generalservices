<?php

namespace App\Http\Controllers\References;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\References\Inventorytype; // model of table
use App\Http\Resources\Reference; //required always for json encoding
use Carbon\Carbon; //data
use Illuminate\Support\Facades\Validator; //validation
use Auth;
class InventorytypesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $inventorytype = Inventorytype::where('is_deleted', 0)->orderBy('inventory_type_id', 'desc')->get();
        return Reference::collection($inventorytype);;
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
            'inventory_type_code' => 'required',
            'inventory_type_name' => 'required' 
        
        ]
    )->validate();

    $inventorytype = new Inventorytype();
    $inventorytype->inventory_type_code = $request->input('inventory_type_code');
    $inventorytype->inventory_type_name = $request->input('inventory_type_name');
    $inventorytype->inventory_type_desc = $request->input('inventory_type_desc');
    $inventorytype->sort_key = $request->input('sort_key');
    $inventorytype->created_datetime = Carbon::now();
    $inventorytype->created_by = Auth::user()->user_id;

    $inventorytype->save();

    //return json based from the resource data
    return ( new Reference( $inventorytype ))
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
        $inventorytype = Inventorytype::findOrFail($id);

        return ( new Reference( $inventorytype ) )
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
        $inventorytype = Inventorytype::findOrFail($id);
        
        Validator::make($request->all(),
            [
                'inventory_type_code' => 'required',
                'inventory_type_name' => 'required'
                
            ]
        )->validate();

        
        $inventorytype->inventory_type_code = $request->input('inventory_type_code');
        $inventorytype->inventory_type_name = $request->input('inventory_type_name');
        $inventorytype->inventory_type_desc = $request->input('inventory_type_desc');
        $inventorytype->sort_key = $request->input('sort_key');
        $inventorytype->modified_datetime = Carbon::now();
        $inventorytype->modified_by = Auth::user()->user_id;


        //update  based on the http json body that is sent
        $inventorytype->save();

        return ( new Reference( $inventorytype ) )
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
        $inventorytype = Inventorytype::findOrFail($id);

        $inventorytype->is_deleted = 1;
        $inventorytype->deleted_datetime = Carbon::now();
        $inventorytype->deleted_by = Auth::user()->user_id;

        //update classification based on the http json body that is sent
        $inventorytype->save();

        return ( new Reference( $inventorytype ) )
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
