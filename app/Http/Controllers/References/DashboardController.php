<?php

namespace App\Http\Controllers\References;

use Illuminate\Http\Request;
use App\Models\Transactions\PaymentInfo;
use App\Models\References\Tenants;
use App\Models\Transactions\ContractInfo;
use App\Http\Controllers\Controller;
use App\Http\Resources\Reference;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;
use Auth;
use DB;
use Session;

class DashboardController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($payment_type, Request $request)
    {   
        $tenants = Tenants::select(DB::raw('count(*) as no_of_tenants'))
                            ->where('is_deleted', 0)
                            ->get();

        $contracts = ContractInfo::select(DB::raw('count(*) as no_of_contracts'))
                            ->where('is_deleted', 0)
                            ->get();

        $from = Carbon::now();
        $to = Carbon::now()->addMonths(4);
        $expiring_contracts = ContractInfo::select(DB::raw('count(*) as no_of_expiring_contracts'))
                            ->where('is_deleted', 0)
                            ->whereBetween('termination_date', [$from, $to])
                            ->get();
        
        $dashboard['payment_line'] = $this->getPaymentLine($payment_type, true);
        $dashboard['tenants'] = Reference::collection($tenants);
        $dashboard['contracts'] = Reference::collection($contracts);
        $dashboard['expiring_contracts'] = Reference::collection($expiring_contracts);

        return $dashboard;
    }

    public function getPaymentLine($payment_type, $is_string = true)
    {
        $query = '';
        for($i=1; $i <= 12; $i++)
        {
            $query = $query."SELECT
                                IFNULL(SUM(amount_paid), 0) as amount
                            FROM b_payment_info 
                            WHERE MONTH(payment_date) = $i AND IF($payment_type = -1, 0=0, payment_type = $payment_type) AND is_canceled = 0";
            if($i != 12)
            {
                $query = $query." UNION ALL ";
            }
        }

        $payment_line = DB::select($query);
        return $payment_line;
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
}
