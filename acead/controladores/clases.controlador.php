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

	static public function ctrCrearClase(){

		if(isset($_POST["nuevoDescripClase"])){

			if(preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["nuevoDescripClase"])){

				$tabla = "tbl_clases";


				$datos = array("DescripClase" => strtouper( $_POST["nuevoDescripClase"]),
                       "Duracion" => $_POST["nuevoDuracion"]);


				$respuesta = ModeloClases::mdlIngresarClase($tabla, $datos);

				if($respuesta == "ok"){

					echo '<script>

					swal({

						type: "success",
						title: "¡La Clase sido guardada correctamente!",
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
						title: "¡El nombre de la Clase no puede ir vacía o llevar caracteres especiales!",
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
  /*=============================================
  EDITAR CLASES
  =============================================*/

  static public function ctrEditarCLase(){


   if(isset($_POST["editarClase"])){


     if(preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["editarClase"])){

       $tabla = "tbl_clases";

       $datos = array("Id_Clase" => $_POST["editarIdClase"],
                    "DescripClase" => strtoupper($_POST["editarClase"]),
                    "Duracion" => $_POST["nuevoDuracion"]);

       $respuesta = ModeloClases::mdlEditarClase($tabla, $datos);

       if($respuesta == "ok"){

         echo'<script>

         swal({
             type: "success",
             title: "La Clase ha sido editada correctamente",
             showConfirmButton: true,
             confirmButtonText: "Cerrar",
             closeOnConfirm: false
             }).then((result) => {
                 if (result.value) {

                 window.location = "modalidades";

                 }
               })

         </script>';

       }

     }else{

       echo'<script>

         swal({
             type: "error",
             title: "¡El nombre de la Clase no puede ir vacío o llevar caracteres especiales!",
             showConfirmButton: true,
             confirmButtonText: "Cerrar",
             closeOnConfirm: false
             }).then((result) => {
             if (result.value) {

             window.location = "modalidades";

             }
           })

         </script>';

     }

    }

  }


  /*=============================================
  BORRAR CLASE
  =============================================*/

  static public function ctrBorrarClase(){

    if(isset($_GET["idClase"])){


      $tabla = "tbl_clases";
      $datos = $_GET["idClase"];

      $respuesta = ModeloClases::mdlBorrarClase($tabla, $datos);

      if($respuesta == "ok"){

        echo'<script>

        swal({
            type: "success",
            title: "La Clase ha sido borrada correctamente",
            showConfirmButton: true,
            confirmButtonText: "Cerrar",
            closeOnConfirm: false
            }).then((result) => {
                if (result.value) {

                window.location = "modalidades";

                }
              })

        </script>';

      }

    }

  }

  /*=============================================
  MOSTRAR LA MODALIDAD
  =============================================*/

  static public function ctrCargarSelectModalidad(){

    $tabla = "tbl_modalidades";

    $respuesta = ModeloModalidades::mdlCargarSelect($tabla);

    return $respuesta;

  }

  /*=============================================
  MOSTRAR LA ORIENTACION
  =============================================*/

  static public function ctrCargarSelectOrientacion(){

    $tabla = "tbl_orientacion";

    $respuesta = ModeloModalidades::mdlCargarSelect($tabla);

    return $respuesta;

  }




  


}
