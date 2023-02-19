<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\SuperAdminController;
use App\Http\Controllers\DevController;
use App\Http\Controllers\UserManagementController;
use App\Http\Controllers\PracticeController;
use App\Http\Controllers\FileController;
use App\Http\Controllers\RoleController;


use GuzzleHttp\Middleware;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [HomeController::class, 'index'])->name('home');
// files test
Route::get('/files', [HomeController::class, 'files'])->name('files');
Route::post('/upload', [HomeController::class, 'upload_files'])->name('upload');



Auth::routes(['register' => false]);

Route::middleware(['auth', 'dev'])->group(function () {
    Route::get('/companies', [DevController::class, 'companies'])->name('companies');
    Route::get('/add-company', [DevController::class, 'add_company'])->name('add_company');
    Route::get('/edit-company/{id}', [DevController::class, 'edit_company'])->name('edit_company');
    Route::post('/post-company', [DevController::class, 'post_company'])->name('post_company');
    Route::post('/update-company/{id?}', [DevController::class, 'update_company'])->name('update_company');


    Route::get('/permissions', [DevController::class, 'permissions'])->name('permissions');
    Route::get('/add-permission', [DevController::class, 'add_permission'])->name('add_permission');
    Route::post('/post-permission', [DevController::class, 'post_permission'])->name('post_permission');

    Route::get('/superadmins', [DevController::class, 'superadmins'])->name('superadmins');
});
// add role
Route::get('/roles', [SuperAdminController::class, 'roles'])->middleware('permission:view role')->name('roles');
Route::get('/add-role', [SuperAdminController::class, 'add_role'])->middleware('permission:add role')->name('add_role');
Route::post('/post-role', [SuperAdminController::class, 'post_role'])->middleware('permission:add role')->name('post_role');

// Route::group(['middleware' => ['auth']], function () {
//     Route::resource('roles', RoleController::class);
// });

// add team
Route::get('/teams', [SuperAdminController::class, 'teams'])->middleware('permission:view team')->name('teams');
Route::get('/add-team', [SuperAdminController::class, 'add_team'])->middleware('permission:add team')->name('add_team');
Route::post('/post-team', [SuperAdminController::class, 'post_team'])->middleware('permission:add team')->name('post_team');
Route::get('/edit-team/{id}', [SuperAdminController::class, 'edit_team'])->middleware('permission:update team')->name('edit_team');
Route::post('/update-team/{id}', [SuperAdminController::class, 'update_team'])->middleware('permission:update team')->name('update_team');
// add department
Route::get('/departments', [SuperAdminController::class, 'departments'])->middleware('permission:view department')->name('departments');
Route::get('/add-department', [SuperAdminController::class, 'add_department'])->middleware('permission:add department')->name('add_department');
Route::post('/post-department', [SuperAdminController::class, 'post_department'])->middleware('permission:add department')->name('post_department');
Route::get('/edit-department/{id}', [SuperAdminController::class, 'edit_department'])->middleware('permission:update department')->name('edit_department');
Route::post('/update-department/{id}', [SuperAdminController::class, 'update_department'])->middleware('permission:update department')->name('update_department');
// add user
Route::get('/users', [UserManagementController::class, 'users'])->middleware('permission:view user')->name('users');
Route::get('/add-user', [UserManagementController::class, 'add_user'])->middleware('permission:add user')->name('add_user');
Route::post('/post-user', [UserManagementController::class, 'post_user'])->middleware('permission:add user')->name('post_user');
Route::get('/edit-user/{id}', [UserManagementController::class, 'edit_user'])->middleware('permission:update user')->name('edit_user');
Route::post('/update-user/{id}', [UserManagementController::class, 'update_user'])->middleware('permission:update user')->name('update_user');
// add client
Route::get('/clients', [UserManagementController::class, 'clients'])->middleware('permission:view client')->name('clients');
Route::get('/add-client', [UserManagementController::class, 'add_client'])->middleware('permission:add client')->name('add_client');
Route::post('/post-client', [UserManagementController::class, 'post_client'])->middleware('permission:add client')->name('post_client');
Route::get('/edit-client/{id}', [UserManagementController::class, 'edit_client'])->middleware('permission:update client')->name('edit_client');
Route::post('/update-client/{id}', [UserManagementController::class, 'update_client'])->middleware('permission:update client')->name('update_client');

// add practice
Route::get('/practices', [PracticeController::class, 'practices'])->middleware('permission:view practice')->name('practices');
Route::get('/add-practice', [PracticeController::class, 'add_practice'])->middleware('permission:add practice')->name('add_practice');
Route::post('/post-practice', [PracticeController::class, 'post_practice'])->middleware('permission:add practice')->name('post_practice');
Route::get('/edit-practice/{id}', [PracticeController::class, 'edit_practice'])->middleware('permission:update practice')->name('edit_practice');
Route::post('/update-practice/{id}', [PracticeController::class, 'update_practice'])->middleware('permission:update practice')->name('update_practice');


Route::post('/get_practices', [PracticeController::class, 'get_practices'])->middleware('permission:assign practice user')->name('get_practices');
Route::post('/update_user_practices', [PracticeController::class, 'update_user_practices'])->middleware('permission:assign practice user')->name('update_user_practices');


Route::post('/get_departments', [SuperAdminController::class, 'get_departments'])->middleware('permission:assign department user')->name('get_departments');
Route::post('/update_user_departments', [SuperAdminController::class, 'update_user_departments'])->middleware('permission:assign department user')->name('update_user_departments');

// files
Route::get('/import', [FileController::class, 'import'])->middleware('permission:import file')->name('import');
Route::get('/files', [FileController::class, 'files'])->middleware('permission:view file')->name('files');
Route::post('/post-file', [FileController::class, 'post_file'])->middleware('permission:import file')->name('post_file');
