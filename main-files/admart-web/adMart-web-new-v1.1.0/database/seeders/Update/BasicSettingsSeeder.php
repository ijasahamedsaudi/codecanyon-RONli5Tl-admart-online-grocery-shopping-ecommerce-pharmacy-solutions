<?php

namespace Database\Seeders\Update;

use App\Models\Admin\BasicSettings;
use Exception;
use Illuminate\Database\Seeder;

class BasicSettingsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data = [
            'web_version' => '1.1.0',
            'storage_config' => [
                'method' => 'public',
            ],
        ];
        $basicSettings = BasicSettings::first();
        $basicSettings->update($data);

        // update language values
        try {
            update_project_localization_data();
        } catch (Exception $e) {
        }
    }
}
