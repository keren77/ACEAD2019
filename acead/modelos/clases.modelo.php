<?php

require_once "conexion.php";

class ModeloClases{

  /*=============================================
  MOSTRAR CLASES
  =============================================*/

  static public function MdlMostrarClases($tabla, $item, $valor){

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
  REGISTRO DE MODALIDAD Y ORIENTACION DE LA CLASE
  =============================================*/

  static public function mdlIngresarClaseOrientaModali($tabla, $datos){

    $stmt = ConexionBD::Abrir_Conexion()->prepare("INSERT INTO $tabla (Id_Modalidad, Id_Orientacion)
                                                  VALUES (:idmodalidad, :idorientacion)");

    $stmt->bindParam(":idmodalidad", $datos["Id_Modalidad"], PDO::PARAM_STR);
    $stmt->bindParam(":idorientacion", $datos["Id_Orientacion"], PDO::PARAM_STR);

    if($stmt->execute()){

      return "ok";

    }else{

      return "error";
      echo "<script type='text/javascript'>alert('neles')</script>";
    }

    $stmt->close();

    $stmt = null;

  }

  /*=============================================
  REGISTRO DE ORIENTACION Y CLASE
  =============================================*/

  static public function mdlIngresarClaseOrientacion($tabla, $datos){

    $stmtA = ConexionBD::Abrir_Conexion()->prepare("SELECT MAX(CLA.id_clase) AS IDCLASE FROM tbl_clases CLA");
    $stmtA->execute();
    $resultadoA = $stmtA->fetchAll(PDO::FETCH_BOTH);
    $idult = $resultadoA[0]['IDCLASE'];
    //echo "<script type='text/javascript'>alert('$idult')</script>";
    //$idultclase = $idultclase++;

    $stmt = ConexionBD::Abrir_Conexion()->prepare("INSERT INTO $tabla (Id_Orientacion, Id_Clases)
                                                  VALUES (:idorientacion, :idclase)");

    $stmt->bindParam(":idorientacion", $datos["Id_Orientacion"], PDO::PARAM_STR);
    $stmt->bindParam(":idclase", $idult, PDO::PARAM_STR);

    if($stmt->execute()){

      return "ok";

    }else{

      return "error";

    }

    $stmt->close();

    $stmt = null;

  }


  /*=============================================
  REGISTRO DE CLASES
  =============================================*/

  static public function mdlIngresarClases($tabla, $datos){
  //echo "<script type='text/javascript'>alert('neles')</script>";

    $stmt = ConexionBD::Abrir_Conexion()->prepare("INSERT INTO $tabla (DescripClase, Duracion)
                                                  VALUES (:descripclase, :duracion)");

    $stmt->bindParam(":descripclase", $datos["DescripClase"], PDO::PARAM_STR);
    $stmt->bindParam(":duracion", $datos["Duracion"], PDO::PARAM_STR);

    if($stmt->execute()){

      return "ok";

    }else{

      return "error";
      echo "<script type='text/javascript'>alert('neles')</script>";
    }

    $stmt->close();

    $stmt = null;

  }

  /*=============================================
  EDITAR CLASES
  =============================================*/

  static public function mdlEditarClaseOrientaModali($tabla, $datos){


    $stmt = ConexionBD::Abrir_Conexion()->prepare("UPDATE $tabla SET Id_Modalidad =: idmodalidad,
                                                                     Id_Orientacion =: orientacion,
                                                    WHERE Id_Clase = :id");


    $stmt->bindParam(":id", $datos["Id_Clase"], PDO::PARAM_STR);
    $stmt->bindParam(":descripclase", $datos["DescripClase"], PDO::PARAM_STR);
    $stmt->bindParam(":duracion", $datos["Duracion"], PDO::PARAM_STR);

    if($stmt->execute()){

      return "ok";

    }else{

      return "error";
      echo "<script type='text/javascript'>alert('neles')</script>";
    }

    $stmt->close();

    $stmt = null;

  }

  /*=============================================
  ACTUALIZAR MODALIDAD
  =============================================*/

  static public function mdlActualizarModalidad($tabla, $item1, $valor1, $item2, $valor2){

    $stmt = ConexionBD::Abrir_Conexion()->prepare("UPDATE $tabla SET $item1 = :$item1 WHERE $item2 = :$item2");

    $stmt -> bindParam(":".$item1, $valor1, PDO::PARAM_STR);
    $stmt -> bindParam(":".$item2, $valor2, PDO::PARAM_STR);

    if($stmt -> execute()){

      return "ok";

    }else{

      return "error";
      echo "<script type='text/javascript'>alert('neles')</script>";

    }

    $stmt -> close();

    $stmt = null;

  }

  /*=============================================
  BORRAR CLASE
  =============================================*/

  static public function mdlBorrarClase($tabla, $datos){

    $stmt = ConexionBD::Abrir_Conexion()->prepare("DELETE FROM tbl_clases WHERE Id_Clase = :id");

    $stmt -> bindParam(":id", $datos, PDO::PARAM_INT);


    if($stmt -> execute() ){

      return "ok";



    }else{

      return "error";

    }

    $stmt -> close();

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







}
