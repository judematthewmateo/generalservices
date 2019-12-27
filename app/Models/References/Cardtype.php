<?php

namespace App\Models\References;

use Illuminate\Database\Eloquent\Model;

class Cardtype extends Model
{
    protected $table = 'refcardtype';
    protected $primaryKey = 'card_type_id';
    public $timestamps = false;
}
