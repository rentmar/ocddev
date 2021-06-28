<?php

namespace App\Models;

Use CodeIgniter\Model;

class MedioComunicacion_model extends Model
{	
	// datos para el modelo
	protected $table      = 'medio_comunicacion';
    protected $primaryKey = 'idmedio';
    protected $returnType     = 'array';
    protected $useSoftDeletes = false;
    protected $allowedFields = ['idmedio', 'nombre_medio','rel_idtipomedio'];
	// validacion de datos
	protected $nombre_medio='nombre_medio';
	protected $rel_idtipomedio='rel_idtipomedio';
	protected $reglas = [
         'nombre_medio' => 'required|alpha_numeric_space|is_unique[medio_comunicacion.nombre_medio]',
		 'rel_idtipomedio'=>'required|is_natural_no_zero'
    ];
    protected $mensajes = [
			'alpha_numeric_space' => 'Nombre del medio no puede contener caracteres especiales',
            'is_natural_no_zero' => 'Dato relacion al tipo de medio debe ser entero positivo'];
	// metodos definidos
	public function insertarMedioComunicacion($nom,$idtm,$iddepto)
	{
		$db  = \Config\Database::connect();
		$this->db->transStart();
			$builderMedio = $db->table('medio_comunicacion');
			$dtMedio = [
				'nombre_medio' => $nom,
				'rel_idtipomedio'  => $idtm
				];
			$builderMedio->insert($dtMedio);
			$idmedio=$this->db->insertID();
			$builderMedioDpto = $db->table('medio_departamento');
			$dtMedioDepto = [
				'rel_idmedio' => $idmedio,
				'rel_iddepartamento'  => $iddepto
				];
			$builderMedioDpto->insert($dtMedioDepto);
		$this->db->transComplete();
	}
}
