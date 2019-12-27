<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRefdepartmentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('b_refdepartments', function (Blueprint $table) {
            $table->increments('department_id');
            $table->string('department_code')->default('');
            $table->string('department_desc')->default('');
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
        Schema::dropIfExists('refcharges');
    }
}
