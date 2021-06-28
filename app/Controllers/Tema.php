<?php

namespace App\Controllers;

use App\Models\Tema_model;

class Tema extends BaseController
{
	public function index()
	{
		return view('vtema');
	}
	public function editarTema($idtema)
	{
		$receptor= \Config\Services::request();
		$dt=['nombre_tema'=>$receptor->getPost('nombre_tema')];
		$temaModel= new Tema_model();
		$temaModel->setValidationRules($temaModel->reglas);
		$temaModel->setValidationMessage($temaModel->nombre_tema,$temaModel->mensajes);
		if ($temaModel->update($idtema,$dt) === false)
		{
			return view('errors/mensajes_validacion', ['errores' => $temaModel->errors()]);
		}
		else
		{
			return view('vtema');
		}			
	}
	public function agregarTema()
	{
		$receptor= \Config\Services::request();
		$dt=['nombre_tema'=>$receptor->getPost('nombre_tema')];
		$temaModel= new Tema_model();
		$temaModel->setValidationRules($temaModel->reglas);
		$temaModel->setValidationMessage($temaModel->nombre_tema,$temaModel->mensajes);
		if ($temaModel->insert($dt) === false)
		{
			return view('errors/mensajes_validacion', ['errores' => $temaModel->errors()]);
		}
		else
		{
			return view('vtema');
		}
	}
}
