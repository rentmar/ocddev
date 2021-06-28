<?php

namespace App\Controllers;

use App\Models\Actor_model;

class Actor extends BaseController
{
	public function index()
	{
		return view('vactor');
	}
	public function editarActor($idactor)
	{
		$receptor= \Config\Services::request();
		$dt=['nombre_actor'=>$receptor->getPost('nombre_actor')];
		$actorModel= new Actor_model();
		$actorModel->setValidationRules($actorModel->reglas);
		$actorModel->setValidationMessage($actorModel->nombre_actor,$actorModel->mensajes);
		if ($actorModel->update($idactor,$dt) === false)
		{
			return view('errors/mensajes_validacion', ['errores' => $actorModel->errors()]);
		}
		else
		{
			return view('vactor');
		}			
	}
	public function agregarActor()
	{
		$receptor= \Config\Services::request();
		$dt=['nombre_actor'=>$receptor->getPost('nombre_actor')];
		$actorModel= new Actor_model();
		$actorModel->setValidationRules($actorModel->reglas);
		$actorModel->setValidationMessage($actorModel->nombre_actor,$actorModel->mensajes);
		if ($actorModel->insert($dt) === false)
		{
			return view('errors/mensajes_validacion', ['errores' => $actorModel->errors()]);
		}
		else
		{
			return view('vactor');
		}
	}
}
