<?php

namespace App\Models\Inventory;

use Illuminate\Database\Eloquent\Model;

class Adjustmentlist extends Model
{
    protected $table = 'inv_adjustment_details';
    protected $primaryKey = 'adjustment_id';
    public $timestamps = false;
}
