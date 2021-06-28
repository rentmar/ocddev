<?php

namespace App\Controllers;

use App\Models\TipoMedio_model;

class TipoMedio extends BaseController
{
	public function index()
	{
		return view('vtipomedio');
	}
	public function editarTipoMedio($idtipo)
	{
		$receptor= \Config\Services::request();
		$dt=['nombre_tipo'=>$receptor->getPost('nombre_tipo')];
		$TipoMedioModel= new TipoMedio_model();
		$TipoMedioModel->setValidationRules($TipoMedioModel->reglas);
		$TipoMedioModel->setValidationMessage($TipoMedioModel->nombre_tipo,$TipoMedioModel->mensajes);
		if ($TipoMedioModel->update($idtipo,$dt) === false)
		{
			return view('errors/mensajes_validacion', ['errores' => $TipoMedioModel->errors()]);
		}
		else
		{
			return view('vtipomedio');
		}			
	}
	public function agregarTipoMedio()
	{
		$receptor= \Config\Services::request();
		$dt=['nombre_tipo'=>$receptor->getPost('nombre_tipo')];
		$TipoMedioModel= new TipoMedio_model();
		$TipoMedioModel->setValidationRules($TipoMedioModel->reglas);
		$TipoMedioModel->setValidationMessage($TipoMedioModel->nombre_tipo,$TipoMedioModel->mensajes);
		if ($TipoMedioModel->insert($dt) === false)
		{
			return view('errors/mensajes_validacion', ['errores' => $TipoMedioModel->errors()]);
		}
		else
		{
			return view('vtipomedio');
		}
	}
}
