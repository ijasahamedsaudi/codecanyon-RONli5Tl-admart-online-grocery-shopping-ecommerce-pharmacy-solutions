<?php

namespace Database\Seeders\Update;

use App\Models\Admin\Extension;
use Illuminate\Database\Seeder;

class ExtentionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $extensions = [
            ['name' => 'Google Recaptcha', 'slug' => 'google-recaptcha', 'description' => 'Google Recaptcha', 'image' => 'recaptcha3.png', 'script' => null, 'shortcode' => '{"site_key":{"title":"YOUR_TITLE","value":"YOUR_VALUE"},"secret_key":{"title":"YOUR_TITLE","value":"YOUR_VALUE"}}', 'support_image' => 'recaptcha.png', 'status' => '1', 'created_at' => '2025-12-05 17:25:26', 'updated_at' => '2025-12-09 14:37:13'],
        ];

        Extension::insert($extensions);
    }
}
