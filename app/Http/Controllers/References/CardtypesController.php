<?php

namespace App\Http\Controllers\References;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\References\Cardtype; // model of table
use App\Http\Resources\Reference; //required always for json encoding
use Carbon\Carbon; //data
use Illuminate\Support\Facades\Validator; //validation
use Auth;

class CardtypesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $cardtype = Cardtype::where('is_deleted', 0)->orderBy('card_type_id', 'desc')->get();
        return Reference::collection($cardtype);;
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
            'card_type_code' => 'required',
            'card_type_name' => 'required'
        ]
        
    )->validate();

    $cardtype = new Cardtype();
    $cardtype->card_type_code = $request->input('card_type_code');
    $cardtype->card_type_name = $request->input('card_type_name');
    $cardtype->card_type_desc = $request->input('card_type_desc');
    $cardtype->sort_key = $request->input('sort_key');
    $cardtype->created_datetime = Carbon::now();
    $cardtype->created_by = Auth::user()->user_id;

    $cardtype->save();

    //return json based from the resource data
    return ( new Reference( $cardtype ))
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
        $cardtype = Cardtype::findOrFail($id);

        return ( new Reference( $cardtype ) )
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
        $cardtype = Cardtype::findOrFail($id);
        
        Validator::make($request->all(),
            [
                'card_type_code' => 'required',
                'card_type_name' => 'required'
            ]
        )->validate();

        
        $cardtype->card_type_code = $request->input('card_type_code');
        $cardtype->card_type_name = $request->input('card_type_name');
        $cardtype->card_type_desc = $request->input('card_type_desc');
        $cardtype->sort_key = $request->input('sort_key');
        $cardtype->modified_datetime = Carbon::now();
        $cardtype->modified_by = Auth::user()->user_id;


        //update  based on the http json body that is sent
        $cardtype->save();

        return ( new Reference( $cardtype ) )
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
        $cardtype = Cardtype::findOrFail($id);

        $cardtype->is_deleted = 1;
        $cardtype->deleted_datetime = Carbon::now();
        $cardtype->deleted_by = Auth::user()->user_id;

        //update classification based on the http json body that is sent
        $cardtype->save();

        return ( new Reference( $cardtype ) )
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

