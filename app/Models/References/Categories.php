<?php

namespace App\Models\References;

use Illuminate\Database\Eloquent\Model;

class Categories extends Model
{
    protected $table = 'refcategory';
    protected $primaryKey = 'category_id';
    public $timestamps = false;
}
