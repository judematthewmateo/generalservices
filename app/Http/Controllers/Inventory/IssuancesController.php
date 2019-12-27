<?php

namespace App\Http\Controllers\Inventory;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\References\Product;
use App\Models\References\Department;
use App\Models\Inventory\IssuanceMain;
use App\Models\Inventory\IssuanceDetails;
use App\Http\Resources\Reference;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;
use Auth;
use DB;

class IssuancesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data['issuances'] = IssuanceMain::select(
                                'inv_issuance_main.*',
                                'rd.department_name'
        )
                                ->leftJoin('refdepartment as rd', 'rd.department_id', '=', 'inv_issuance_main.department_id')
                                ->where('inv_issuance_main.is_deleted', 0)
                                ->get();

        $data['products'] = Product::leftJoin('refunit', 'refunit.unit_id', 'refproduct.unit_id')
                                ->leftJoin('refcategory', 'refcategory.category_id', 'refproduct.category_id')
                                ->leftJoin('refsupplier', 'refsupplier.supplier_id', 'refproduct.supplier_id')
                                ->where('refproduct.is_deleted', 0)
                                ->orderBy('refproduct.product_id')
                                ->get();
        
        $data['departments'] = Department::where('is_deleted', 0)->orderBy('department_id')->get();

        return $data;
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
                'department_id' => 'required',
                'issuance_datetime' => 'required',
            ]
        )->validate();

        $issuance = new IssuanceMain();
        $issuance->issuance_no = DB::raw('CreateIssuanceNo()');
        $issuance->department_id = $request->input('department_id');
        $issuance->location = $request->input('location');
        $issuance->issued_to = $request->input('issued_to');
        $issuance->issuance_datetime = date('Y-m-d H:i:s', strtotime($request->input('issuance_datetime')));
        $issuance->issuance_remarks = $request->input('issuance_remarks');
        $issuance->total_amount = $request->input('total_amount');
        $issuance->created_datetime = Carbon::now();
        $issuance->created_by = Auth::user()->user_id;
    
        $issuance->save();
        
        $items = $request->input('items');
        
        // // //first way
        // foreach($items as $item)
        // {
        //     $purchase_item = new PurchaseOrderItems;
        //     $purchase_item->purchase_order_id = $purchase->purchase_order_id;
        //     $purchase_item->product_id = $item['product_id'];
        //     $purchase_item->product_cost = $item['product_cost'];
        //     $purchase_item->save();
        // }

        //second way
        $items_dataset = [];
        foreach($items as $item)
        {
            $items_dataset[] = [
                'issuance_id'=>$issuance->issuance_id,
                'product_id'=>$item['product_id'],
                'product_cost'=>$item['product_cost'],
                'product_quantity'=>$item['product_quantity'],
                'total_cost'=>$item['total_cost'],
            ];
        }

        DB::table('inv_issuance_details')->insert($items_dataset);

        //return json based from the resource data
        $data = IssuanceMain::select(
            'inv_issuance_main.*',
            'rd.department_name'
        )
            ->leftJoin('refdepartment as rd', 'rd.department_id', '=', 'inv_issuance_main.department_id')
            ->findOrFail($issuance->issuance_id);

        return ( new Reference( $data ) )
            ->response()
            ->setStatusCode(200);
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
        $data['issuance'] = IssuanceMain::select(
                            'inv_issuance_main.*',
                            'rd.department_name'
        )
                            ->leftJoin('refdepartment as rd', 'rd.department_id', '=', 'inv_issuance_main.department_id')
                            ->findOrFail($id);
        
        $data['issuance_items'] = IssuanceDetails::select(
                                'inv_issuance_details.*',
                                'rp.product_code',
                                'rp.product_name',
                                'ru.unit_name'
        )
                                ->leftJoin('refproduct as rp', 'rp.product_id', '=', 'inv_issuance_details.product_id')
                                ->leftJoin('refunit as ru', 'ru.unit_id', 'rp.unit_id')
                                ->where('rp.is_deleted', 0)
                                ->where('issuance_id', $id)
                                ->get();
        
        return $data;
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
        Validator::make($request->all(),
            [
                'department_id' => 'required',
                'issuance_datetime' => 'required',
            ]
        )->validate();

        
        $issuance = IssuanceMain::findOrFail($id);
        $issuance->department_id = $request->input('department_id');
        $issuance->location = $request->input('location');
        $issuance->issued_to = $request->input('issued_to');
        $issuance->issuance_datetime = date('Y-m-d H:i:s', strtotime($request->input('issuance_datetime')));
        $issuance->issuance_remarks = $request->input('issuance_remarks');
        $issuance->total_amount = $request->input('total_amount');
        $issuance->modified_datetime = Carbon::now();
        $issuance->modified_by = Auth::user()->user_id;
    
        $issuance->save();
        
        $items = $request->input('items');
        $old_items = IssuanceDetails::where('issuance_id', $issuance->issuance_id);
        $old_items->delete();

        $items_dataset = [];
        foreach($items as $item)
        {
            $items_dataset[] = [
                'issuance_id'=>$issuance->issuance_id,
                'product_id'=>$item['product_id'],
                'product_cost'=>$item['product_cost'],
                'product_quantity'=>$item['product_quantity'],
                'total_cost'=>$item['total_cost'],
            ];
        }

        DB::table('inv_issuance_details')->insert($items_dataset);

        //return json based from the resource data
        $issuance = IssuanceMain::select(
            'inv_issuance_main.*',
            'rd.department_name'
        )
            ->leftJoin('refdepartment as rd', 'rd.department_id', '=', 'inv_issuance_main.department_id')
            ->findOrFail($id);

        return ( new Reference( $issuance ) )
            ->response()
            ->setStatusCode(200);
    }

    /* Update the specified resource in storage for deleting.
     * preventing force delete rather update the is_deleted = true
     * 
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {   
        $issuance = IssuanceMain::findOrFail($id);

        $issuance->is_deleted = 1;
        $issuance->deleted_datetime = Carbon::now();
        $issuance->deleted_by = Auth::user()->user_id;

        //update classification based on the http json body that is sent
        $issuance->save();

        return ( new Reference( $issuance ) )
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
