<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePaymentInfoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('b_payment_info', function (Blueprint $table) {
            $table->increments('payment_id');
            $table->string('transaction_no', 45)->default('');
            $table->string('reference_no', 145)->default('');
            $table->integer('tenant_id')->default(0);
            $table->integer('payment_type')->default(0);
            $table->decimal('amount_paid', 15, 5)->default('0.00000');
            $table->datetime('payment_date')->nullable(true);
            $table->integer('check_type_id')->default(0);
            $table->string('check_no')->default('');
            $table->datetime('check_date')->nullable(true);
            $table->decimal('balance_paid', 15, 5)->default('0.00000');
            $table->decimal('advance', 15, 5)->default('0.00000');
            $table->decimal('discount', 15, 5)->default('0.00000');
            $table->string('remarks', 1000)->default('');
            $table->datetime('created_datetime')->nullable(true);
            $table->integer('created_by')->default(0)->nullable(true);
            $table->datetime('canceled_datetime')->nullable(true);
            $table->integer('canceled_by')->default(0)->nullable(true);
            $table->boolean('is_canceled')->default(0);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('payment_info');
    }
}
