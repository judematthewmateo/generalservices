<?php

namespace App\Models\Utilities;

use Illuminate\Database\Eloquent\Model;

class CompanySettings extends Model
{
    protected $table = 'b_company_settings';
    protected $primaryKey = 'company_id';
    public $timestamps = false;
}
