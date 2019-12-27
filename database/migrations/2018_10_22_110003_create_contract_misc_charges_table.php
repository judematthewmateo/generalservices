<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateContractMiscChargesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('b_contract_misc_charges', function (Blueprint $table) {
            $table->increments('contract_misc_id');
            $table->integer('contract_id')->default(0)->nullable(true);
            $table->integer('charge_id')->default(0)->nullable(true);
            $table->decimal('contract_misc_rate', 15, 5)->default(0)->nullable(true);
            $table->decimal('contract_misc_default_reading', 15, 5)->default(0)->nullable(true);
            $table->boolean('contract_misc_is_vatted')->default(0);
            $table->string('contract_misc_notes')->default('')->nullable(true);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
