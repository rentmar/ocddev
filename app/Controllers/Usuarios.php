<?php
namespace App\Controllers;
use App\Models\Departamento_model;

class Usuarios extends BaseController
{
    protected $ionauth;
    protected $session;
    protected $departamento;

    public function __construct()
    {
        $this->ionauth = new \IonAuth\Libraries\IonAuth();
        helper(['form', 'url']);
        $this->departamento = new Departamento_model();
    }

    public function index()
    {

        return view('usuarios/vindex_usuarios');

    }

    public function crearUsuario()
    {
        $data['grupos'] = $this->ionauth->groups()->result();
        $data['departamentos'] = $this->departamento->leerDepartamentos();
        return view('usuarios/vformulario_usuario', $data);

    }

    public function procesarCrear()
    {
        if($this->request->getMethod() == "post" )
        {
            $validar =  \Config\Services::validation();

            $validar->setRules([
                'usuario' => [
                    'label' => 'Usuario',
                    'rules' => 'required|is_unique[users.username]',
                ],
                'nombre' => [
                    'label' => 'Usuario',
                    'rules' => 'required',
                ],
                'apellido' => [
                    'label' => 'Usuario',
                    'rules' => 'required',
                ],
                'carnet' => [
                    'label' => 'Carnet de Identidad',
                    'rules' => 'required|numeric',
                ],
                'email' => [
                    'label' => 'Email',
                    'rules' => 'required|valid_email|is_unique[users.email]',
                ],
                'password' => [
                    'label' => 'Contraseña',
                    'rules' => 'required',
                ],
                'password1' => [
                    'label' => 'Comprobar contraseña',
                    'rules' => 'required|matches[password]',
                ],
                'latitud' => [
                    'label' => 'Latitud',
                    'rules' => 'required|numeric',
                ],
                'longitud' => [
                    'label' => 'Longitud',
                    'rules' => 'required|numeric',
                ],


            ]);

            if(!$validar->withRequest($this->request)->run()){
                echo "Error";

            }else{

                //Estructurar los datos
                $usuario = $this->request->getPost('usuario');
                $password = $this->request->getPost('password');
                $email = $this->request->getPost('email');
                $datos_extra = [
                    'first_name' => $this->request->getPost('nombre'),
                    'last_name' => $this->request->getPost('apellido'),
                    'carnet_identidad' => $this->request->getPost('carnet'),
                    'departamento' => $this->request->getPost('departamento'),
                    'latitud' => $this->request->getPost('latitud'),
                    'longitud' => $this->request->getPost('longitud'),
                ];

                $grupo = [$this->request->getPost('grupo'),];
                if(!$this->ionauth->register($usuario, $password, $email, $datos_extra, $grupo)){
                    echo "Error de cracion";
                }else{
                    echo "Usuario Creado";
                }
            }
        }else{
            return view('usuarios/vformulario_usuario');
        }
    }

    public function editarUsuario($idusuario)
    {
        $usuario = $this->ionauth->user($idusuario)->row();
        $data['usuario'] = $usuario;
        $data['grupos'] = $this->ionauth->groups()->result();
        $data['departamentos'] = $this->departamento->leerDepartamentos();
        return view('usuarios/vformulario_usuario_editar', $data);
    }

    public function procesarEditar()
    {
        if($this->request->getMethod() == "post" )
        {
            $validar =  \Config\Services::validation();

            $validar->setRules([
                'nombre' => [
                    'label' => 'Usuario',
                    'rules' => 'required',
                ],
                'apellido' => [
                    'label' => 'Usuario',
                    'rules' => 'required',
                ],
                'carnet' => [
                    'label' => 'Carnet de Identidad',
                    'rules' => 'required|numeric',
                ],
                'latitud' => [
                    'label' => 'Latitud',
                    'rules' => 'required|numeric',
                ],
                'longitud' => [
                    'label' => 'Longitud',
                    'rules' => 'required|numeric',
                ],
            ]);

            if(!$validar->withRequest($this->request)->run()){
                echo "Error";

            }else{
                $idusuario = $this->request->getPost('idusuario');

                //Estructurar los datos
                $datos_extra = [
                    'first_name' => $this->request->getPost('nombre'),
                    'last_name' => $this->request->getPost('apellido'),
                    'carnet_identidad' => $this->request->getPost('carnet'),
                    'departamento' => $this->request->getPost('departamento'),
                    'latitud' => $this->request->getPost('latitud'),
                    'longitud' => $this->request->getPost('longitud'),
                ];

                if(!$this->ionauth->update($idusuario, $datos_extra)){
                    echo "Error de edicion";
                }else{
                    echo "Usuario editado";
                }
            }
        }else{
            return view('usuarios/vformulario_usuario_editar');
        }
    }
}
