<?php

namespace App\Models;

Use CodeIgniter\Model;

class Departamento_model extends Model
{	
	// datos para el modelo
	protected $table      = 'departamento';
    protected $primaryKey = 'iddepartamento';
    protected $returnType     = 'array';
    protected $useSoftDeletes = false;
    protected $allowedFields = ['iddepartamento', 'nombre_departamento'];
	// validacion de datos
	protected $nombre_departamento='nombre_departamento';
	protected $reglas    = [
         'nombre_departamento' => 'required|alpha_numeric_space|is_unique[departamento.nombre_departamento]'
    ];
    protected $mensajes = [
			'alpha_numeric_space' => 'Nombre del departamento no puede contener caracteres especiales',
            'is_unique' => 'Ese departamento,region ya esta registrado'];
	// metodos definidos
	public function leerDepartamentos()
	{
		$dts=$this->db->query('SELECT * FROM departamento');
		return $dts->getResult();
	}
}
