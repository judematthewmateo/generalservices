<?php

namespace App\Models\References;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table = 'refproduct';
    protected $primaryKey = 'product_id';
    public $timestamps = false;
}
