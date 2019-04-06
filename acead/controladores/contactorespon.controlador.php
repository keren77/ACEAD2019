<?php

class ControladorContactoRespon{

	/*=============================================
	REGISTRO DE CONTACTO
	=============================================*/

	static public function ctrCrearContactoRespon(){

		if(isset($_POST["nuevoNombre1"])){

			if(preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["nuevoNombre1"])){


				$tabla = "tbl_contrespon";


				$datos = array("Id_Alumno" => $_POST["editarAlumno"],
					           "PrimerNombre" => strtoupper($_POST["nuevoNombre1"]),
										 "PrimerApellido"	=> strtoupper( $_POST["nuevoApellido1"]),
							       "DescripContact"	=> strtoupper( $_POST["nuevoContacto!"]),
                     "Telefono" => $_POST["nuevoTelefono"]);

				$respuesta = ModeloContactoRespon::mdlIngresarContactoRespon($tabla, $datos);

				if($respuesta == "ok"){

					echo '<script>

					swal({

						type: "success",
						title: "¡El Contacto ha sido guardado correctamente!",
						showConfirmButton: true,
						confirmButtonText: "Cerrar",
						closeOnConfirm: false

					}).then((result)=>{

						if(result.value){

							window.location = "alumnos";

						}

					});


					</script>';


				}


			}else{

				echo '<script>

					swal({

						type: "error",
						title: "¡El Contacto no puede ir vacío o llevar caracteres especiales!",
						showConfirmButton: true,
						confirmButtonText: "Cerrar",
						closeOnConfirm: false

					}).then((result)=>{

						if(result.value){

							window.location = "alumnos";

						}

					});


				</script>';

			}


		}


	}

	/*=============================================
	MOSTRAR CONTACTO RESPONSABLE
	=============================================*/

	static public function ctrMostrarContactoRespon($item, $valor){

		$tabla = "tbl_contrespon";

		$respuesta = ModeloContactoRespon::MdlMostrarContactoRespon($tabla, $item, $valor);

		return $respuesta;
	}

}
