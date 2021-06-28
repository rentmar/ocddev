<?php

namespace App\Controllers;

use App\Models\Departamento_model;

class Login extends BaseController
{
	public function index()
	{
		return view('vinicio_sesion');
		return view('vformulario');
	}
}
