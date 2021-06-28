<?php

namespace App\Models;

Use CodeIgniter\Model;

class SubTema_model extends Model
{	
	// datos para el modelo
	protected $table      = 'subtema';
    protected $primaryKey = 'idsubtema';
    protected $returnType     = 'array';
    protected $useSoftDeletes = false;
    protected $allowedFields = ['idsubtema', 'nombre_subtema','rel_idtema'];
	// validacion de datos
	protected $nombre_subtema='nombre_subtema';
	protected $rel_idtema='rel_idtema';
	protected $reglas = [
         'nombre_subtema' => 'required|alpha_numeric_space|is_unique[subtema.nombre_subtema]',
		 'rel_idtema'=>'required|is_natural_no_zero'
    ];
    protected $mensajes = [
			'alpha_numeric_space' => 'Nombre del subtema no puede contener caracteres especiales',
            'is_natural_no_zero' => 'Dato relacion al tema debe ser entero positivo'];
	// metodos definidos
}
