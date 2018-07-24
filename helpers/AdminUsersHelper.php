<?php

require_once('BaseHelper.php');
require_once('PasswordHelper.php');

class AdminUsersHelper extends BaseHelper
{
	protected $table      = 'Admins';
	protected $rolesTable = 'Roles';

	public static function IsLoggedIn()
	{
		return isset($_SESSION['AdminUser']);
	}

	public static function Logout()
	{
		if (self::IsLoggedIn()) {
			unset($_SESSION['AdminUser']);
			return true;
		}

		return false;
	}

	public function Login()
	{
		global $xpdo;
		// Redirect to homepage if admin is already logged in
		if (self::IsLoggedIn())
			UtilityHelper::RedirectTo('index.php');

		$user_name    = $_POST['user_name'];
		$password = $_POST['password'];
		if (empty($user_name)) {
			return UtilityHelper::Response('error', 'Email is required.');
		}

		if (empty($password)) {
			return UtilityHelper::Response('error', 'Password is required.');
		}

		$user = $xpdo->getObject('Users', array('user_name' => $user_name));

		if (empty($user)) {
			return UtilityHelper::Response('error', 'This user does not exist.');
		}

		$hash = $user->get('password');
		$role = $user->get('role');

		if (password_verify($password, $hash)) {
			if($role=='admin'){
				$_SESSION['AdminUser'] = $user->toArray();
				return UtilityHelper::Response('success', 'User logged in successfully.');
			}
			else 
			{
				return UtilityHelper::Response('error', 'you must to be an admin.');
			}
		}
		else {
			return UtilityHelper::Response('error', 'Password is incorrect or email and password do not match.');
		}
	}
}