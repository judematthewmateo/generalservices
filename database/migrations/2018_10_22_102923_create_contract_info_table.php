<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateContractInfoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('b_contract_info', function (Blueprint $table) {
            $table->increments('contract_id');
            $table->string('contract_no')->default('')->unique();
            $table->integer('tenant_id')->default(0)->nullable(true);
            $table->string('contract_billing_address')->default('')->nullable(true);
            $table->integer('contract_type_id')->default(0)->nullable(true);
            $table->integer('category_id')->default(0)->nullable(true);
            $table->datetime('commencement_date')->nullable(true);
            $table->datetime('termination_date')->nullable(true);
            $table->datetime('start_billing_date')->nullable(true);
            $table->integer('location_id')->default(0)->nullable(true);
            $table->string('contract_signatory', 120)->default('')->nullable(true);
            $table->integer('contract_terms')->nullable(true);
            $table->string('contract_approved_merch')->default('')->nullable(true);
            $table->decimal('contract_fixed_rent', 15, 5)->nullable(true);
            $table->decimal('contract_discounted_rent', 15, 5)->nullable(true);
            $table->decimal('power_meter_deposit', 15, 5)->nullable(true);
            $table->decimal('security_deposit', 15, 5)->nullable(true);
            $table->decimal('contract_escalation_percent', 15, 5)->nullable(true);
            $table->decimal('contract_floor_area', 15, 5)->nullable(true);
            $table->integer('department_id')->default(0)->nullable(true);
            $table->integer('nature_of_business_id')->default(0)->nullable(true);
            $table->boolean('is_approved')->default(0);
            $table->boolean('is_closed')->default(0);
            $table->integer('approved_by')->default(0)->nullable(true);
            $table->datetime('created_datetime')->nullable(true);
            $table->integer('created_by')->default(0)->nullable(true);
            $table->datetime('modified_datetime')->nullable(true);
            $table->integer('modified_by')->default(0)->nullable(true);
            $table->datetime('deleted_datetime')->nullable(true);
            $table->integer('deleted_by')->default(0)->nullable(true);
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
        Schema::dropIfExists('contract_info');
    }
}
