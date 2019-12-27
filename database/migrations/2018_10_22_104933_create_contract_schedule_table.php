<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateContractScheduleTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('b_contract_schedule', function (Blueprint $table) {
            $table->increments('contract_schedule_id');
            $table->integer('contract_id')->default(0)->nullable(true);
            $table->integer('month_id')->default(0)->nullable(true);
            $table->integer('app_year')->default(0)->nullable(true);
            $table->decimal('fixed_rent', 15, 5)->default(0)->nullable(true);
            $table->decimal('escalation_percent', 15, 5)->default(0)->nullable(true);
            $table->decimal('amount_due', 15, 5)->default(0)->nullable(true);
            $table->boolean('is_vatted')->default(0);
            $table->string('contract_schedule_notes')->default('')->nullable(true);
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
