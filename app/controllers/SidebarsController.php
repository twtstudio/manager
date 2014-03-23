<?php

class SidebarsController extends \BaseController {


	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		$result = array();
		foreach (Sidebar::all() as $sidebar) {
			if ($sidebar->parent == 0) {
				$sidebar = $sidebar->toArray();
				$sidebars['children'] = array();
				$result[] = $sidebar;
			} else {
				foreach ($result as $k => &$v) {
					if ($v['id'] == $sidebar->parent) {
						$v['children'][] = $sidebar->toArray();
					} else {
							// throw error
						return Response::json(array(
							'error' => array(
								'type' => 'sys',
								'msg' => 'sidebar数据库出错'
							),
							'content' => null
						),500);
					}
				}


			}
		}

		return Response::json($result);
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{

	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{

	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		//
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		//
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		//
	}

}