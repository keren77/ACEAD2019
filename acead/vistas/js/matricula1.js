var modalidadID, orientacionID, claseID, seccionID;

$('#matriculaModalidad').change(function(){
    modalidadID = $(this).val();

    rellenaOrientacion(modalidadID);
});

$('#adicionar1').click(function(){
    //alert($('select[name=adicionar1] option:selected').text());
    orientacionID = $('select[name=adicionar1] option:selected').val();
    rellenarClases(orientacionID);
});
$('#adicionar2').click(function(){
    //alert($('select[name=adicionar1] option:selected').text());
    claseID = $('select[name=adicionar2] option:selected').val();
    rellenarSecciones(claseID);

});

function rellenaOrientacion(idm){

    param1 = {
        "idmodalidad": idm
    };

    $.ajax({
        type: "POST",
        url: "../acead/modelos/alumnos.modelo.php?caso=cargaorientacion",
        data: param1,
        dataType: 'json',
        success: function(data){
            $('#adicionar1').empty();
            $.each(data, function(i, item){
                //alert(item.ID);
                $('#adicionar1').append('<option value="'+item.ID+'">'+item.nombre+'</option>');
            });
        },
        error: function(xhr, status){
            alert("ERROR: " + xhr + " >> " + status);
        }
    });
}

function rellenarClases(ido){
    param1 = {
        "idorientacion": ido
    };

    $.ajax({
        type: "POST",
        url: "../acead/modelos/alumnos.modelo.php?caso=cargaclases",
        data: param1,
        dataType: 'json',
        success: function(data){
            $('#adicionar2').empty();
            $.each(data, function(i, item){
                //alert(item.ID);
                $('#adicionar2').append('<option value="'+item.IDC+'">'+item.DC+'</option>');
            });
        },
        error: function(xhr, status){
            alert("ERROR: " + xhr + " >> " + status);
        }
    });
}
function rellenarSecciones(idc){

    param1 = {
        "idclase": idc
    };

    $.ajax({
        type: "POST",
        url: "../acead/modelos/alumnos.modelo.php?caso=cargasecciones",
        data: param1,
        dataType: 'json',
        success: function(data){
            //alert(data);
            $('#adicionar3').empty();
            $.each(data, function(i, item){
                //alert(item.ID);
                $('#adicionar3').append('<option value="'+item.ISE+'">'+item.DS+'</option>');
            });
        },
        error: function(xhr, status){
            alert("ERROR: " + xhr + " >> " + status);
        }
    });
}



/*=============================================
REVISAR SI EL USUARIO YA ESTÁ REGISTRADO
=============================================*/

$("#adicionar3").change(function(){
//alert("Clase Matriculada");
	alumno = $('#IdAlumno').val();
  modalidad = $('#matriculaModalidad').val();
  orientacion = $('#adicionar1').val();
  clase = $('#adicionar2').val();
  secc = $('#adicionar3').val();
  periodo = $('1').val();
  //alert(modalidad);
  var datos = {
      "Id_Alumno": alumno,
      "Id_Modalidad": modalidad,
      "Id_Orientacion": orientacion,
      "Id_Clase": clase,
      "Id_Seccion": secc,
      "Id_PeriodoAcm": periodo
    };
    //alert(datos["Id_Alumno"]);

   $.ajax({

	    url:"../acead/modelos/matricula.modelo.php?caso=verificarmatricula",
      //url:"ajax/matricula.ajax.php",
      method:"POST",
	    data: datos,
	    cache: false,
	    contentType: false,
	    processData: false,
	    dataType: "json",
	    success:function(resultado){

        alert(resultado);
	    	if(resultado){
          //alert(resultado);
          alert('El alumno ya se encuentra matriculado en esta seccion');
	    		//$("#row").parent().after('<br><div class="alert alert-danger">El alumno ya se encuentra matriculado en esta seccion.</div>');
          //alert("Clase ya fue Matriculada para este Alumno");
	    		//$("#matriculaModalidad").val("");
          //$("#adicionar1").val("");
          //$("#adicionar2").val("");
          //$("#adicionar3").val("");

	    	}

	    }

	})
})
