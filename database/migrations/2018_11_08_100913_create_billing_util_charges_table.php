<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBillingUtilChargesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('b_billing_util_charges', function (Blueprint $table) {
            $table->increments('billing_util_id');
            $table->integer('billing_id')->default(0)->nullable(true);
            $table->integer('charge_id')->default(0)->nullable(true);
            $table->integer('billing_util_rate')->default(0)->nullable(true);
            $table->decimal('billing_util_reading', 15, 5)->default(0)->nullable(true);
            $table->decimal('billing_util_line_total', 15, 5)->default(0)->nullable(true);
            $table->boolean('billing_util_is_vatted')->default(0);
            $table->string('billing_util_notes')->default('')->nullable(true);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('billing_util_charges');
    }
}
