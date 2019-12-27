<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBillingOthrChargesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('b_billing_othr_charges', function (Blueprint $table) {
            $table->increments('billing_othr_id');
            $table->integer('billing_id')->default(0)->nullable(true);
            $table->integer('charge_id')->default(0)->nullable(true);
            $table->integer('billing_othr_rate')->default(0)->nullable(true);
            $table->decimal('billing_othr_reading', 15, 5)->default(0)->nullable(true);
            $table->decimal('billing_othr_line_total', 15, 5)->default(0)->nullable(true);
            $table->boolean('billing_othr_is_vatted')->default(0);
            $table->string('billing_othr_notes')->default('')->nullable(true);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('billing_othr_charges');
    }
}
