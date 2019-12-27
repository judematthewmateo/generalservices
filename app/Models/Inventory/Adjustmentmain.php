<?php

namespace App\Models\Inventory;

use Illuminate\Database\Eloquent\Model;

class Adjustmentmain extends Model
{
    protected $table = 'inv_adjustment_main';
    protected $primaryKey = 'adjustment_id';
    public $timestamps = false;
}
