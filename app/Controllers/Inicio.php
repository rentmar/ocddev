<?php

namespace App\Controllers;

class Inicio extends BaseController
{
    protected $ionauth;
    protected $session;

    public function __construct()
    {
        $this->ionauth = new \IonAuth\Libraries\IonAuth();
        helper(['form', 'url']);
    }

    public function index()
    {
        echo "pagina inicio";
        if($this->ionauth->loggedIn()){
            echo "<br";
            echo "Sesion activa";
        }

    }

}
