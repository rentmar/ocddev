<?php

namespace App\Controllers;

use App\Models\Departamento_model;

class Departamento extends BaseController
{
	public function index()
	{
		return view('vdepartamento');
	}
	public function pruebadb()
	{
		//metodo definido 
		$departamentoModel= new Departamento_model();
		$datos = $departamentoModel->leerDepartamentos();
		echo var_dump($datos);
		echo "---------------------------->";
		//metodo heredado
		$dato=$departamentoModel->find(3);
		echo var_dump($dato);
	}
	public function editarDepartamento($iddepto)
	{
		$receptor= \Config\Services::request();
		$nombre_departamento=$receptor->getPost('nombre_departamento');
		$dt=['nombre_departamento'=>$nombre_departamento];
		$departamentoModel= new Departamento_model();
		$departamentoModel->setValidationRules($departamentoModel->reglas);
		$departamentoModel->setValidationMessage($departamentoModel->nombre_departamento,$departamentoModel->mensajes);
		if ($departamentoModel->update($iddepto,$dt) === false)
		{
			return view('errors/mensajes_validacion', ['errores' => $departamentoModel->errors()]);
		}
		else
		{
			return view('vdepartamento');
		}			
	}
	public function agregarDepartamento()
	{
		$receptor= \Config\Services::request();
		$nombre_departamento=$receptor->getPost('nombre_departamento');
		$dt=['nombre_departamento'=>$nombre_departamento];
		$departamentoModel= new Departamento_model();
		$departamentoModel->setValidationRules($departamentoModel->reglas);
		$departamentoModel->setValidationMessage($departamentoModel->nombre_departamento,$departamentoModel->mensajes);
		if ($departamentoModel->insert($dt) === false)
		{
			return view('errors/mensajes_validacion', ['errores' => $departamentoModel->errors()]);
		}
		else
		{
			return view('vdepartamento');
		}
	}
}
