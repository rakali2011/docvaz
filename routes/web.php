<?php

use App\Http\Controllers\AuditController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ClientController;
use App\Http\Controllers\CompanyController;
use App\Http\Controllers\DepartmentController;
use App\Http\Controllers\DesignationController;
use App\Http\Controllers\DocumentTypeController;
use App\Http\Controllers\FileController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\LinkController;
use App\Http\Controllers\PermissionController;
use App\Http\Controllers\PracticeController;
use App\Http\Controllers\PracticeInfoFormController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\SettingController;
use App\Http\Controllers\StatusController;
use App\Http\Controllers\TeamController;
use App\Http\Controllers\TicketController;
use App\Http\Controllers\TicketAttachmentController;
use App\Http\Controllers\TicketReplyController;
use App\Http\Controllers\UserController;
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
Route::get('/files', [HomeController::class, 'files'])->name('files');
Route::post('/upload', [HomeController::class, 'upload_files'])->name('upload');
Auth::routes(['register' => false]);
Route::middleware(['auth', 'dev'])->group(function () {
    Route::get('/companies', [CompanyController::class, 'companies'])->name('companies');
    Route::get('/add-company', [CompanyController::class, 'add_company'])->name('add_company');
    Route::get('/edit-company/{id}', [CompanyController::class, 'edit_company'])->name('edit_company');
    Route::post('/post-company', [CompanyController::class, 'post_company'])->name('post_company');
    Route::post('/update-company/{id?}', [CompanyController::class, 'update_company'])->name('update_company');
    Route::get('/permissions', [PermissionController::class, 'permissions'])->name('permissions');
    Route::get('/add-permission', [PermissionController::class, 'add_permission'])->name('add_permission');
    Route::post('/post-permission', [PermissionController::class, 'post_permission'])->name('post_permission');
    Route::get('/superadmins', [CompanyController::class, 'superadmins'])->name('superadmins');
});
// Audits
Route::get('/audits', [AuditController::class, 'index'])->middleware('permission:view audit system log')->name('audits');
Route::post('/get-audits', [AuditController::class, 'audits'])->middleware('permission:view audit system log')->name('get_audits');
// Clients
Route::get('/clients', [ClientController::class, 'clients'])->middleware('permission:view client')->name('clients');
Route::get('/add-client', [ClientController::class, 'add_client'])->middleware('permission:add client')->name('add_client');
Route::post('/post-client', [ClientController::class, 'post_client'])->middleware('permission:add client')->name('post_client');
Route::get('/edit-client/{id}', [ClientController::class, 'edit_client'])->middleware('permission:update client')->name('edit_client');
Route::post('/update-client/{id}', [ClientController::class, 'update_client'])->middleware('permission:update client')->name('update_client');
Route::post('/all-clients', [ClientController::class, 'all_clients'])->name('all_clients');
// Departments
Route::get('/departments', [DepartmentController::class, 'departments'])->middleware('permission:view department')->name('departments');
Route::get('/add-department', [DepartmentController::class, 'add_department'])->middleware('permission:add department')->name('add_department');
Route::post('/post-department', [DepartmentController::class, 'post_department'])->middleware('permission:add department')->name('post_department');
Route::get('/edit-department/{id}', [DepartmentController::class, 'edit_department'])->middleware('permission:update department')->name('edit_department');
Route::post('/update-department/{id}', [DepartmentController::class, 'update_department'])->middleware('permission:update department')->name('update_department');
Route::post('/get-departments', [DepartmentController::class, 'get_departments'])->middleware('permission:assign department user')->name('get_departments');
// Designations
Route::resource('designations', DesignationController::class);
Route::post('/update-rank', [DesignationController::class, 'updateRank'])->middleware('permission:view designation')->name('update_rank');
// Document Types
Route::resource('document_types', DocumentTypeController::class);
Route::post('/get-document-types', [DocumentTypeController::class, 'get_document_types'])->middleware('permission:assign department user')->name('get_document_types');
// Files
Route::get('/import', [FileController::class, 'import'])->middleware('permission:import file')->name('import');
Route::get('/files', [FileController::class, 'files'])->middleware('permission:view file')->name('files');
Route::get('/file/{id}', [FileController::class, 'show'])->middleware('permission:view file')->name('file');
Route::post('/post-file', [FileController::class, 'post_file'])->middleware('permission:import file')->name('post_file');
Route::get('/edit-file/{id}', [FileController::class, 'edit_file'])->middleware('permission:update file')->name('edit_file');
Route::post('/update-file/{id}', [FileController::class, 'update_file'])->middleware('permission:update file')->name('update_file');
Route::post('/delete-file/{id}', [FileController::class, 'delete_file'])->middleware('permission:delete file')->name('delete_file');
Route::post('/all-files', [FileController::class, 'allFiles'])->middleware('permission:view file')->name('all_files');
// Links
Route::resource('links', LinkController::class);
// Practice
Route::get('/practices', [PracticeController::class, 'practices'])->middleware('permission:view practice')->name('practices');
Route::get('/add-practice', [PracticeController::class, 'add_practice'])->middleware('permission:add practice')->name('add_practice');
Route::post('/post-practice', [PracticeController::class, 'post_practice'])->middleware('permission:add practice')->name('post_practice');
Route::get('/edit-practice/{id}', [PracticeController::class, 'edit_practice'])->middleware('permission:update practice')->name('edit_practice');
Route::post('/update-practice/{id}', [PracticeController::class, 'update_practice'])->middleware('permission:update practice')->name('update_practice');
Route::post('/get-practices', [PracticeController::class, 'get_practices'])->middleware('permission:assign practice user')->name('get_practices');
Route::post('/all-practices', [PracticeController::class, 'all_practices'])->middleware('permission:view practice')->name('all_practices');
// Practice Info Form
Route::resource('practice_info_form', PracticeInfoFormController::class);
Route::get('/practice-info-form/{id}', [PracticeInfoFormController::class, 'practiceInfoForm'])->name('practice_info_form');
// Roles
Route::get('/roles', [RoleController::class, 'roles'])->middleware('permission:view role')->name('roles');
Route::get('/add-role', [RoleController::class, 'add_role'])->middleware('permission:add role')->name('add_role');
Route::post('/post-role', [RoleController::class, 'post_role'])->middleware('permission:add role')->name('post_role');
Route::get('/edit-role/{id}', [RoleController::class, 'edit_role'])->middleware('permission:update team')->name('edit_role');
Route::post('/update-role/{id}', [RoleController::class, 'update_role'])->middleware('permission:update team')->name('update_role');
Route::post('/all-roles', [RoleController::class, 'all_roles'])->name('all_roles');
// Settings
Route::resource('settings', SettingController::class);
Route::post('/get-setting', [SettingController::class, 'getSetting'])->middleware('permission:update company setting')->name('get_setting');
// Statuses
Route::resource('statuses', StatusController::class);
Route::post('/default-status', [StatusController::class, 'default_status'])->middleware('permission:update status')->name('default_status');
// Teams
Route::get('/teams', [TeamController::class, 'teams'])->middleware('permission:view team')->name('teams');
Route::get('/add-team', [TeamController::class, 'add_team'])->middleware('permission:add team')->name('add_team');
Route::post('/post-team', [TeamController::class, 'post_team'])->middleware('permission:add team')->name('post_team');
Route::get('/edit-team/{id}', [TeamController::class, 'edit_team'])->middleware('permission:update team')->name('edit_team');
Route::post('/update-team/{id}', [TeamController::class, 'update_team'])->middleware('permission:update team')->name('update_team');
Route::post('/get-teams', [TeamController::class, 'get_teams'])->middleware('permission:assign department user')->name('get_teams');
Route::post('/update-team-users', [TeamController::class, 'update_team_users'])->middleware('permission:assign team user')->name('update_team_users');
// Tickets
Route::resource('tickets', TicketController::class);
Route::post('/all-tickets', [TicketController::class, 'allTickets'])->middleware('permission:view ticket')->name('all_tickets');
Route::post('/get-ticket', [TicketController::class, 'getTicket'])->middleware('permission:view ticket')->name('get_ticket');
Route::post('/get-flag', [TicketController::class, 'ticketFlag'])->middleware('permission:view ticket')->name('ticket_flag');
// Ticket Attachment
Route::resource('ticket_attachments', TicketAttachmentController::class);
// Ticket Replies
Route::resource('ticket_replies', TicketReplyController::class);
// Users
Route::get('/users', [UserController::class, 'users'])->name('users');
Route::get('/add-user', [UserController::class, 'add_user'])->middleware('permission:add user')->name('add_user');
Route::post('/post-user', [UserController::class, 'post_user'])->middleware('permission:add user')->name('post_user');
Route::get('/edit-user/{id}', [UserController::class, 'edit_user'])->middleware('permission:update user')->name('edit_user');
Route::post('/update-user/{id}', [UserController::class, 'update_user'])->middleware('permission:update user')->name('update_user');
Route::post('/get-users', [UserController::class, 'get_users'])->middleware('permission:update user')->name('get_users');
Route::get('/profile', [UserController::class, 'profile'])->middleware('permission:update user')->name('profile');
Route::post('/all-users', [UserController::class, 'all_users'])->name('all_users');
Route::post('/update-profile', [UserController::class, 'update_profile'])->name('update_profile');
Route::get('/change-password', [UserController::class, 'change_password'])->name('change_password');
Route::post('/update-password', [UserController::class, 'update_password'])->name('update_password');
Route::post('/update-user-departments', [UserController::class, 'update_user_departments'])->middleware('permission:assign department user')->name('update_user_departments');
Route::post('/update-user-document-types', [UserController::class, 'update_user_document_types'])->middleware('permission:assign document user')->name('update_user_document_types');
Route::post('/update-user-practices', [UserController::class, 'update_user_practices'])->middleware('permission:assign practice user')->name('update_user_practices');
Route::post('/update-user-teams', [UserController::class, 'update_user_teams'])->middleware('permission:assign team user')->name('update_user_teams');
