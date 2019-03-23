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
  REGISTRO DE CLASES
  =============================================*/

  static public function mdlIngresarClases($tabla, $datos){


    $stmt = ConexionBD::Abrir_Conexion()->prepare("INSERT INTO $tabla (DescripClase, Duracion, Id_orientacion)
                                                  VALUES (:descriclase, :duracion, :orientación)");

    $stmt->bindParam(":descripclase", $datos["DescripClase"], PDO::PARAM_STR);
    $stmt->bindParam(":duracion", $datos["Duracion"], PDO::PARAM_STR);
    $stmt->bindParam(":orientacion", $datos["Id_orientacion"], PDO::PARAM_STR);

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

  static public function mdlEditarModalidad($tabla, $datos){


    $stmt = ConexionBD::Abrir_Conexion()->prepare("UPDATE $tabla SET DescripModalidad =: descripmodalidad1
                                                    WHERE Id_Modalidad = :id");


    $stmt->bindParam(":id", $datos["Id_Modalidad"], PDO::PARAM_STR);
    $stmt->bindParam(":descripmodalidad1", $datos["DescripModalidad"], PDO::PARAM_STR);

    if($stmt->execute()){

      return "ok";

    }else{

      return "error";
      echo "<script type='text/javascript'>alert('neles')</script>";
    }

    $stmt->close();

    $stmt = null;

  }







}
