<?php

require_once "conexion.php";

class ModeloMatricula{

	/*=============================================
	MOSTRAR MATRÍCULA
	=============================================*/

	static public function MdlMostrarMatricula($tabla, $item, $valor){


		if($item != null){

			$stmt = ConexionBD::Abrir_Conexion()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = ConexionBD::Abrir_Conexion()->prepare("SELECT * FROM $tabla");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}


		$stmt -> Cerrar_Conexion();

		$stmt = null;

	}



 /*=============================================
  CARGAR SELECT
  =============================================*/
  static public function mdlCargarSelect($tabla){

    $stmt = ConexionBD::Abrir_Conexion()->prepare("SELECT * FROM $tabla");
  	$stmt -> execute();

  	return $stmt -> fetchall();

    }

	/*=============================================
	 CARGAR ORIENTACIONES
	 =============================================*/

	 static public function mdlCargarOrientacion($tabla, $valor){

		 $stmt = ConexionBD::Abrir_Conexion()->prepare("SELECT * FROM $tabla WHERE Id_modalidad = $valor");
		 $stmt -> execute();

		 return $stmt -> fetchall();

		 }





}
