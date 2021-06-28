<?php

namespace App\Controllers;

use App\Models\Departamento_model;

class Login extends BaseController
{
    protected $ionauth;
    protected $session;

    public function __construct()
    {
        $this->ionauth = new \IonAuth\Libraries\IonAuth();
        helper(['form', 'url']);
        $this->session = \Config\Services::session();
    }

    public function index()
	{
	    if($this->ionauth->loggedIn())
	    {
	        //Redireccion a la pagina Inicio
	        echo "Sesion iniciada";
            return redirect()->to('inicio');
        }
	    else{

	        //Redireccion a la pagina de login
            return view('inicio/vinicio_sesion');
            return view('vformulario');


        }

	}

	public function validar()
    {
        //Capturar las credenciales del usuario
        $identidad = $this->request->getPost('identidad');
        $password = $this->request->getPost('password');

        if( $this->ionauth->login($identidad, $password, false) )
        {
            echo 'login';
            $this->session->start();
            return redirect()->to('inicio');

        }else{
            //echo 'no login';
            redirect('/');
        }



    }

    public function finalizar()
    {
        $this->ionauth->logout();
        $this->session->destroy();
    }

    public function estado()
    {

    }

	public function crear()
    {
        echo base_url();
    }


}
