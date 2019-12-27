<?php

namespace App\Http\Controllers\References;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\References\Gctype; // model of table
use App\Http\Resources\Reference; //required always for json encoding
use Carbon\Carbon; //data
use Illuminate\Support\Facades\Validator; //validation
use Auth;

class GctypesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $gctype = Gctype::where('is_deleted', 0)->orderBy('gc_type_id', 'desc')->get();
        return Reference::collection($gctype);;
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
            'gc_type_code' => 'required',
            'gc_type_name' => 'required'
        ]
    )->validate();

    $gctype = new Gctype();
    $gctype->gc_type_code = $request->input('gc_type_code');
    $gctype->gc_type_name = $request->input('gc_type_name');
    $gctype->gc_type_desc = $request->input('gc_type_desc');
    $gctype->sort_key = $request->input('sort_key');
    $gctype->created_datetime = Carbon::now();
    $gctype->created_by = Auth::user()->user_id;

    $gctype->save();

    //return json based from the resource data
    return ( new Reference( $gctype ))
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
        $gctype = Gctype::findOrFail($id);

        return ( new Reference( $gctype ) )
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
        $gctype = Gctype::findOrFail($id);
        
        Validator::make($request->all(),
            [
                'gc_type_code' => 'required',
                'gc_type_name' => 'required'
            ]
        )->validate();

        
        $gctype->gc_type_code = $request->input('gc_type_code');
        $gctype->gc_type_name = $request->input('gc_type_name');
        $gctype->gc_type_desc = $request->input('gc_type_desc');
        $gctype->sort_key = $request->input('sort_key');
        $gctype->modified_datetime = Carbon::now();
        $gctype->modified_by = Auth::user()->user_id;


        //update  based on the http json body that is sent
        $gctype->save();

        return ( new Reference( $gctype ) )
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
        $gctype = Gctype::findOrFail($id);

        $gctype->is_deleted = 1;
        $gctype->deleted_datetime = Carbon::now();
        $gctype->deleted_by = Auth::user()->user_id;

        //update classification based on the http json body that is sent
        $gctype->save();

        return ( new Reference( $gctype ) )
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
