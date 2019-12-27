<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateContractUtilChargesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('b_contract_util_charges', function (Blueprint $table) {
            $table->increments('contract_util_id');
            $table->integer('contract_id')->default(0)->nullable(true);
            $table->integer('charge_id')->default(0)->nullable(true);
            $table->decimal('contract_util_rate', 15, 5)->default(0)->nullable(true);
            $table->decimal('contract_util_default_reading', 15, 5)->default(0)->nullable(true);
            $table->boolean('contract_util_is_vatted')->default(0);
            $table->string('contract_util_notes')->default('')->nullable(true);
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
