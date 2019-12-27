<?php

namespace App\Models\Utilities;

use Illuminate\Database\Eloquent\Model;

class UserGroups extends Model
{
    protected $table = 'b_user_groups';
    protected $primaryKey = 'user_group_id';
    public $timestamps = false;
}
