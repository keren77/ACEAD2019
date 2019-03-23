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



}
