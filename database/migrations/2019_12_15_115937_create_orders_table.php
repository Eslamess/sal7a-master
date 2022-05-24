<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->bigIncrements('id');

            $table->unsignedBigInteger('user_id');
            $table->foreign('user_id')
                ->references('id')
                ->on('users')
                ->onDelete('cascade')
                ->onUpdate('cascade');

            $table->unsignedBigInteger('agent_id');
            $table->foreign('agent_id')
                ->references('id')
                ->on('agents')
                ->onDelete('cascade')
                ->onUpdate('cascade');

            $table->unsignedBigInteger('city_id');
            $table->foreign('city_id')
                ->references('id')
                ->on('cities')
                ->onDelete('cascade')
                ->onUpdate('cascade');

            $table->unsignedBigInteger('category_id');
            $table->foreign('category_id')
                ->references('id')
                ->on('categories')
                ->onDelete('cascade')
                ->onUpdate('cascade');


            $table->unsignedBigInteger('offer_id')->nullable();
            $table->foreign('offer_id')
                ->references('id')
                ->on('offers')
                ->onDelete('set null')
                ->onUpdate('cascade');

            $table->text('address');

            $table->text('description');

            $table->text('agent_description')->nullable();

            $table->enum('payment_method', ['visa', 'cash'])->nullable();

            $table->string('latitude')->nullable();
            $table->string('longitude')->nullable();

            $table->enum('status', ['new', 'approved', 'rejected', 'cancelled', 'on_way', 'arrived', 'completed', 'rated'])->default('new');

            $table->double('cost')->default(0)->nullable();

            $table->double('visit_fees')->default(0);

            $table->double('discount')->default(0);

            $table->date('date');

            $table->time('time');

            $table->double('rate')->nullable();

            $table->text('cancel_reason')->nullable();

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
        Schema::dropIfExists('orders');
    }
}
