<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Offer;
use Faker\Generator as Faker;

$factory->define(Offer::class, function (Faker $faker) {
    $start_date = $faker->dateTimeBetween('2019-01-01', '2025-12-30');
    return [
        'name_ar' => $faker->text('20'),
        'name_en' => $faker->text('20'),
        'text_en' => $faker->text('300'),
        'text_ar' => $faker->text('300'),
        'coupon' => $faker->randomNumber(5),
        'discount' => $faker->numberBetween(0, 100),
        'type' => $faker->randomElement(['percentage', 'amount']),
        'start_date' => $start_date,
        'end_date' => $faker->dateTimeBetween($start_date, '2025-12-30'),
        'status' => $faker->randomElement(['active', 'deactivated']),
    ];
});
