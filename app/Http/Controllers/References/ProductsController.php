<?php

namespace App\Http\Controllers\References;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\References\Product; // model of table
use App\Http\Resources\Reference; //required always for json encoding
use Carbon\Carbon; //data
use Illuminate\Support\Facades\Validator; //validation
use Auth;

class ProductsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $product = Product::where('is_deleted', 0)->orderBy('product_id', 'desc')->get();
        return Reference::collection($product);;
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
            'product_code' => 'required',
            'product_name' => 'required',
            'category_id' => 'required',
            'menu_id' => 'required',
            'inventory_type_id' => 'required',
            'supplier_id' => 'required',
            'unit_id' => 'required'
            

        ]
    )->validate();

    $product = new Product();
    $product->product_code = $request->input('product_code');
    $product->product_name = $request->input('product_name');
    $product->product_desc = $request->input('product_desc');
    $product->product_cost = $request->input('product_cost');
    $product->product_rate = $request->input('product_rate');
    $product->vat_percent  = $request->input('vat_percent');
    $product->category_id  = $request->input('category_id');
    $product->menu_id  = $request->input('menu_id');
    $product->inventory_type_id  = $request->input('inventory_type_id');
    $product->supplier_id  = $request->input('supplier_id');
    $product->unit_id  = $request->input('unit_id');
    $product->product_backcolor = $request->input('product_backcolor');
    $product->product_forecolor  = $request->input('product_forecolor');
    $product->sort_key = $request->input('sort_key');
    $product->created_datetime = Carbon::now();
    $product->created_by = Auth::user()->user_id;

    $product->save();

    //return json based from the resource data
    return ( new Reference( $product ))
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
        $product = Product::findOrFail($id);

        return ( new Reference( $product ) )
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
        $product = Product::findOrFail($id);
        
        Validator::make($request->all(),
            [
                'product_code' => 'required',
                'product_name' => 'required',
                'category_id' => 'required',
                'menu_id' => 'required',
                'inventory_type_id' => 'required',
                'supplier_id' => 'required',
                'unit_id' => 'required'
                
            ]
        )->validate();

        $product->product_code = $request->input('product_code');
        $product->product_name = $request->input('product_name');
        $product->product_desc = $request->input('product_desc');
        $product->product_cost = $request->input('product_cost');
        $product->product_rate = $request->input('product_rate');
        $product->vat_percent  = $request->input('vat_percent');
        $product->category_id  = $request->input('category_id');
        $product->menu_id  = $request->input('menu_id');
        $product->inventory_type_id  = $request->input('inventory_type_id');
        $product->supplier_id  = $request->input('supplier_id');
        $product->unit_id  = $request->input('unit_id');
        $product->product_backcolor = $request->input('product_backcolor');
        $product->product_forecolor  = $request->input('product_forecolor');
        $product->modified_datetime = Carbon::now();
        $product->modified_by = Auth::user()->user_id;


        //update  based on the http json body that is sent
        $product->save();

        return ( new Reference( $product ) )
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
        $product = Product::findOrFail($id);

        $product->is_deleted = 1;
        $product->deleted_datetime = Carbon::now();
        $product->deleted_by = Auth::user()->user_id;

        //update classification based on the http json body that is sent
        $product->save();

        return ( new Reference( $product ) )
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
