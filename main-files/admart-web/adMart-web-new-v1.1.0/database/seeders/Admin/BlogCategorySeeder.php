<?php

namespace Database\Seeders\Admin;

use App\Models\Admin\BlogCategory;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class BlogCategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data = [
            array('id' => '1','slug' => 'service-list','name' => '{"language":{"en":{"name":"YOUR_NAME"},"fr":{"name":"YOUR_NAME"},"es":{"name":"YOUR_NAME"},"ar":{"name":"YOUR_NAME"}}}','status' => '1','created_at' => '2024-12-09 15:14:33','updated_at' => '2025-04-21 09:46:19'),
            array('id' => '2','slug' => 'salon-details','name' => '{"language":{"en":{"name":"YOUR_NAME"},"fr":{"name":"YOUR_NAME"},"es":{"name":"YOUR_NAME"},"ar":{"name":"YOUR_NAME"}}}','status' => '1','created_at' => '2024-12-09 15:24:00','updated_at' => '2025-04-21 09:45:06')

        ];

        BlogCategory::insert($data);
    }
}
