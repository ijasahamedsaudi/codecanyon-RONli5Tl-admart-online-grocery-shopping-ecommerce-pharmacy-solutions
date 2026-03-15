<?php

namespace Database\Seeders\Admin;

use App\Models\Admin\SiteSections;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Constants\SiteSectionConst;
use Illuminate\Support\Str;

class SiteSectionsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        $data = [
            array('id' => '1', 'key' => 'banner-section', 'value' => 'YOUR_VALUE', 'status' => '1', 'serialize' => null, 'created_at' => '2025-04-30 12:05:44', 'updated_at' => '2025-04-30 13:10:30'),
            array('id' => '2', 'key' => 'download-app', 'value' => 'YOUR_VALUE', 'status' => '1', 'serialize' => null, 'created_at' => '2025-04-30 16:45:19', 'updated_at' => '2025-07-01 11:49:19'),
            array('id' => '3', 'key' => 'brand-section', 'value' => 'YOUR_VALUE', 'status' => '1', 'serialize' => null, 'created_at' => '2025-04-30 17:11:28', 'updated_at' => '2025-07-01 11:43:34'),
            array('id' => '15', 'key' => 'site_cookie', 'value' => 'YOUR_VALUE', 'status' => '1', 'serialize' => null, 'created_at' => '2024-11-07 11:32:14', 'updated_at' => '2024-11-07 11:32:14'),
            array('id' => '16', 'key' => 'special-offer-section', 'value' => 'YOUR_VALUE', 'status' => '1', 'serialize' => null, 'created_at' => '2025-05-19 17:28:16', 'updated_at' => '2025-07-01 11:52:18')

        ];

        SiteSections::insert($data);
    }
}
