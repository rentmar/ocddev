<?php

namespace App\Models;

Use CodeIgniter\Model;

class Tema_model extends Model
{	
	// datos para el modelo
	protected $table      = 'tema';
    protected $primaryKey = 'idtema';
    protected $returnType     = 'array';
    protected $useSoftDeletes = false;
    protected $allowedFields = ['idtema', 'nombre_tema'];
	// validacion de datos
	protected $nombre_tema='nombre_tema';
	protected $reglas = [
         'nombre_tema' => 'required|alpha_numeric_space|is_unique[tema.nombre_tema]'];
    protected $mensajes = [
			'alpha_numeric_space' => 'Nombre del tema no puede contener caracteres especiales'];
	// metodos definidos
}
