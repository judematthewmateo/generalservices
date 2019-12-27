<?php

namespace App\Http\Controllers\References;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\References\Supplier; // model of table
use App\Http\Resources\Reference; //required always for json encoding
use Carbon\Carbon; //data
use Illuminate\Support\Facades\Validator; //validation
use Auth;


class SuppliersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $supplier = Supplier::where('is_deleted', 0)->orderBy('supplier_id', 'desc')->get();
        return Reference::collection($supplier);;
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
            'supplier_code' => 'required',
            'supplier_name' => 'required'
        ]
    )->validate();

    $supplier = new Supplier();
    $supplier->supplier_code = $request->input('supplier_code');
    $supplier->supplier_name = $request->input('supplier_name');
    $supplier->address = $request->input('address');
    $supplier->contact_person = $request->input('contact_person');
    $supplier->contact_number = $request->input('contact_number');
    $supplier->email_address = $request->input('email_address');    
    $supplier->sort_key = $request->input('sort_key');
    $supplier->created_datetime = Carbon::now();
    $supplier->created_by = Auth::user()->user_id;

    $supplier->save();

    //return json based from the resource data
    return ( new Reference( $supplier ))
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
        $supplier = Supplier::findOrFail($id);

        return ( new Reference( $supplier ) )
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
        $supplier = Supplier::findOrFail($id);
        
        Validator::make($request->all(),
            [
                'supplier_code' => 'required',
                'supplier_name' => 'required'
                
            ]
        )->validate();

        $supplier->supplier_code = $request->input('supplier_code');
        $supplier->supplier_name = $request->input('supplier_name');
        $supplier->address = $request->input('address');
        $supplier->contact_person = $request->input('contact_person');
        $supplier->contact_number = $request->input('contact_number');
        $supplier->email_address = $request->input('email_address');    
        $supplier->sort_key = $request->input('sort_key');
        $supplier->created_datetime = Carbon::now();
        $supplier->created_by = Auth::user()->user_id;



        //update  based on the http json body that is sent
        $supplier->save();

        return ( new Reference( $supplier ) )
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
        $supplier = Supplier::findOrFail($id);

        $supplier->is_deleted = 1;
        $supplier->deleted_datetime = Carbon::now();
        $supplier->deleted_by = Auth::user()->user_id;

        //update classification based on the http json body that is sent
        $supplier->save();

        return ( new Reference( $supplier ) )
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
