<?php

namespace App\Models;

Use CodeIgniter\Model;

class TipoMedio_model extends Model
{	
	// datos para el modelo
	protected $table      = 'tipo_medio';
    protected $primaryKey = 'idtipomedio';
    protected $returnType     = 'array';
    protected $useSoftDeletes = false;
    protected $allowedFields = ['idtipomedio', 'nombre_tipo'];
	// validacion de datos
	protected $nombre_tipo='nombre_tipo';
	protected $reglas    = [
         'nombre_tipo' => 'required|alpha_numeric_space|is_unique[tipo_medio.nombre_tipo]'
    ];
    protected $mensajes = [
			'alpha_numeric_space' => 'Nombre del tipo de medio no puede contener caracteres especiales',
            'is_unique' => 'Dato tipo de medio ya esta registrado'];
	// metodos definidos
}
