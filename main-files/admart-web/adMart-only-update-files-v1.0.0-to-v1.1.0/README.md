<<<<<<<< Update Guide >>>>>>>>>>>

Immediate Older Version: 1.0.0
Current Version: 1.1.0

Feature Update:
1. Updated Assets Architecture & Base URL
2. Security Update
3. Rate Limiter Added

Please Use Those Command On Your Terminal:
1. Update Composer To Add New Package (Make Sure Your Targeted Location Is Project Root)
   composer update && composer dumpautoload
2. To Added New Migration File
   php artisan migrate
3. To Update Version Related Feature Please Run This Command On Your Terminal (Make Sure Your Targeted Location Is Project Root)
   php artisan db:seed --class=Database\\Seeders\\Update\\UpdateFeatureSeeder
4. To link with Storage
   php artisan storage:link   
5. To clear all compiled caches (Make Sure Your Targeted Location Is Project Root)
   php artisan optimize:clear