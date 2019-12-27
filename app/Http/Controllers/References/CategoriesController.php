<?php

namespace App\Http\Controllers\References;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\References\Categories;
use App\Http\Resources\Reference;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;
use Auth;

class CategoriesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categories = Categories::where('is_deleted', 0)->orderBy('category_id', 'desc')->get();
        return Reference::collection($categories);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        Validator::make($request->all(),
            [
                'category_code' => 'required',
                'category_name' => 'required'
            ]
        )->validate();

        $category = new Categories();
        $category->category_code = $request->input('category_code');
        $category->category_name = $request->input('category_name');
        $category->category_desc = $request->input('category_desc');
        $category->sort_key = $request->input('sort_key');
        $category->created_datetime = Carbon::now();
        $category->created_by = Auth::user()->user_id;
    
        $category->save();

        //return json based from the resource data
        return ( new Reference( $category ))
                ->response()
                ->setStatusCode(201);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $category = Categories::findOrFail($id);

        return ( new Reference( $category ) )
            ->response()
            ->setStatusCode(200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $category = Categories::findOrFail($id);
        
        Validator::make($request->all(),
            [
                'category_code' => 'required',
                'category_name' => 'required'
            ]
        )->validate();

        
        $category->category_code = $request->input('category_code');
        $category->category_name = $request->input('category_name');
        $category->category_desc = $request->input('category_desc');
        $category->sort_key = $request->input('sort_key');
        $category->modified_datetime = Carbon::now();
        $category->modified_by = Auth::user()->user_id;


        //update  based on the http json body that is sent
        $category->save();

        return ( new Reference( $category ) )
            ->response()
            ->setStatusCode(200);
    }

    /**
     * Update the specified resource in storage for deleting.
     * preventing force delete rather update the is_deleted = true
     * 
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {   
        $category = Categories::findOrFail($id);

        $category->is_deleted = 1;
        $category->deleted_datetime = Carbon::now();
        $category->deleted_by = Auth::user()->user_id;

        //update classification based on the http json body that is sent
        $category->save();

        return ( new Reference( $category ) )
            ->response()
            ->setStatusCode(200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function checkIfUsed($id)
    {
        $exists = 'false';

        // if(ContractInfo::where('department_id', '=', $id)
        //     ->where('is_deleted', 0)
        //     ->exists()) {
        //     $exists = 'true';
        // }
        return $exists;
    }
}
