<!DOCTYPE html>
<html>
	Actor a : <?php $idtipo=5; echo base_url()."/TipoMedio/editarTipoMedio/".$idtipo;?>
	base_url()."/TipoMedio/agregarTipoMedio";
	<br>
	</br>
	<form action=" <?php echo base_url()."/TipoMedio/editarTipoMedio/".$idtipo;?>" method="post">
		<label for="nombre_tipo">Nombre Tipo Medio:</label>
		<input type="text" id="nombre_tipo" name="nombre_tipo"><br><br>
		<input type="submit" value="Accion">
	</form>
</html>