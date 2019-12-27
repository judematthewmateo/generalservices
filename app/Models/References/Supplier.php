<?php

namespace App\Models\References;

use Illuminate\Database\Eloquent\Model;

class Supplier extends Model
{
    protected $table = 'refsupplier';
    protected $primaryKey = 'supplier_id';
    public $timestamps = false;
}
