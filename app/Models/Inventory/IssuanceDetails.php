<?php

namespace App\Models\Inventory;

use Illuminate\Database\Eloquent\Model;

class IssuanceDetails extends Model
{
    protected $table = 'inv_issuance_details';
    protected $primaryKey = 'issuance_detail_id';
    public $timestamps = false;
}
