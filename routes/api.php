<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group([

    'middleware' => 'api',
    'prefix' => 'auth'

], function () {

    Route::post('login', 'AuthController@login');
    Route::get('logout', 'AuthController@logout');
    Route::get('refresh', 'AuthController@refresh');
    Route::get('me', 'AuthController@me');
});


// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// }); 
Route::middleware('auth:api')->group(function () {
    //---------------------------------- REFERENCES -----------------------------------------------
    //DASHBOARD
    Route::get('dashboard/index/{payment_type}', 'References\DashboardController@index');
    Route::get('dashboard/payment/{payment_type}/{is_string}', 'References\DashboardController@getPaymentLine');
    //END DASHBOARD
    // List of Charges

    //List categories
    Route::get('categories', 'References\CategoriesController@index');
    //List single category
    Route::get('category/{id}', 'References\CategoriesController@show');
    //Create new category
    Route::post('category', 'References\CategoriesController@create');
    //Update category
    Route::put('category/{id}', 'References\CategoriesController@update');
    //Delete category
    Route::put('category/delete/{id}', 'References\CategoriesController@delete');
    //Check if category was used
    Route::get('categorycheck/{id}', 'References\CategoriesController@checkIfUsed');
    // END categories

    //List Departments
    Route::get('departments', 'References\DepartmentsController@index');
    //List single department
    Route::get('department/{id}', 'References\DepartmentsController@show');
    //Create new department
    Route::post('department', 'References\DepartmentsController@create');
    //Update department
    Route::put('department/{id}', 'References\DepartmentsController@update');
    //Delete department
    Route::put('department/delete/{id}', 'References\DepartmentsController@delete');
    //Check if department was used
    Route::get('departmentcheck/{id}', 'References\DepartmentsController@checkIfUsed');
    // END departments

    //List Units
    Route::get('units', 'References\UnitsController@index');
    //List single unit
    Route::get('unit/{id}', 'References\UnitsController@show');
    //Create new unit
    Route::post('unit', 'References\UnitsController@create');
    //Update unit
    Route::put('unit/{id}', 'References\UnitsController@update');
    //Delete unit
    Route::put('unit/delete/{id}', 'References\UnitsController@delete');
    //Check if unit was used
    Route::get('unitcheck/{id}', 'References\UnitsController@checkIfUsed');
    // END units


    //List cardtypes
    Route::get('cardtypes', 'References\CardtypesController@index');
    //List single cardtype
    Route::get('cardtype/{id}', 'References\CardtypesController@show');
    //Create new cardtype
    Route::post('cardtype', 'References\CardtypesController@create');
    //Update cardtype
    Route::put('cardtype/{id}', 'References\CardtypesController@update');
    //Delete cardtype
    Route::put('cardtype/delete/{id}', 'References\CardtypesController@delete');
    //Check if cardtype was used
    Route::get('cardtypecheck/{id}', 'References\CardtypesController@checkIfUsed');
    // END cardtype

    //List checktype
    Route::get('checktypes', 'References\ChecktypesController@index');
    //List single checktype
    Route::get('checktype/{id}', 'References\ChecktypesController@show');
    //Create new checktype
    Route::post('checktype', 'References\ChecktypesController@create');
    //Update checktype
    Route::put('checktype/{id}', 'References\ChecktypesController@update');
    //Delete checktype
    Route::put('checktype/delete/{id}', 'References\ChecktypesController@delete');
    //Check if checktype was used
    Route::get('checktypecheck/{id}', 'References\ChecktypesController@checkIfUsed');
    // END checktype

    //List gctypes
    Route::get('gctypes', 'References\GctypesController@index');
    //List single gctype
    Route::get('gctype/{id}', 'References\GctypesController@show');
    //Create new gctype
    Route::post('gctype', 'References\GctypesController@create');
    //Update gctype
    Route::put('gctype/{id}', 'References\GctypesController@update');
    //Delete gctype
    Route::put('gctype/delete/{id}', 'References\GctypesController@delete');
    //Check if gctype was used
    Route::get('gctypecheck/{id}', 'References\GctypesController@checkIfUsed');
    // END gctype

    //List menus
    Route::get('menus', 'References\MenusController@index');
    //List single menu
    Route::get('menu/{id}', 'References\MenusController@show');
    //Create new menu
    Route::post('menu', 'References\MenusController@create');
    //Update menu
    Route::put('menu/{id}', 'References\MenusController@update');
    //Delete menu
    Route::put('menu/delete/{id}', 'References\MenusController@delete');
    //Check if menu was used
    Route::get('menucheck/{id}', 'References\MenusController@checkIfUsed');
    // END menu
    //List menus
    Route::get('menus', 'References\MenusController@index');
    //List single menu
    Route::get('menu/{id}', 'References\MenusController@show');
    //Create new menu
    Route::post('menu', 'References\MenusController@create');
    //Update menu
    Route::put('menu/{id}', 'References\MenusController@update');
    //Delete menu
    Route::put('menu/delete/{id}', 'References\MenusController@delete');
    //Check if menu was used
    Route::get('menucheck/{id}', 'References\MenusController@checkIfUsed');
    // END menu

    //List suppliers
    Route::get('suppliers', 'References\SuppliersController@index');
    //List single supplier
    Route::get('supplier/{id}', 'References\SuppliersController@show');
    //Create new supplier
    Route::post('supplier', 'References\SuppliersController@create');
    //Update supplier
    Route::put('supplier/{id}', 'References\SuppliersController@update');
    //Delete supplier
    Route::put('supplier/delete/{id}', 'References\SuppliersController@delete');
    //Check if supplier was used
    Route::get('suppliercheck/{id}', 'References\SuppliersController@checkIfUsed');
    // END supplier
    //List inventorytypes
    Route::get('inventorytypes', 'References\InventorytypesController@index');
    //List single gctype
    Route::get('inventorytype/{id}', 'References\InventorytypesController@show');
    //Create new gctype
    Route::post('inventorytype', 'References\InventorytypesController@create');
    //Update gctype
    Route::put('inventorytype/{id}', 'References\InventorytypesController@update');
    //Delete gctype
    Route::put('inventorytype/delete/{id}', 'References\InventorytypesController@delete');
    //Check if gctype was used
    Route::get('inventorytypecheck/{id}', 'References\InventorytypesController@checkIfUsed');
    // END inventorytypes

    //List suppliers
    Route::get('suppliers', 'References\SuppliersController@index');
    //List single supplier
    Route::get('supplier/{id}', 'References\SuppliersController@show');
    //Create new supplier
    Route::post('supplier', 'References\SuppliersController@create');
    //Update supplier
    Route::put('supplier/{id}', 'References\SuppliersController@update');
    //Delete supplier
    Route::put('supplier/delete/{id}', 'References\SuppliersController@delete');
    //Check if supplier was used
    Route::get('suppliercheck/{id}', 'References\SuppliersController@checkIfUsed');
    // END supplier

    //List discounts
    Route::get('discounttypes', 'References\DiscounttypesController@index');
    //List single discount
    Route::get('discounttype/{id}', 'References\DiscounttypesController@show');
    //Create new discount
    Route::post('discounttype', 'References\DiscounttypesController@create');
    //Update discount
    Route::put('discounttype/{id}', 'References\DiscounttypesController@update');
    //Delete discount
    Route::put('discounttype/delete/{id}', 'References\DiscounttypesController@delete');
    //Check if discount was used
    Route::get('discounttypecheck/{id}', 'References\DiscounttypesController@checkIfUsed');
    // END discount

    //List products
    Route::get('products', 'References\ProductsController@index');
    //List single product
    Route::get('product/{id}', 'References\ProductsController@show');
    //Create new product
    Route::post('product', 'References\ProductsController@create');
    //Update product
    Route::put('product/{id}', 'References\ProductsController@update');
    //Delete product
    Route::put('product/delete/{id}', 'References\ProductsController@delete');
    //Check if product was used
    Route::get('productcheck/{id}', 'References\ProductsController@checkIfUsed');
    // END product

    Route::get('purchasemains', 'Inventory\PurchasemainsController@index');
    //List single purchasemain
    Route::get('purchasemain/{id}', 'Inventory\PurchasemainsController@show');
    //Create new purchasemain
    Route::post('purchasemain', 'Inventory\PurchasemainsController@create');
    //Update purchasemain
    Route::put('purchasemain/{id}', 'Inventory\PurchasemainsController@update');
    //Delete purchasemain
    Route::put('purchasemain/delete/{id}', 'Inventory\PurchasemainsController@delete');
    //Check if purchasemain was used
    Route::get('purchasemaincheck/{id}', 'Inventory\PurchasemainsController@checkIfUsed');
    // END purchasemain


    Route::get('receivingmains', 'Inventory\ReceivingmainsController@index');
    //List single inventorytype
    Route::get('receivingmain/{id}', 'Inventory\ReceivingmainsController@show');
    //Create new inventorytype
    Route::post('receivingmain', 'Inventory\ReceivingmainsController@create');
    //Update inventorytype
    Route::put('receivingmain/{id}', 'Inventory\ReceivingmainsController@update');
    //Delete inventorytype
    Route::put('receivingmain/delete/{id}', 'Inventory\ReceivingmainsController@delete');
    //Check if inventorytype was used
    Route::get('receivingmaincheck/{id}', 'Inventory\ReceivingmainsController@checkIfUsed');
    Route::get('getpoitems/{id}', 'Inventory\ReceivingmainsController@getpoitems');
    // END inventorytype

    //List issuances
    Route::get('issuances', 'Inventory\IssuancesController@index');
    //List single issuance
    Route::get('issuance/{id}', 'Inventory\IssuancesController@show');
    //Create new issuance
    Route::post('issuance', 'Inventory\IssuancesController@create');
    //Update issuance
    Route::put('issuance/{id}', 'Inventory\IssuancesController@update');
    //Delete issuance
    Route::put('issuance/delete/{id}', 'Inventory\IssuancesController@delete');
    //Check if issuance was used
    Route::get('issuancecheck/{id}', 'Inventory\IssuancesController@checkIfUsed');
    // END issuance

    //List adjustmentmains
    Route::get('adjustmentmains', 'Inventory\AdjustmentmainsController@index');
    //List single adjustmentmain
    Route::get('adjustmentmain/{id}', 'Inventory\AdjustmentmainsController@show');
    //Create new adjustmentmain
    Route::post('adjustmentmain', 'Inventory\AdjustmentmainsController@create');
    //Update adjustmentmain
    Route::put('adjustmentmain/{id}', 'Inventory\AdjustmentmainsController@update');
    //Delete adjustmentmain
    Route::put('adjustmentmain/delete/{id}', 'Inventory\AdjustmentmainsController@delete');
    //Check if adjustmentmain was used
    Route::get('adjustmentmaincheck/{id}', 'Inventory\AdjustmentmainsController@checkIfUsed');
    // END adjustmentmain

    //List pos
    Route::get('pos', 'POS\POSController@index');
    //List single pos
    // Route::get('pos/{id}', 'POS\POSController@show');
    // //Create new pos
    // Route::post('pos', 'POS\POSController@create');
    // //Update pos
    // Route::put('pos/{id}', 'POS\POSController@update');
    // //Delete pos
    // Route::put('pos/delete/{id}', 'POS\POSController@delete');
    // //Check if pos was used
    // Route::get('poscheck/{id}', 'POS\POSController@checkIfUsed');
    // // END pos
    Route::get('getmenu/{skip}', 'POS\POSController@GetMenu');
    Route::get('getproduct/{menu_id}', 'POS\POSController@GetProduct');


});
