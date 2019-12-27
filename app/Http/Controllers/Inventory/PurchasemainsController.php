<?php

namespace App\Http\Controllers\Inventory;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\References\Product;
use App\Models\References\Department;
use App\Models\References\Supplier;
use App\Models\References\Unit;
use App\Models\Inventory\Purchasemain;
use App\Models\Inventory\Orderlist;
use App\Http\Resources\Reference;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;
use Auth;
use DB;

class PurchasemainsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data['purchasemains'] = Purchasemain::select(
            'inv_purchase_order_main.*',
            'rd.department_name',
            'rs.supplier_name'
)
                    ->leftJoin('refdepartment as rd', 'rd.department_id', '=', 'inv_purchase_order_main.department_id')
                    ->leftJoin('refsupplier as rs', 'rs.supplier_id', '=', 'inv_purchase_order_main.supplier_id')
                    ->where('inv_purchase_order_main.is_deleted', 0)
                    ->orderBy('purchase_order_id', 'desc')
                    ->get();

        $data['products'] = Product::leftJoin('refunit', 'refunit.unit_id', 'refproduct.unit_id')
                    ->leftJoin('refcategory', 'refcategory.category_id', 'refproduct.category_id')
                    ->leftJoin('refsupplier', 'refsupplier.supplier_id', 'refproduct.supplier_id')
                    ->where('refproduct.is_deleted', 0)
                    ->orderBy('refproduct.product_id')
                    ->get();

        $data['departments'] = Department::where('is_deleted', 0)->orderBy('department_id')->get();
        $data['suppliers'] = Supplier::where('is_deleted', 0)->orderBy('supplier_id')->get();
        $data['units'] = Unit::where('is_deleted', 0)->orderBy('unit_id')->get();
        
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
            'supplier_id' => 'required',
            'purchase_order_datetime' => 'required',
            
           
        ]
    )->validate();

    $purchasemain = new Purchasemain();
    $purchasemain->purchase_order_no = DB::raw('CreatePurchaseOrderNo()');
    $purchasemain->department_id = $request->input('department_id');
    $purchasemain->supplier_id = $request->input('supplier_id');
    $purchasemain->purchase_order_datetime = date('Y-m-d H:i:s', strtotime($request->input('purchase_order_datetime')));
    $purchasemain->is_received = $request->input('is_received');
    $purchasemain->purchase_order_remarks = $request->input('purchase_order_remarks');
    $purchasemain->total_amount = $request->input('total_amount');
    $purchasemain->created_datetime = Carbon::now();
    $purchasemain->created_by = Auth::user()->user_id;
 
    $purchasemain->save();
    
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
            'purchase_order_id'=>$purchasemain->purchase_order_id,
            'product_id'=>$item['product_id'],
            'product_cost'=>$item['product_cost'],
            'product_quantity'=>$item['product_quantity'],
            'total_cost'=>$item['total_cost'],

        ];
    }

    DB::table('inv_purchase_order_details')->insert($items_dataset);

    //return json based from the resource data
    $data = Purchasemain::select(
        'inv_purchase_order_main.*',
        'rd.department_name',
        'rs.supplier_name'
    )
        ->leftJoin('refdepartment as rd', 'rd.department_id', '=', 'inv_purchase_order_main.department_id')
        ->leftJoin('refsupplier as rs', 'rs.supplier_id', '=', 'inv_purchase_order_main.supplier_id')
        ->findOrFail($purchasemain->purchase_order_id);

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
            $data['purchasemain'] = Purchasemain::select(
                                                'inv_purchase_order_main.*',
                                                'rd.department_name',
                                                'rs.supplier_name'
            )
                                                ->leftJoin('refdepartment as rd', 'rd.department_id', '=', 'inv_purchase_order_main.department_id')
                                                ->leftJoin('refsupplier as rs', 'rs.supplier_id', '=', 'inv_purchase_order_main.supplier_id')
                                                ->findOrFail($id);

            $data['po_items'] = Orderlist::select(
                                                'inv_purchase_order_details.*',
                                                'rp.product_code',
                                                'rp.product_name',
                                                'ru.unit_id',
                                                'ru.unit_name'
            )
                                                ->leftJoin('refproduct as rp', 'rp.product_id', '=', 'inv_purchase_order_details.product_id')
                                                ->leftJoin('refunit as ru', 'ru.unit_id', 'rp.unit_id')
                                                ->where('rp.is_deleted', 0)
                                                ->where('purchase_order_id', $id)
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
        $purchasemain = Purchasemain::findOrFail($id);
        Validator::make($request->all(),
        [
               
            'department_id' => 'required',
            'supplier_id' => 'required',
            'purchase_order_datetime' => 'required',
            ]
        )->validate();        
        
        $purchasemain = Purchasemain::findOrFail($id);
        $purchasemain->purchase_order_datetime = date('Y-m-d H:i:s', strtotime($request->input('purchase_order_datetime')));
        $purchasemain->department_id = $request->input('department_id');
        $purchasemain->supplier_id = $request->input('supplier_id');
        $purchasemain->contact_person = $request->input('contact_person');
        $purchasemain->contact_num = $request->input('contact_num');
        $purchasemain->total_amount = $request->input('total_amount');
        $purchasemain->email_address = $request->input('email_address');
        $purchasemain->deliver_to = $request->input('deliver_to');
        $purchasemain->requested_by = $request->input('requested_by');
        $purchasemain->modified_datetime = Carbon::now();
        $purchasemain->modified_by = Auth::user()->user_id;


        //update  based on the http json body that is sent
        $purchasemain->save();

        $items = $request->input('items');
        $old_items = Orderlist::where('purchase_order_id', $purchasemain->purchase_order_id);
        $old_items->delete();

        $items_dataset = [];
        foreach($items as $item)
        {
            $items_dataset[] = [
                'purchase_order_id'=>$purchasemain->purchase_order_id,
                'product_id'=>$item['product_id'],
                'unit_id'=>$item['unit_id'],
                'product_cost'=>$item['product_cost'],
                'product_quantity'=>$item['product_quantity'],
                'total_cost'=>$item['total_cost']
    
            ];
        }
    
        DB::table('inv_purchase_order_details')->insert($items_dataset);
    
        //return json based from the resource data
        $purchasemain = Purchasemain::select(
            'inv_purchase_order_main.*',
            'rd.department_name',
            'rs.supplier_name'
        )
            ->leftJoin('refdepartment as rd', 'rd.department_id', '=', 'inv_purchase_order_main.department_id')
            ->leftJoin('refsupplier as rs', 'rs.supplier_id', '=', 'inv_purchase_order_main.supplier_id')
            
            ->findOrFail($id);

        return ( new Reference( $purchasemain ) )
            ->response()
            ->setStatusCode(200);
    }

    /**
     * Update the specified resource in storage for deleting.
     * preventing force delete rather update the is_deleted = true
     * 
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {   
        $purchasemain = Purchasemain::findOrFail($id);

        $purchasemain->is_deleted = 1;
        $purchasemain->deleted_datetime = Carbon::now();
        $purchasemain->deleted_by = Auth::user()->user_id;

        //update classification based on the http json body that is sent
        $purchasemain->save();

        return ( new Reference( $purchasemain ) )
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
