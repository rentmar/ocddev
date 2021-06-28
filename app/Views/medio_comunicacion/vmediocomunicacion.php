<!DOCTYPE html>
<html>
	Medio a : <?php $idtipomedio=1;$idmedio=9; echo base_url()."/MedioComunicacion/editarMedioComunicacion/".$idmedio;?>
	base_url()."/MedioComunicacion/agregarMedioComunicacion";
	<br>
	</br>
	<form action=" <?php echo base_url()."/MedioComunicacion/agregarMedioComunicacion";?>" method="post">
		<label for="nombre_medio">Nombre Medio:</label>
		<input type="text" id="nombre_medio" name="nombre_medio"><br><br>
		<input type="hidden" id="rel_idtipomedio" name="rel_idtipomedio" value="<?php echo $idtipomedio?>">
		<input type="submit" value="Accion">
	</form>
</html>