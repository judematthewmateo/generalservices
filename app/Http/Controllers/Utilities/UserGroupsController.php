<?php

namespace App\Http\Controllers\Utilities;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Utilities\UserGroups;
use App\Models\Utilities\GroupRights;
use App\Models\Utilities\ModuleList;
use App\Models\Utilities\ModuleRights;
use App\Users;
use App\Http\Resources\Reference;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;
use Auth;
use DB;

class UserGroupsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $user_groups = UserGroups::where('is_deleted', 0)->orderBy('user_group_id', 'desc')->get();
        return Reference::collection($user_groups);
    }

    public function getGroupRights($user_group_id)
    {
        $group_rights = ModuleRights::select(
                                            'ml.module_id',
                                            'b_module_rights.right_desc',
                                            'b_module_rights.module_right_id',
                                            DB::raw('CONCAT(ml.module_id, "-", b_module_rights.module_right_id) as right_code'),
                                            DB::raw('IF(IFNULL(gr.right_code, 0) = 0, 0, 1) as rights')
                        )
                                    ->leftJoin('b_module_list as ml', 'b_module_rights.module_id', '=', 'ml.module_id')
                                    ->leftJoin('b_group_rights as gr', function($join) use ($user_group_id){
                                        $join->on('gr.right_code', '=', DB::raw('CONCAT(ml.module_id, "-", b_module_rights.module_right_id)'))
                                            ->where('gr.user_group_id', $user_group_id);
                                    })
                                    ->orderBy('module_right_id')
                                    ->get();
                                    
        return ( new Reference( $group_rights ))
                ->response()
                ->setStatusCode(201);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $user_group = new UserGroups();
        $user_group->user_group = $request->input('user_group');
        $user_group->user_group_desc = $request->input('user_group_desc');
        $user_group->created_datetime = Carbon::now();
        $user_group->created_by = Auth::user()->id;
    
        $user_group->save();

        //return json based from the resource data
        return ( new Reference( $user_group ))
                ->response()
                ->setStatusCode(201);
    }

    public function createGroupRights(Request $request, $user_group_id)
    {
        $old_rights = GroupRights::where('user_group_id', $user_group_id);
        $old_rights->delete();

        $rights_dataSet = [];
        $rights = $request->input('rights');

        foreach($rights as $right){
            // return $right_codes;
            $rights_dataSet[] = [
                'user_group_id' => $user_group_id,
                'right_code' => $right['right_code'],
            ];
        }

        DB::table('b_group_rights')->insert($rights_dataSet);

        // $user_group = new UserGroups();
        // $user_group->user_group = $request->input('user_group');
        // $user_group->user_group_desc = $request->input('user_group_desc');
        // $user_group->created_datetime = Carbon::now();
        // $user_group->created_by = Auth::user()->id;
    
        // $user_group->save();

        // //return json based from the resource data
        // return ( new Reference( $user_group ))
        //         ->response()
        //         ->setStatusCode(201);
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
        $user_group = UserGroups::findOrFail($id);

        return ( new Reference( $user_group ) )
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
        $user_group = UserGroups::findOrFail($id);
        
        $user_group->user_group = $request->input('user_group');
        $user_group->user_group_desc = $request->input('user_group_desc');
        $user_group->modified_datetime = Carbon::now();
        $user_group->modified_by = Auth::user()->id;


        //update  based on the http json body that is sent
        $user_group->save();

        return ( new Reference( $user_group ) )
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
        $user_group = UserGroups::findOrFail($id);

        $user_group->is_deleted = 1;
        $user_group->deleted_datetime = Carbon::now();
        $user_group->deleted_by = Auth::user()->id;

        //update classification based on the http json body that is sent
        $user_group->save();

        return ( new Reference( $user_group ) )
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

        if(Users::where('user_group_id', '=', $id)
            ->where('is_deleted', 0)
            ->exists()) {
            $exists = 'true';
        }
        return $exists;
    }

    public function getModuleList(){
        $module['module_groups'] = ModuleList::select('module_group', 'module_id')
                                    ->groupBy('module_group')
                                    ->orderBy('module_id', 'ASC')
                                    ->get();
        $module['modules'] = ModuleList::get();
        
        return (new Reference( $module ) )
                ->response()
                ->setStatusCode(200);
    }
}
