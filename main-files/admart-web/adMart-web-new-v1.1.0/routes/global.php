<?php

use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Storage;
use App\Http\Controllers\FileController;
use App\Http\Controllers\GlobalController;
use App\Http\Controllers\Admin\ProductCartController;

Route::controller(GlobalController::class)->prefix('global')->name('global.')->group(function () {
    Route::post('get-states', 'getStates')->name('country.states');
    Route::post('get-cities', 'getCities')->name('country.cities');
    Route::post('get-countries', 'getCountries')->name('countries');
    Route::post('get-timezones', 'getTimezones')->name('timezones');
    Route::post('set-cookie', 'setCookie')->name('set.cookie');
});
Route::controller(ProductCartController::class)->group(function () {
    Route::get('/cart', 'index')->name('cart.index');
    Route::get('/cart/get', 'getCart')->name('cart.get');
    Route::post('/cart/update', 'updateCart')->name('cart.update');

    Route::post('/cart/update-quantity', 'updateQuantity')->name('cart.update-quantity');
    Route::post('/cart/remove', 'remove')->name('cart.remove');
    Route::get('/checkout', 'checkout')->name('checkout');
});



// FileHolder Routes
Route::post('fileholder-upload', [FileController::class, 'storeFile'])->name('fileholder.upload');
Route::post('fileholder-remove', [FileController::class, 'removeFile'])->name('fileholder.remove');

Route::get('file/download/{path_source}/{name}', function ($path_source, $file_name) {
    $file_link = get_files_path($path_source).'/'.$file_name;

    if (Storage::disk(Storage::getDefaultDriver())->exists($file_link)) {
        return Storage::disk(Storage::getDefaultDriver())->download($file_link);
    }

    return back()->with(['error' => ['File doesn\'t exists']]);
})->name('file.download');
