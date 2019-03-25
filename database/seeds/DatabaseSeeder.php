<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder {
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run() {
        $this->call(CountriesSeeder::class);
        $this->call(CastsTableSeeder::class);
        $this->call(MoviesSeeder::class);
        DB::table('users')->insert([
            'name' => 'admin',
            'email' => 'admin@admin.com',
            'password' => bcrypt('password'),
            'user_type' => 'ADMIN'
        ]);
        DB::table('ratings')->insert(
            [
                'user_id' => 1,
                'movie_id' => 1,
                'rating_value' => 5
            ]
        );
    }
}
