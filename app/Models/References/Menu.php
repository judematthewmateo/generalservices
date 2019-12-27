<?php

namespace App\Models\References;

use Illuminate\Database\Eloquent\Model;

class Menu extends Model
{
    protected $table = 'refmenu';
    protected $primaryKey = 'menu_id';
    public $timestamps = false;
}
