<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBillingMiscChargesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('b_billing_misc_charges', function (Blueprint $table) {
            $table->increments('billing_misc_id');
            $table->integer('billing_id')->default(0)->nullable(true);
            $table->integer('charge_id')->default(0)->nullable(true);
            $table->integer('billing_misc_rate')->default(0)->nullable(true);
            $table->decimal('billing_misc_reading', 15, 5)->default(0)->nullable(true);
            $table->decimal('billing_misc_line_total', 15, 5)->default(0)->nullable(true);
            $table->boolean('billing_misc_is_vatted')->default(0);
            $table->string('billing_misc_notes')->default('')->nullable(true);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('billing_misc_charges');
    }
}
