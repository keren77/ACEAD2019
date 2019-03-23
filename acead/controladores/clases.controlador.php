<?php

class ControladorClases{

  /*=============================================
  MOSTRAR CLASES
  =============================================*/

  static public function ctrMostrarClases($item, $valor){

    $tabla = "tbl_clases";

    $respuesta = ModeloClases::MdlMostrarClases($tabla, $item, $valor);

    return $respuesta;
  }


  /*=============================================
	REGISTRO DE CLASES
	=============================================*/

	static public function ctrCrearClases(){

		if(isset($_POST["nuevoDescripClase"])){

			if(preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["nuevoDescripClase"])){

				$tabla = "tbl_clases";


				$datos = array("DescripClase" => strtouper( $_POST["nuevoDescripClase"]),
                       "Duracion" => $_POST["nuevoDuracion"],
                       "Id_modalidad" => $_POST["nuevoIdModalidad"]);


				$respuesta = ModeloClases::mdlIngresarClase($tabla, $datos);

				if($respuesta == "ok"){

					echo '<script>

					swal({

						type: "success",
						title: "¡La Modalidad sido guardado correctamente!",
						showConfirmButton: true,
						confirmButtonText: "Cerrar",
						closeOnConfirm: false

					}).then((result)=>{

						if(result.value){

							window.location = "modalidades";

						}

					});


					</script>';


				}


			}else{

				echo '<script>

					swal({

						type: "error",
						title: "¡El nombre de la Modalidad no puede ir vacía o llevar caracteres especiales!",
						showConfirmButton: true,
						confirmButtonText: "Cerrar",
						closeOnConfirm: false

					}).then((result)=>{

						if(result.value){

							window.location = "modalidades";

						}

					});


				</script>';

			}


		}


	}




}
