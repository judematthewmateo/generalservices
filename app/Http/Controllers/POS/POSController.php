<?php

namespace App\Http\Controllers\POS;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\References\Product;
use App\Models\References\Unit;
use App\Models\References\Menu;
use App\Models\POS\POS;
use App\Models\References\Cardtype;

class POSController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $data['pos'] = POS::select(
            'pos_invoice_main.*'
        )


            ->orderBy('invoice_no', 'desc')
            ->get();


        $data['products'] = Product::leftJoin('refunit', 'refunit.unit_id', 'refproduct.unit_id')
            ->where('refproduct.is_deleted', 0)
            ->orderBy('refproduct.product_id')
            ->get();

        // $data['departments'] = Department::where('is_deleted', 0)->orderBy('department_id')->get();
        // $data['suppliers'] = Supplier::where('is_deleted', 0)->orderBy('supplier_id')->get();
        $data['units'] = Unit::where('is_deleted', 0)->orderBy('unit_id')->get();
        $data['cardtypes'] = Cardtype::where('is_deleted', 0)->orderBy('card_type_id')->get();
        return $data;
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
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
        //
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
        //
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

    public function GetMenu($offset)
    {
        $skip = ($offset - 1) * 7;
        $menu = Menu::where('is_deleted', 0)->skip($skip)->take(7)->get();
        return $menu;
    }

    public function GetProduct($menu_id)
    {
        $product = Product::leftJoin('refunit', 'refunit.unit_id', 'refproduct.unit_id')
                        ->where('refproduct.is_deleted', 0)
                        ->where('menu_id', $menu_id)->take(25)->get();
        return $product;
    }
}