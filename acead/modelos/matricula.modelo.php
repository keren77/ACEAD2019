<?php

require_once "conexion.php";

class ModeloMatricula{

	/*=============================================
	MOSTRAR MATRÍCULA
	=============================================*/

	static public function MdlMostrarMatricula1($tabla, $item, $valor){


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
	MOSTRAR MATRICULA EN LA PANTALLA DE GESTION
	=============================================*/

	static public function MdlMostrarMatricula($tabla){

			$stmt = ConexionBD::Abrir_Conexion()->prepare("SELECT MA.Id_Matricula as IDMAT,
																										CONCAT(ALU.PrimerNombre,' ',ALU.PrimerApellido) AS Alum,
																										MODA.DescripModalidad as DMOD,
																										ORI.Nombre AS DORI,
																										CLAS.DescripClase AS DCLASE,
																										SEC.DescripSeccion AS DSEC,
																										PER.DescripPeriodo AS DPER
																										FROM tbl_matricula MA,
																										tbl_alumnos ALU,
																										tbl_modalidades MODA,
																										tbl_orientacion ORI,
																										tbl_clases CLAS,
																										tbl_secciones SEC,
																										tbl_periodoacademico PER
																										WHERE(ALU.Id_Alumno=MA.Id_Alumno)
																										AND (MODA.Id_Modalidad=MA.Id_Modalidad)
																										AND (ORI.Id_orientacion=MA.Id_Orientacion)
																										AND (CLAS.Id_Clase=MA.Id_Clase)
																										AND (SEC.Id_Seccion=MA.Id_Seccion)
																										AND(PER.Id_PeriodoAcm=MA.Id_PeriodoAcm)");

			$stmt -> execute();

			return $stmt -> fetchAll();

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

    $stmt = ConexionBD::Abrir_Conexion()->prepare("SELECT Id_Matricula FROM tbl_matricula
																									WHERE Id_Alumno = $alumno
																									AND Id_Modalidad = $mod
																									AND Id_Orientacion = $ori
																									AND Id_Clase = $clas
																									AND Id_Seccion = $sec
																									AND Id_PeriodoAcm = $per");
  	$stmt -> execute();

		if($stmt->execute()){

  	return $stmt -> fetch();

		}else{

			echo "<script type='text/javascript'>alert('error sql')</script>";

    }


	}


}



	$funcion = filter_input(INPUT_GET, 'caso');

	switch ($funcion){

	    case 'verificarmatricula':
	  	metodo_verificarmatricula();
	    break;
	}

	function metodo_verificarmatricula(){
	    $alumno = 'Id_Alumno';
			$mod = 'Id_Modalidad';
			$ori = 'Id_Orientacion';
			$clas = 'Id_Clase';
			$sec = 'Id_Seccion';
			$per = 'Id_PeriodoAcm';
			$tabla = "tbl_matricula";

			//echo "<script type='text/javascript'>alert('$alumno');</script>";

	    $stmt = ConexionBD::Abrir_Conexion()->prepare("SELECT Id_Matricula FROM tbl_matricula
																										WHERE Id_Alumno = $alumno
																										AND Id_Modalidad = $mod
																										AND Id_Orientacion = $ori
																										AND Id_Clase = $clas
																										AND Id_Seccion = $sec
																										AND Id_PeriodoAcm = $per");

			$stmt->execute();

		 	$resultado = $stmt->fetch();

	    echo json_encode($resultado);


	}
