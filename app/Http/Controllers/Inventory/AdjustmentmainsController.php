<?php

namespace App\Http\Controllers\Inventory;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\References\Product;
use App\Models\References\Department;
use App\Models\References\Unit;
use App\Models\Inventory\Adjustmentmain;
use App\Models\Inventory\Adjustmentlist;
use App\Http\Resources\Reference;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;
use Auth;
use DB;

class AdjustmentmainsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data['adjustmentmains'] = Adjustmentmain::select(
            'inv_adjustment_main.*',
            'rd.department_name'
            
            )
                    ->leftJoin('refdepartment as rd', 'rd.department_id', '=', 'inv_adjustment_main.department_id')
                    ->where('inv_adjustment_main.is_deleted', 0)
                    ->orderBy('adjustment_id', 'desc')
                    ->get();

        $data['products'] = Product::leftJoin('refunit', 'refunit.unit_id', 'refproduct.unit_id')
                    ->leftJoin('refcategory', 'refcategory.category_id', 'refproduct.category_id')
                    ->where('refproduct.is_deleted', 0)
                    ->orderBy('refproduct.product_id')
                    ->get();

        $data['departments'] = Department::where('is_deleted', 0)->orderBy('department_id')->get();
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
            'adjustment_datetime' => 'required',
         // 'adjustment_type' => 'required'
            
           
        ]
    )->validate();

    $adjustmentmain = new Adjustmentmain();
    $adjustmentmain->adjustment_no = DB::raw('CreateAdjustmentNo()');
    $adjustmentmain->department_id = $request->input('department_id');
    $adjustmentmain->adjustment_type = $request->input('adjustment_type');
    $adjustmentmain->adjustment_datetime = date('Y-m-d H:i:s', strtotime($request->input('adjustment_datetime')));
    $adjustmentmain->total_amount = $request->input('total_amount');
    $adjustmentmain->created_datetime = Carbon::now();
    $adjustmentmain->created_by = Auth::user()->user_id;
 
    $adjustmentmain->save();
    
    $items = $request->input('items');
    
    // // //first way
    // foreach($items as $item)
    // {
    //     $purchase_item = new PurchaseOrderItems;
    //     $purchase_item->adjustment_id = $purchase->adjustment_id;
    //     $purchase_item->product_id = $item['product_id'];
    //     $purchase_item->product_cost = $item['product_cost'];
    //     $purchase_item->save();
    // }

    //second way
    $items_dataset = [];
    foreach($items as $item)
    {
        $items_dataset[] = [
            'adjustment_id'=>$adjustmentmain->adjustment_id,
            'product_id'=>$item['product_id'],
            'product_cost'=>$item['product_cost'],
            'product_quantity'=>$item['product_quantity'],
            'product_remarks'=>$item['product_remarks'],
            'total_cost'=>$item['total_cost'],

        ];
    }

    DB::table('inv_adjustment_details')->insert($items_dataset);

    //return json based from the resource data
    $data = Adjustmentmain::select(
        'inv_adjustment_main.*',
        'rd.department_name'
        
    )
        ->leftJoin('refdepartment as rd', 'rd.department_id', '=', 'inv_adjustment_main.department_id')
        ->findOrFail($adjustmentmain->adjustment_id);

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
            $data['adjustmentmain'] = Adjustmentmain::select(
                                                'inv_adjustment_main.*',
                                                'rd.department_name'
                                                
            )
                                                ->leftJoin('refdepartment as rd', 'rd.department_id', '=', 'inv_adjustment_main.department_id')
                                                ->findOrFail($id);

            $data['po_items'] = Adjustmentlist::select(
                                                'inv_adjustment_details.*',
                                                'rp.product_code',
                                                'rp.product_name',
                                                'ru.unit_id',
                                                'ru.unit_name'
            )
                                                ->leftJoin('refproduct as rp', 'rp.product_id', '=', 'inv_adjustment_details.product_id')
                                                ->leftJoin('refunit as ru', 'ru.unit_id', 'rp.unit_id')
                                                ->where('rp.is_deleted', 0)
                                                ->where('adjustment_id', $id)
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
        $adjustmentmain = Adjustmentmain::findOrFail($id);
        Validator::make($request->all(),
        [
               
            'department_id' => 'required',
            'adjustment_datetime' => 'required',
            'adjustment_type' => 'required'
            ]
        )->validate();        
        
        $adjustmentmain = Adjustmentmain::findOrFail($id);
        $adjustmentmain->department_id = $request->input('department_id');
        $adjustmentmain->adjustment_type = $request->input('adjustment_type');
        $adjustmentmain->adjustment_datetime = date('Y-m-d H:i:s', strtotime($request->input('adjustment_datetime')));
        $adjustmentmain->total_amount = $request->input('total_amount');
        $adjustmentmain->modified_datetime = Carbon::now();
        $adjustmentmain->modified_by = Auth::user()->user_id;


        //update  based on the http json body that is sent
        $adjustmentmain->save();

        $items = $request->input('items');
        $old_items = Adjustmentlist::where('adjustment_id', $adjustmentmain->adjustment_id);
        $old_items->delete();

        $items_dataset = [];
        foreach($items as $item)
        {
            $items_dataset[] = [
                'adjustment_id'=>$adjustmentmain->adjustment_id,
                'product_id'=>$item['product_id'],
                'product_cost'=>$item['product_cost'],
                'product_quantity'=>$item['product_quantity'],
                'product_remarks'=>$item['product_remarks'],
                'total_cost'=>$item['total_cost']
    
            ];
        }
    
        DB::table('inv_adjustment_details')->insert($items_dataset);
    
        //return json based from the resource data
        $adjustmentmain = Adjustmentmain::select(
            'inv_adjustment_main.*',
            'rd.department_name'
        )
            ->leftJoin('refdepartment as rd', 'rd.department_id', '=', 'inv_adjustment_main.department_id')
            ->findOrFail($id);

        return ( new Reference( $adjustmentmain ) )
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
        $adjustmentmain = Adjustmentmain::findOrFail($id);

        $adjustmentmain->is_deleted = 1;
        $adjustmentmain->deleted_datetime = Carbon::now();
        $adjustmentmain->deleted_by = Auth::user()->user_id;

        //update classification based on the http json body that is sent
        $adjustmentmain->save();

        return ( new Reference( $adjustmentmain ) )
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
