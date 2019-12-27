<?php

namespace App\Http\Controllers\References;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\References\Unit; // model of table
use App\Http\Resources\Reference; //required always for json encoding
use Carbon\Carbon; //data
use Illuminate\Support\Facades\Validator; //validation
use Auth;

class UnitsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $unit = Unit::where('is_deleted', 0)->orderBy('unit_id', 'desc')->get();
        return Reference::collection($unit);;
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
            'unit_code' => 'required',
            'unit_name' => 'required'
        ]
    )->validate();

    $unit = new Unit();
    $unit->unit_code = $request->input('unit_code');
    $unit->unit_name = $request->input('unit_name');
    $unit->unit_desc = $request->input('unit_desc');
    $unit->sort_key = $request->input('sort_key');
    $unit->created_datetime = Carbon::now();
    $unit->created_by = Auth::user()->user_id;

    $unit->save();

    //return json based from the resource data
    return ( new Reference( $unit ))
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
        $unit = Unit::findOrFail($id);

        return ( new Reference( $unit ) )
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
        $unit = Unit::findOrFail($id);
        
        Validator::make($request->all(),
            [
                'unit_code' => 'required',
                'unit_name' => 'required'
            ]
        )->validate();

        
        $unit->unit_code = $request->input('unit_code');
        $unit->unit_name = $request->input('unit_name');
        $unit->unit_desc = $request->input('unit_desc');
        $unit->sort_key = $request->input('sort_key');
        $unit->modified_datetime = Carbon::now();
        $unit->modified_by = Auth::user()->user_id;


        //update  based on the http json body that is sent
        $unit->save();

        return ( new Reference( $unit ) )
            ->response()
            ->setStatusCode(200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {   
        $unit = Unit::findOrFail($id);

        $unit->is_deleted = 1;
        $unit->deleted_datetime = Carbon::now();
        $unit->deleted_by = Auth::user()->user_id;

        //update classification based on the http json body that is sent
        $unit->save();

        return ( new Reference( $unit ) )
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
