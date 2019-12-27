<?php

namespace App\Http\Controllers\References;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\References\Discounttype; // model of table
use App\Http\Resources\Reference; //required always for json encoding
use Carbon\Carbon; //data
use Illuminate\Support\Facades\Validator; //validation
use Auth;


class DiscounttypesController extends Controller

{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $discounttype = Discounttype::where('is_deleted', 0)->orderBy('discount_type_id', 'desc')->get();
        return Reference::collection($discounttype);;
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
            'discount_type_code' => 'required',
            'discount_type_name' => 'required',
            'discount_percent' => 'required | not_in:0'
        ]
    )->validate();

    $discounttype = new Discounttype();
    $discounttype->discount_type_code = $request->input('discount_type_code');
    $discounttype->discount_type_name = $request->input('discount_type_name');
    $discounttype->discount_type_desc = $request->input('discount_type_desc');
    $discounttype->discount_percent = $request->input('discount_percent');
    $discounttype->sort_key = $request->input('sort_key');
    $discounttype->created_datetime = Carbon::now();
    $discounttype->created_by = Auth::user()->user_id;

    $discounttype->save();

    //return json based from the resource data
    return ( new Reference( $discounttype ))
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
        $discounttype = Discounttype::findOrFail($id);

        return ( new Reference( $discounttype ) )
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
        $discounttype = Discounttype::findOrFail($id);
        
        Validator::make($request->all(),
            [
                'discount_type_code' => 'required',
                'discount_type_name' => 'required',
                'discount_percent' => 'required | not_in:0'
            ]
        )->validate();

        
        $discounttype->discount_type_code = $request->input('discount_type_code');
        $discounttype->discount_type_name = $request->input('discount_type_name');
        $discounttype->discount_type_desc = $request->input('discount_type_desc');
        $discounttype->discount_percent = $request->input('discount_percent');
        $discounttype->sort_key = $request->input('sort_key');
        $discounttype->modified_datetime = Carbon::now();
        $discounttype->modified_by = Auth::user()->user_id;


        //update  based on the http json body that is sent
        $discounttype->save();

        return ( new Reference( $discounttype ) )
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
        $discounttype = Discounttype::findOrFail($id);

        $discounttype->is_deleted = 1;
        $discounttype->deleted_datetime = Carbon::now();
        $discounttype->deleted_by = Auth::user()->user_id;

        //update classification based on the http json body that is sent
        $discounttype->save();

        return ( new Reference( $discounttype ) )
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