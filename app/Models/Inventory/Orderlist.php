<?php

namespace App\Models\Inventory;

use Illuminate\Database\Eloquent\Model;

class Orderlist extends Model
{
    protected $table = 'inv_purchase_order_details';
    protected $primaryKey = 'purchase_order_id';
    public $timestamps = false;
}
