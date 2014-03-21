<?php

class UsersController extends \BaseController {

	public function login() {
		if (Auth::attempt(array('username' => Input::json('username',''), 'password' => Input::json('password','')))) {
			$user = Auth::user();
			return Response::json(array(
				'error' => false,
				'msg' => '',
				'content' => $user->toArray()
			));
		} else {
			return Response::json(array(
				'error' => true,
				'msg' => '帐号或密码错误',
				'content' => null
			),401);
		}
	}

	public function logout() {
		Auth::logout();
		return Response::json(array(
			'error' => false,
			'msg' => '',
			'content' => '注销成功'
		));
	}
}
