<?php

namespace App\Models\Utilities;

use Illuminate\Database\Eloquent\Model;

class SoaNotes extends Model
{
    protected $table = 'b_soa_notes';
    protected $primaryKey = 'note_id';
    public $timestamps = false;
}
