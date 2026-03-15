<?php

namespace Database\Seeders\Admin;

use App\Models\Admin\SmsProvider;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class SmsProviderSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $sms_providers = array(
            array('id' => '2','uuid' => '9fce64f3-2af2-4172-8f72-6134d73bd6cc','name' => 'Twilio','slug' => 'twilio','title' => 'Twilio SMS Provider','image' => 'cb0477b3-4c52-4dac-b0ec-5082ab317d44.webp','credentials' => '[{"label":"YOUR_LABEL","placeholder":"YOUR_PLACEHOLDER","name":"YOUR_NAME","value":"YOUR_VALUE"},{"label":"YOUR_LABEL","placeholder":"YOUR_PLACEHOLDER","name":"YOUR_NAME","value":"YOUR_VALUE"},{"label":"YOUR_LABEL","placeholder":"YOUR_PLACEHOLDER","name":"YOUR_NAME","value":"YOUR_VALUE"}]','env' => 'SANDBOX','status' => '1','created_at' => '2025-05-26 11:21:41','updated_at' => '2025-05-26 11:21:43')
        );

        SmsProvider::upsert($sms_providers, ['slug'], []);
    }
}
