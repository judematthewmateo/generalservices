<?php

namespace App\Models\References;

use Illuminate\Database\Eloquent\Model;

class Department extends Model
{
    protected $table = 'refdepartment';
    protected $primaryKey = 'department_id';
    public $timestamps = false;
}
