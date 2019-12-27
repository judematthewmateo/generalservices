<?php

namespace App\Models\Utilities;

use Illuminate\Database\Eloquent\Model;

class ModuleRights extends Model
{
    protected $table = 'b_module_rights';
    protected $primaryKey = 'module_right_id';
    public $timestamps = false;
}
