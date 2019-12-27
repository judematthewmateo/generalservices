<?php

namespace App\Models\References;

use Illuminate\Database\Eloquent\Model;

class Discounttype extends Model
{
    protected $table = 'refdiscounttype';
    protected $primaryKey = 'discount_type_id';
    public $timestamps = false;
}
