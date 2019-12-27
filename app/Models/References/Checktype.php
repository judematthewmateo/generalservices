<?php

namespace App\Models\References;

use Illuminate\Database\Eloquent\Model;

class Checktype extends Model
{
    protected $table = 'refchecktype';
    protected $primaryKey = 'check_type_id';
    public $timestamps = false;
}
