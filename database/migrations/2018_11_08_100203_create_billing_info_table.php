<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBillingInfoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('b_billing_info', function (Blueprint $table) {
            $table->increments('billing_id');
            $table->string('billing_no')->default('')->unique();
            $table->integer('period_id')->default(0);
            $table->integer('tenant_id')->default(0);
            $table->integer('contract_id')->default(0);
            $table->integer('month_id')->default(0);
            $table->integer('app_year')->default(0);
            $table->datetime('due_date')->nullable(true);
            $table->decimal('total_fixed_rent', 15, 5)->default('0.00000');
            $table->decimal('total_util_charges', 15, 5)->default('0.00000');
            $table->decimal('total_misc_charges', 15, 5)->default('0.00000');
            $table->decimal('total_othr_charges', 15, 5)->default('0.00000');
            $table->decimal('sub_total', 15, 5)->default('0.00000');
            $table->decimal('vattable_amount', 15, 5)->default('0.00000');
            $table->decimal('discounted_vatable_amount', 15, 5)->default('0.00000');
            $table->decimal('vat_percent', 15, 5)->default('0.00000');
            $table->decimal('total_vat', 15, 5)->default('0.00000');
            $table->decimal('total_amount_due', 15, 5)->default('0.00000');
            $table->decimal('total_adjusted_in', 15, 5)->default('0.00000');
            $table->decimal('total_adjusted_out', 15, 5)->default('0.00000');
            $table->boolean('is_approved')->default(0);
            $table->decimal('wtax_amount', 15, 5)->default('0.00000');
            $table->decimal('wtax_percent', 15, 5)->default('0.00000');
            $table->datetime('created_datetime')->nullable(true);
            $table->integer('created_by')->nullable(true);
            $table->datetime('modified_datetime')->nullable(true);
            $table->integer('modified_by')->nullable(true);
            $table->datetime('deleted_datetime')->nullable(true);
            $table->integer('deleted_by')->nullable(true);
            $table->boolean('is_deleted')->default(0);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('billing_info');
    }
}
