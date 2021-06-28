<!DOCTYPE html>
<html>
	Departamento a : <?php $iddepto=3; echo base_url()."/Departamento/editarDepartamento/".$iddepto;?>
	base_url()."/Departamento/agregarDepartamento";
	<br>
	</br>
	<form action=" <?php echo base_url()."/Departamento/editarDepartamento/".$iddepto;?>" method="post">
		<label for="nombre_departamento">Nombre Departamento:</label>
		<input type="text" id="nombre_departamento" name="nombre_departamento"><br><br>
		<input type="submit" value="Accion">
	</form>
</html>