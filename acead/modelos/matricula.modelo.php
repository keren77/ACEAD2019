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

		 //$stmt = ConexionBD::Abrir_Conexion()->prepare("SELECT * FROM $tabla WHERE Id_modalidad = $valor");

		 $stmt = ConexionBD::Abrir_Conexion()->prepare("SELECT Nombre FROM tbl_orientacion INNER JOIN tbl_mod_orientacion ON tbl_mod_orientacion.Id_Orientacion = tbl_orientacion.Id_orientacion where id_modalidad = $valor");
		 $stmt -> execute();

		 return $stmt -> fetchall();

		 }

	 /*=============================================
 	 MATRICULAR ALUMNO
 	 =============================================*/

 	 static public function mdlMatriculaAlumno($tabla, $datos){
		 //echo "<script type='text/javascript'>alert('sql')</script>";

		 $stmt = ConexionBD::Abrir_Conexion()->prepare("INSERT INTO $tabla (Id_Alumno, Id_Modalidad, Id_Orientacion, Id_Clase, Id_Seccion, Id_PeriodoAcm)
																									 VALUES (:alumno, :modalidad, :orientacion, :clase, :seccion, :periodo)");


		 $stmt->bindParam(":alumno", $datos["Id_Alumno"], PDO::PARAM_INT);
		 $stmt->bindParam(":modalidad", $datos["Id_Modalidad"], PDO::PARAM_INT);
		 $stmt->bindParam(":orientacion", $datos["Id_Orientacion"], PDO::PARAM_INT);
		 $stmt->bindParam(":clase", $datos["Id_Clase"], PDO::PARAM_INT);
		 $stmt->bindParam(":seccion", $datos["Id_Seccion"], PDO::PARAM_INT);
		 $stmt->bindParam(":periodo", $datos["Id_PeriodoAcm"], PDO::PARAM_INT);

		 if($stmt->execute()){

			 return "ok";

		 }else{

			 return "error";

		 }

		 $stmt->close();

		 $stmt = null;

 		 }


 /*=============================================
  CARGAR SELECT
  =============================================*/
  static public function mdlCompMatricula($tabla, $alumno, $mod, $ori, $clas, $per){

    $stmt = ConexionBD::Abrir_Conexion()->prepare("SELECT * FROM $tabla WHERE Id_Alumno = $alumno and Id_Modalidad = $mod and Id_Orientacion = $ori and Id_Clase = $clas and Id_PeriodoAcm = $per");
  	$stmt -> execute();

  	return $stmt -> fetchall();

    }





}
