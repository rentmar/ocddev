<?php

namespace App\Controllers;

use App\Models\SubTema_model;

class SubTema extends BaseController
{
	public function index()
	{
		return view('vsubtema');
	}
	public function editarSubTema($idsubtema)
	{
		$receptor= \Config\Services::request();
		$dt=['nombre_subtema'=>$receptor->getPost('nombre_subtema'),
			'rel_idtema'=>$receptor->getPost('rel_idtema')];
		$SubTemaModel= new SubTema_model();
		$SubTemaModel->setValidationRules($SubTemaModel->reglas);
		$SubTemaModel->setValidationMessage($SubTemaModel->nombre_subtema,$SubTemaModel->mensajes);
		$SubTemaModel->setValidationMessage($SubTemaModel->rel_idtema,$SubTemaModel->mensajes);
		if ($SubTemaModel->update($idsubtema,$dt) === false)
		{
			return view('errors/mensajes_validacion', ['errores' => $SubTemaModel->errors()]);
		}
		else
		{
			return view('vsubtema');
		}			
	}
	public function agregarSubTema()
	{
		$receptor= \Config\Services::request();
		$dt=['nombre_subtema'=>$receptor->getPost('nombre_subtema'),
			'rel_idtema'=>$receptor->getPost('rel_idtema')];
		$SubTemaModel= new SubTema_model();
		$SubTemaModel->setValidationRules($SubTemaModel->reglas);
		$SubTemaModel->setValidationMessage($SubTemaModel->nombre_subtema,$SubTemaModel->mensajes);
		$SubTemaModel->setValidationMessage($SubTemaModel->rel_idtema,$SubTemaModel->mensajes);
		if ($SubTemaModel->insert($dt) === false)
		{
			return view('errors/mensajes_validacion', ['errores' => $SubTemaModel->errors()]);
		}
		else
		{
			return view('vsubtema');
		}
	}
}
