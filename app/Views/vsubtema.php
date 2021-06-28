<!DOCTYPE html>
<html>
	SubTema a : <?php $reltema=5;$idsubtema=1; $ed=base_url()."/SubTema/editarSubTema/".$idsubtema;
	$ins=base_url()."/SubTema/agregarSubTema";$ir=$ed;?>
	<br>
	</br>
	<form action=" <?php echo $ir;?>" method="post">
		<?php echo $ir;?><br></br>
		<label for="nombre_tema">Nombre SubTema:</label>
		<input type="text" id="nombre_subtema" name="nombre_subtema">
		<input type="hidden" id="rel_idtema" name="rel_idtema" value="<?php echo $reltema;?>"><br><br>
		<input type="submit" value="Accion">
	</form>
</html>