<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRefnatureofbusinessTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('b_refnatureofbusiness', function (Blueprint $table) {
            $table->increments('nature_of_business_id');
            $table->string('nature_of_business_code')->default('');
            $table->string('nature_of_business_desc')->default('');
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
        Schema::dropIfExists('refnatureofbusiness');
    }
}
