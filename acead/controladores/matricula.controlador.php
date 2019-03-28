<?php


class ControladorMatricula{

  /*=============================================
  MOSTRAR MODALIDADES
  =============================================*/

  static public function ctrCargarSelectModalidades(){

    $tabla = "tbl_modalidades";

    $respuesta = ModeloMatricula::mdlCargarSelect($tabla);

    return $respuesta;

  }


  
  /*=============================================
	MOSTRAR MATRICULA
	=============================================*/

	static public function ctrMostrarMatricula($item, $valor){

		$tabla = "tbl_matricula";

		$respuesta = ModeloMatricula::MdlMostrarMatricula($tabla, $item, $valor);

		return $respuesta;
	}


  /*=============================================
	MATRICULAR ALUMNO
	=============================================*/
  static public function ctrMatricularAlumno(){

    if(isset($_POST["IdAlumno"])){

    if(isset($_POST["matriculaModalidad"])){

      if(isset($_POST["adicionar1"])){

        if(isset($_POST["adicionar2"])){

          if(isset($_POST["adicionar3"])){

            $tabla = "tbl_matricula";
            $periodo = "1";

            $datos= array("Id_Alumno" => $_POST["IdAlumno"],
                          "Id_Modalidad" => $_POST["matriculaModalidad"],
                          "Id_Orientacion" => $_POST["adicionar1"],
                          "Id_Clase" => $_POST["adicionar2"],
                          "Id_Seccion" => $_POST["adicionar3"],
                          "Id_PeriodoAcm" => $periodo);

            $respuesta = ModeloMatricula::mdlMatriculaAlumno($tabla, $datos);

            //echo "<script type='text/javascript'>alert('neles')</script>";

           if($respuesta == "ok"){

    					echo '<script>

    					swal({

    						type: "success",
    						title: "¡Matricula Exitosa!",
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

            //si no se selecciono seccion
             echo "<script type='text/javascript'>alert('Debe seleccionar una Seccion')</script>";
           }
        }else{

          //si no se selecciono clase
          echo "<script type='text/javascript'>alert('Debe seleccionar una Clase')</script>";
        }
      }else{
        //Si no se ha seleccionado orientacion
        echo "<script type='text/javascript'>alert('Debe seleccionar una Orientacion')</script>";
      }

    }else{
      // Si no se ha elegido MODALIDAD
      echo "<script type='text/javascript'>alert('Debe seleccionar una Modalidad')</script>";
    }




	}

}

/*=============================================
COMPARAR SI MATRICULA EXISTE
=============================================*/

static public function ctrCompMatricula($alumno, $mod, $ori, $clas, $per){

  $tabla = "tbl_matricula";

  $respuesta = ModeloMatricula::MdlMostrarMatricula($tabla, $alumno, $mod, $ori, $clas, $per);

  return $respuesta;
}






}
