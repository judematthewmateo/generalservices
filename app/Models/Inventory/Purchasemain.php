<?php

namespace App\Models\Inventory;

use Illuminate\Database\Eloquent\Model;

class Purchasemain extends Model
{
    protected $table = 'inv_purchase_order_main';
    protected $primaryKey = 'purchase_order_id';
    public $timestamps = false;
}
