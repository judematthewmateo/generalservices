<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTenantsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('b_tenants', function (Blueprint $table) {
            $table->increments('tenant_id');
            $table->string('tenant_code')->default('')->unique();
            $table->string('trade_name', 150)->default('');
            $table->string('company_name', 150)->default('');
            $table->string('space_code', 150)->default('');
            $table->string('business_concept', 150)->default('');
            $table->string('head_office_address', 255)->default('');
            $table->string('billing_address', 255)->default('');
            $table->string('contact_person', 120)->default('');
            $table->string('designation', 120)->default('');
            $table->string('contact_number', 60)->default('');
            $table->string('email_address', 100)->default('');
            $table->string('tin_number', 60)->default('');
            $table->boolean('is_auto')->default(0);
            $table->boolean('business_permit')->default(0);
            $table->boolean('tenant_information_sheet')->default(0);
            $table->boolean('valid_id')->default(0);
            $table->boolean('tin_cor')->default(0);
            $table->boolean('dti_sec')->default(0);
            $table->boolean('notarized_contract')->default(0);
            $table->boolean('proof_of_billing')->default(0);
            $table->boolean('others')->default(0);
            $table->string('others_specify', 255)->default('')->nullable(true);;
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
        Schema::dropIfExists('tenant');
    }
}
