<?php

namespace App\Models;

Use CodeIgniter\Model;

class Actor_model extends Model
{	
	// datos para el modelo
	protected $table      = 'actor';
    protected $primaryKey = 'idactor';
    protected $returnType     = 'array';
    protected $useSoftDeletes = false;
    protected $allowedFields = ['idactor', 'nombre_actor'];
	// validacion de datos
	protected $nombre_actor='nombre_actor';
	protected $reglas    = [
         'nombre_actor' => 'required|alpha_numeric_space|is_unique[actor.nombre_actor]'
    ];
    protected $mensajes = [
			'alpha_numeric_space' => 'Nombre del actor no puede contener caracteres especiales',
            'is_unique' => 'Dato actor ya esta registrado'];
	// metodos definidos
}
