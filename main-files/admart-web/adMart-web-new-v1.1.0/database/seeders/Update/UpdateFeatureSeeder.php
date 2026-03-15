<?php

namespace Database\Seeders\Update;

use Database\Seeders\Admin\VirtualCardApiSeeder;
use Exception;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\File;

class UpdateFeatureSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->call([
            AppSettingsSeeder::class,
            BasicSettingsSeeder::class,
            ExtentionSeeder::class,
        ]);

        // copy directory from public to storage
        $this->copyDirPubToStor();
    }

    /**
     * copy direcotry public to storage folder
     */
    public function copyDirPubToStor()
    {
        File::copyDirectory(public_path('backend'), rtrim(storage_path()).'/app/public/backend');
        File::copyDirectory(public_path('frontend'), rtrim(storage_path()).'/app/public/frontend');
        File::copyDirectory(public_path('fileholder'), rtrim(storage_path()).'/app/public/fileholder');
        File::copyDirectory(public_path('error-images'), rtrim(storage_path()).'/app/public/error-images');

        try{
            // delete root index.php file
            File::delete(base_path('index.php'));
        }catch(Exception){
            //
        }
    }
}
