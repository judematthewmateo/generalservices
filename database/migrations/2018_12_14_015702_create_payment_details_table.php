<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePaymentDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('b_payment_details', function (Blueprint $table) {
            $table->increments('payment_details_id');
            $table->integer('payment_id')->default(0);
            $table->integer('billing_id')->default(0);
            $table->decimal('amount_paid', 15, 5)->default('0.00000');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('payment_details');
    }
}
