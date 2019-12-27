<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBillingScheduleTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('b_billing_schedule', function (Blueprint $table) {
            $table->increments('billing_schedule_id');
            $table->integer('billing_id')->default(0)->nullable(true);
            $table->integer('month_id')->default(0)->nullable(true);
            $table->integer('app_year')->default(0)->nullable(true);
            $table->decimal('line_total', 15, 5)->default(0)->nullable(true);
            $table->boolean('is_vatted')->default(0);
            $table->string('billing_schedule_notes')->default('')->nullable(true);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('billing_schedule');
    }
}
