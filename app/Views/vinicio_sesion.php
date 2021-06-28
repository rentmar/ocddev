<!DOCTYPE html>
	<html lang="es">
		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<meta http-equiv="X-UA-Compatible" content="ie=edge">
			<title> UI Login </title>
			<style>
				body {
					background-color:#d3d3d3;
				}
				
				#Cabecera {
					background-color:#7f182b;
					padding:1px;
				}
				
				div #contenedor_vacío{
					background-color:#ffffff;
					color:#ffffff;
					width:100%;
					height:40px;
				}
				div #esquinas_redondeadas {
					max-width: 800px;
					margin-left:auto;
					margin-right:auto;
				}
				#Título_cabecera {
					color:#ffffff;
				}
				h3 {
					font-family: Verdana;
					line-height:140%;
					text-align:center;
				}
				#Título_central {
				}
				#Título_secundario {
					text-align:left;
				}
				p {
					text-align:center;
					font-family: Helvetica;
					line-height:120%;
				}
				#Caja_principal {
					background-color:#ffffff;
					padding-top:5px;
					padding-bottom:50px;
				}
				#Caja_secundaria {
					background-color:#ffffff;
					margin-top:1px;
					border-radius:5px;
					padding-top:5px;
					padding-right:40px; 
					padding-bottom:20px;
					padding-left:20px;
				}
				input {
					padding:10px;
				}
				.form-group{
					font-family:Verdana;
					font-weight:Bold;
					font-size:12px;
				}
				#N_usuario {
					width:100%;
					background-color:#e6edf7;
				}
				#Contraseña {
					width: 100%;
					background-color:#e6edf7;
				}
				#INICIAR {
					background-color:#474142;
					color:#ffffff;
					font-family: Verdana;
					border-radius:10px;
				}
				.red {
					color:#ff0000;
				}
			</style>
		</head>
		<body>
			<div>
				<div id="Cabecera">
					<img src="<?php echo base_url().'/app/Views/imagenes/LogoCD.jpg';?>" alt="Logo CD">
					
					<h3 id="Título_cabecera"> Elecciones subnacionales 2021 - Bolivia </h3>
				</div>
				<div id="contenedor_vacío">	</div>
			<div>
			<br>
			<div id="esquinas_redondeadas">
				<div id="Caja_principal">
					<h3 id="Título_central"> Observación Ciudadana de la Democracia </h3>
					<p> Le damos la bievenida a esta aplicación desarrollada para la observación electoral. <br><br> Para ingresar, escriba su código de usuario y su contraseña. </p> 
				</div>

				<div id="Caja_secundaria" class="contenedor">	
					<h3 id="Título_secundario"> Inicio de sesión </h3>
					<form>
						<label for="N_usuario" class="form-group"> Nombre de usuario </label> 
						<span class="red"> * </span>
						<br>
						<input type="text" id="N_usuario" name="N_usuario" required>
						<br><br>
						<label for="Contraseña" class="form-group"> Contraseña </label>
						<span class="red"> * </span>
						<br>
						<input type="password" id="Contraseña" name="Contraseña" required>
						<br><br>
						<input type="submit" id="INICIAR" value="INICIAR SESIÓN">
					</form>
				</div>
			</div>
		</body>
	</html>