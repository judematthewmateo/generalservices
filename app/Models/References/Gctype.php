<?php

namespace App\Models\References;

use Illuminate\Database\Eloquent\Model;

class Gctype extends Model
{
    protected $table = 'refgctype';
    protected $primaryKey = 'gc_type_id';
    public $timestamps = false;
}
