<?php

// Composer: "fzaninotto/faker": "v1.3.0"
// use Faker\Factory as Faker;

class SidebarsTableSeeder extends Seeder {

	public function run()
	{

    DB::table('sidebars')->delete();

    $sidebars = array(
      array(
        'id' => 1,
        'name' => '管理模块',
        'parent' => 0,
        'role' => 1,
        'created_at' => new DateTime,
        'updated_at' => new DateTime
      ),
      array(
        'id' => 2,
        'name' => '查看模块',
        'parent' => 1,
        'role' => 1,
        'created_at' => new DateTime,
        'updated_at' => new DateTime
      ),
    );

    DB::table('sidebars')->insert($sidebars);
	}

}