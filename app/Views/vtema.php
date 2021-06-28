<!DOCTYPE html>
<html>
	Tema a : <?php $idtema=11; $ed=base_url()."/Tema/editarTema/".$idtema;
	$ins=base_url()."/Tema/agregarTema";$ir=$ed;?>
	<br>
	</br>
	<form action=" <?php echo $ir;?>" method="post">
		<?php echo $ir;?><br></br>
		<label for="nombre_tema">Nombre Tema:</label>
		<input type="text" id="nombre_tema" name="nombre_tema"><br><br>
		<input type="submit" value="Accion">
	</form>
</html>