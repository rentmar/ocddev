<!DOCTYPE html>
<html>
	Actor a : <?php $idactor=11; echo base_url()."/Actor/editarActor/".$idactor;?>
	base_url()."/Actor/agregarActor";
	<br>
	</br>
	<form action=" <?php echo base_url()."/Actor/editarActor/".$idactor;?>" method="post">
		<label for="nombre_actor">Nombre Actor:</label>
		<input type="text" id="nombre_actor" name="nombre_actor"><br><br>
		<input type="submit" value="Accion">
	</form>
</html>