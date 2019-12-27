<?php

namespace App\Models\References;

use Illuminate\Database\Eloquent\Model;

class Unit extends Model
{
    protected $table = 'refunit';
    protected $primaryKey = 'unit_id';
    public $timestamps = false;
}
