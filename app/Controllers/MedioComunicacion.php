<?php

namespace App\Controllers;

use App\Models\MedioComunicacion_model;

class MedioComunicacion extends BaseController
{
	public function index()
	{
		return view('vmediocomunicacion');
	}
	public function editarMedioComunicacion($idmedio)
	{
		$receptor= \Config\Services::request();
		$dt=['nombre_medio'=>$receptor->getPost('nombre_medio'),
			'rel_idtipomedio'=>$receptor->getPost('rel_idtipomedio')];
		$MedioComunicacionModel= new MedioComunicacion_model();
		$MedioComunicacionModel->setValidationRules($MedioComunicacionModel->reglas);
		$MedioComunicacionModel->setValidationMessage($MedioComunicacionModel->nombre_medio,$MedioComunicacionModel->mensajes);
		$MedioComunicacionModel->setValidationMessage($MedioComunicacionModel->rel_idtipomedio,$MedioComunicacionModel->mensajes);
		if ($MedioComunicacionModel->update($idmedio,$dt) === false)
		{
			return view('errors/mensajes_validacion', ['errores' => $MedioComunicacionModel->errors()]);
		}
		else
		{
			return view('vmediocomunicacion');
		}			
	}
	public function agregarMedioComunicacion()
	{
		$receptor= \Config\Services::request();
		$nom=$receptor->getPost('nombre_medio');
		$idtm=$receptor->getPost('rel_idtipomedio');
		$iddepto=1;//$receptor->getPost('rel_iddepartamento');
		$MedioComunicacionModel= new MedioComunicacion_model();
		$MedioComunicacionModel->setValidationRules($MedioComunicacionModel->reglas);
		$MedioComunicacionModel->setValidationMessage($MedioComunicacionModel->nombre_medio,$MedioComunicacionModel->mensajes);
		$MedioComunicacionModel->setValidationMessage($MedioComunicacionModel->rel_idtipomedio,$MedioComunicacionModel->mensajes);
		if ($MedioComunicacionModel->insertarMedioComunicacion($nom,$idtm,$iddepto) === false)
		{
			return view('errors/mensajes_validacion', ['errores' => $MedioComunicacionModel->errors()]);
		}
		else
		{
			return view('vmediocomunicacion');
		}
	}
}
