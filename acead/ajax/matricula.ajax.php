<?php

require_once "../controladores/matricula.controlador.php";
require_once "../modelos/matricula.modelo.php";



if (isset($_GET["id"])) {

    $editar = new AjaxMatricula();
    $editar->id = $_GET["id"];
    $editar->ajaxOrientaciones();
}

/*=============================================
VALIDAR NO REPETIR MATRICULA
=============================================*/

if(isset( $_POST["IdAlumno"])){

 $validarMatricula = new AjaxMatricula();
 $validarMatricula -> $validarMatricula = $_POST["IdAlumno"];
 $validarMatricula -> ajaxValidarMatricula();

}

class AjaxMatricula{

 public $id;

 public function ajaxOrientaciones(){

	 $tabla = "tbl_orientacion";
	 $valor = $this->id;

	 $respuesta = ModeloMatricula::mdlCargarOrientacion($tabla, $valor);

		$con = array();
 		$n=0;

 	while($row = $respuesta->fetch_row()){
 		$con[$n]['Id_Orientacion']= $row[0];
 		$con[$n]['Orientacion']=$row[1];
 		$n++;

 	}

 	echo json_encode($con, JSON_UNESCAPED_UNICODE);

  }

 /*=============================================
 VALIDAR NO REPETIR USUARIO
 =============================================*/

 public $validarMatricula;

 public function ajaxValidarMatricula(){

   $alumno = "IdAlumno";
   $mod = "Id_Modalidad";
   $ori = "Id_Orientacion";
   $clas = "Id_Clase";
   $per = "Id_PeriodoAcm"

   $valor = $this->validarMatricula;

   $respuesta = ControladorUsuarios::ctrMostrarUsuarios($alumno, $mod, $ori, $clas, $per);

   echo json_encode($respuesta);

 }


}
