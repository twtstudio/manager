<?php

// Composer: "fzaninotto/faker": "v1.3.0"
// use Faker\Factory as Faker;

class UsersTableSeeder extends Seeder {

	public function run()
	{
		DB::table('users')->delete();

		$users = array(
			array(
				'username' => 'yudong',
				'password' => Hash::make('yudong'),
				'role' => 1,
				'created_at' => new DateTime,
				'updated_at' => new DateTime
			)
		);

		DB::table('users')->insert($users);
	}

}
