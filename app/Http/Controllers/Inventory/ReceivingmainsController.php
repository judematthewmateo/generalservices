<?php

namespace App\Http\Controllers\Inventory;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\References\Product;
use App\Models\References\Department;
use App\Models\References\Supplier;
use App\Models\Inventory\Receivingmain; // model of table
use App\Models\Inventory\ReceivingDetails;
use App\Models\Inventory\Purchasemain;
use App\Models\Inventory\Orderlist;
use App\Http\Resources\Reference; //required always for json encoding
use Carbon\Carbon; //data
use Illuminate\Support\Facades\Validator; //validation
use Auth;
use DB;


class ReceivingmainsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data['receivingmains'] = Receivingmain::select(
            'inv_receiving_main.*',
            'rd.department_name',
            'rs.supplier_name'
)
                    ->leftJoin('refdepartment as rd', 'rd.department_id', '=', 'inv_receiving_main.department_id')
                    ->leftJoin('refsupplier as rs', 'rs.supplier_id', '=', 'inv_receiving_main.supplier_id')
                    ->where('inv_receiving_main.is_deleted', 0)
                    ->orderBy('receiving_id', 'desc')
                    ->get();

        $data['products'] = Product::leftJoin('refunit', 'refunit.unit_id', 'refproduct.unit_id')
                    ->leftJoin('refcategory', 'refcategory.category_id', 'refproduct.category_id')
                    ->leftJoin('refsupplier', 'refsupplier.supplier_id', 'refproduct.supplier_id')
                    ->where('refproduct.is_deleted', 0)
                    ->orderBy('refproduct.product_id')
                    ->get();


        $data['purchasemains'] = Purchasemain::where('is_deleted', 0)->orderBy('purchase_order_id')->get();
        $data['departments'] = Department::where('is_deleted', 0)->orderBy('department_id')->get();
        $data['suppliers'] = Supplier::where('is_deleted', 0)->orderBy('supplier_id')->get();
        $data['orderlists'] = Purchasemain::where('is_deleted', 0) -> where ('is_received', 0)->get();

       

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
            'receiving_datetime' => 'required',
            'receiving_no'=> 'required'
              
        ]
    )->validate();

    $receivingmain = new Receivingmain();
    // $receivingmain->receiving_no = ::raw('receiving_no');
    // $receivingmain->purchase_order_no = DB::raw('purchase_order_no');
    $receivingmain->receiving_no = $request->input('receiving_no');
    $receivingmain->purchase_order_no = $request->input('purchase_order_id');
    $receivingmain->department_id = $request->input('department_id');
    $receivingmain->supplier_id = $request->input('supplier_id');
    $receivingmain->receiving_datetime = date('Y-m-d H:i:s', strtotime($request->input('receiving_datetime')));
    $receivingmain->total_amount = $request->input('total_amount');
    $receivingmain->created_datetime = Carbon::now();
    $receivingmain->created_by = Auth::user()->user_id;
    
 
    $receivingmain->save();
    
    $items = $request->input('items');
    


    //second way
    $items_dataset = [];
    foreach($items as $item)
    {
        $items_dataset[] = [
            'receiving_id'=>$receivingmain->receiving_id,
            'product_id'=>$item['product_id'],
            'product_cost'=>$item['product_cost'],
            'product_quantity'=>$item['product_quantity'],
            'total_cost'=>$item['total_cost'],

        ];
    }

    DB::table('inv_receiving_details')->insert($items_dataset);

    //return json based from the resource data
    $data = Receivingmain::select(
        'inv_receiving_main.*',
        'rd.department_name',
        'rs.supplier_name'
    )
        ->leftJoin('refdepartment as rd', 'rd.department_id', '=', 'inv_receiving_main.department_id')
        ->leftJoin('refsupplier as rs', 'rs.supplier_id', '=', 'inv_receiving_main.supplier_id')
        ->findOrFail($receivingmain->receiving_id);

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
            $data['receivingmain'] = Receivingmain::select(
                                                'inv_receiving_main.*',
                                                'rd.department_name'
            )
                                                ->leftJoin('refdepartment as rd', 'rd.department_id', '=', 'inv_receiving_main.department_id')
                                                ->findOrFail($id);

            $data['po_items'] = ReceivingDetails::select(
                                                'inv_receiving_details.*',
                                                'rp.product_code',
                                                'rp.product_name',
                                                'ru.unit_name'
            )
                                                ->leftJoin('refproduct as rp', 'rp.product_id', '=', 'inv_receiving_details.product_id')
                                                ->leftJoin('refunit as ru', 'ru.unit_id', 'rp.unit_id')
                                                ->where('rp.is_deleted', 0)
                                                ->where('receiving_id', $id)
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
        $receivingmain = Receivingmain::findOrFail($id);
        Validator::make($request->all(),
        [
               
            'department_id' => 'required',
            'supplier_id' => 'required',
            'receiving_datetime' => 'required',
            'receiving_no' => 'required'
            ]
        )->validate();        
        
        $receivingmain = Receivingmain::findOrFail($id);
        $receivingmain->receiving_no = $request->input('receiving_no');
        $receivingmain->department_id = $request->input('department_id');
        $receivingmain->supplier_id = $request->input('supplier_id');
        $receivingmain->receiving_datetime = date('Y-m-d H:i:s', strtotime($request->input('receiving_datetime')));
        $receivingmain->total_amount = $request->input('total_amount');
        $receivingmain->modified_datetime = Carbon::now();
        $receivingmain->modified_by = Auth::user()->user_id;


        //update  based on the http json body that is sent
        $receivingmain->save();

        $items = $request->input('items');
        $old_items = ReceivingDetails::where('receiving_id', $receivingmain->receiving_id);
        $old_items->delete();

        $items_dataset = [];
        foreach($items as $item)
        {
            $items_dataset[] = [
                'receiving_id'=>$receivingmain->receiving_id,
                'product_id'=>$item['product_id'],
                'product_cost'=>$item['product_cost'],
                'product_quantity'=>$item['product_quantity'],
                'total_cost'=>$item['total_cost']
    
            ];
        }
    
        DB::table('inv_receiving_details')->insert($items_dataset);
    
        //return json based from the resource data
        $receivingmain = Receivingmain::select(
            'inv_receiving_main.*',
            'rd.department_name',
            'rs.supplier_id'
        )
            ->leftJoin('refdepartment as rd', 'rd.department_id', '=', 'inv_receiving_main.department_id')
            ->leftJoin('refsupplier as rs', 'rs.supplier_id', '=', 'inv_receiving_main.supplier_id')

            ->findOrFail($id);

        return ( new Reference( $receivingmain ) )
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
        $receivingmain = Receivingmain::findOrFail($id);

        $receivingmain->is_deleted = 1;
        $receivingmain->deleted_datetime = Carbon::now();
        $receivingmain->deleted_by = Auth::user()->user_id;

        //update classification based on the http json body that is sent
        $receivingmain->save();

        return ( new Reference( $receivingmain ) )
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
    public function getPoItems($id)
    {
        $poitems = Orderlist::select(
            'inv_purchase_order_details.*',
            'rp.product_code',
            'rp.product_name',
            'ru.unit_name'
        )
                            ->leftJoin('refproduct as rp', 'rp.product_id', '=', 'inv_purchase_order_details.product_id')
                            ->leftJoin('refunit as ru', 'ru.unit_id', 'rp.unit_id')
                            ->where('purchase_order_id', $id)
                            ->get();

        
        return $poitems;
    }

}