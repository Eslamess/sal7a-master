<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOffersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('offers', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name');
            $table->text('text');

            $table->string('coupon')->nullable();

            $table->string('discount')->nullable();
            $table->enum('type', ['percentage', 'amount'])->nullable()->default('amount');

            $table->date('start_date');
            $table->date('end_date');

            $table->enum('status', ['active', 'deactivated'])->default('active');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('offers');
    }
}
