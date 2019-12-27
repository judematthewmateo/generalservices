<?php

namespace App\Models\References;

use Illuminate\Database\Eloquent\Model;

class Inventorytype extends Model
{
    protected $table = 'refinventorytype';
    protected $primaryKey = 'inventory_type_id';
    public $timestamps = false;
}
