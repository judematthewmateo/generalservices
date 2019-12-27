<?php

namespace App\Models\Utilities;

use Illuminate\Database\Eloquent\Model;

class ModuleList extends Model
{
    protected $table = 'b_module_list';
    protected $primaryKey = 'module_id';
    public $timestamps = false;
}
