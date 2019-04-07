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

    var datos = {
        "Id_Alumno": alumno,
        "Id_Modalidad": modalidad,
        "Id_Orientacion": orientacion,
        "Id_Clase": clase,
        "Id_Seccion": secc
      };

   $.ajax({

        url:"../acead/modelos/matricula.modelo.php?caso=verificarmatricula",
        data: datos,
        type:"post",
        dataType: 'json',
        success:function(data){
            //alert(data);
            //Aqui se filtra lo que se quiera hacer si recibe 1 permite matricular, si recibe 0 no permite la matricula
            if(data === 1 || data === '1'){
                //Codigo para mandar a matricular
            }else{
                //Codigo para evitar la matricula
                alert('El Alumno ya se encuentra matriculado en esa seccion.');
                $("#matriculaModalidad").val("");
                $("#adicionar1").empty();
                $("#adicionar2").empty();
                $("#adicionar3").empty();

            }
        },
        error:function(xhr, status){
            alert("¡Algo salió mal! : " + xhr + "(" + status + ")");
        }

    });
});

function envia_matricula(){

}

/*=============================================
ELIMINAR MATRICULA
=============================================*/
$(".tablas").on("click", ".btnEliminarMatricula", function(){

  var idMatricula = $(this).attr("idMatricula");


  swal({
    title: '¿Está seguro de borrar la matricula?',
    text: "¡Si no lo está puede cancelar la accíón!",
    type: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      cancelButtonText: 'Cancelar',
      confirmButtonText: 'Si, borrar matricula!'
  }).then((result)=>{

    if(result.value){


      window.location = "index.php?ruta=gestionacademica&idMatricula="+idMatricula;


    }

  })

})
