<?php

namespace App\Models\Inventory;

use Illuminate\Database\Eloquent\Model;

class IssuanceMain extends Model
{
    protected $table = 'inv_issuance_main';
    protected $primaryKey = 'issuance_id';
    public $timestamps = false;
}
