<?php

namespace App\Controllers;

use App\Models\ReformaElectoral_model;

class ReformaElectoral extends BaseController
{
	public function index()
	{
		return view('vreformaelectoral');
	}
}
