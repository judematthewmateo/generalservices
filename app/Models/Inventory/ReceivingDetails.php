<?php

namespace App\Models\Inventory;

use Illuminate\Database\Eloquent\Model;

class ReceivingDetails extends Model
{
    protected $table = 'inv_receiving_details';
    protected $primaryKey = 'receiving_id';
    public $timestamps = false;
}
