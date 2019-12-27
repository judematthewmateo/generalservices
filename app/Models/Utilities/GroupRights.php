<?php

namespace App\Models\Utilities;

use Illuminate\Database\Eloquent\Model;

class GroupRights extends Model
{
    protected $table = 'b_group_rights';
    protected $primaryKey = 'group_right_id';
    public $timestamps = false;
}
