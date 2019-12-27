<?php

namespace App\Models\POS;

use Illuminate\Database\Eloquent\Model;

class POS extends Model
{
    protected $table = 'pos_invoice_main';
    protected $primaryKey = 'invoice_id';
    public $timestamps = false;
}
